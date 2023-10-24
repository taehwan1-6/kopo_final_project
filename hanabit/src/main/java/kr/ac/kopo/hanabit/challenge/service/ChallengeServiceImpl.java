package kr.ac.kopo.hanabit.challenge.service;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.kopo.hanabit.challenge.dto.ChallengeLogDto;
import kr.ac.kopo.hanabit.challenge.mapper.ChallengeMapper;
import kr.ac.kopo.hanabit.hanamoney.dto.HanamoneyDto;
import kr.ac.kopo.hanabit.hanamoney.dto.HanamoneyTransactionLogDto;
import kr.ac.kopo.hanabit.hanamoney.mapper.HanamoneyMapper;
import kr.ac.kopo.hanabit.member.dto.MemberDto;
import kr.ac.kopo.hanabit.member.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ChallengeServiceImpl {

	private final ChallengeMapper challengeMapper;
	private final MemberMapper memberMapper;
	private final HanamoneyMapper hanamoneyMapper;
	@Value("${ncp.api.ocr.url}")
	private String ncpApiOcrURL;
	@Value("${ncp.api.ocr.secret}")
	private String ncpApiOcrSecret;
	@Value("${upload.path.challenge.auth}")
	private String uploadPath;

	private static void writeMultiPart(OutputStream out, String jsonMessage, File file, String boundary) throws
		IOException {
		StringBuilder sb = new StringBuilder();

		sb.append("--").append(boundary).append("\r\n");
		sb.append("Content-Disposition:form-data; name=\"message\"\r\n\r\n");
		sb.append(jsonMessage);
		sb.append("\r\n");

		out.write(sb.toString().getBytes("UTF-8"));
		out.flush();

		if (file != null && file.isFile()) {
			out.write(("--" + boundary + "\r\n").getBytes("UTF-8"));
			StringBuilder fileString = new StringBuilder();
			fileString
				.append("Content-Disposition:form-data; name=\"file\"; filename=");
			fileString.append("\"" + file.getName() + "\"\r\n");
			fileString.append("Content-Type: application/octet-stream\r\n\r\n");
			out.write(fileString.toString().getBytes("UTF-8"));
			out.flush();

			try (FileInputStream fis = new FileInputStream(file)) {
				byte[] buffer = new byte[8192];
				int count;
				while ((count = fis.read(buffer)) != -1) {
					out.write(buffer, 0, count);
				}
				out.write("\r\n".getBytes());
			}

			out.write(("--" + boundary + "--\r\n").getBytes("UTF-8"));
		}
		out.flush();
	}

	public List<Map<String, Object>> challengeLogMap(String memberEmail) {
		List<Map<String, Object>> challengeLogList = challengeMapper.selectChallengeLogMap(memberEmail);
		return challengeLogList;
	}

	@Transactional
	public void insertChallengeLog(ChallengeLogDto challengeLogDto, MemberDto currentMember) {

		// 1. 챌린지 기록에 들어감
		challengeLogDto.setChallengeLogDate(LocalDateTime.now());
		challengeMapper.insertChallengeLog(challengeLogDto);

		// 2. 하나머니에 포인트 돈 업데이트
		HanamoneyDto hanamoneyDto = hanamoneyMapper.selectByEmail(currentMember.getEmail());
		hanamoneyMapper.updateBalance(
			hanamoneyDto.getBalance() + challengeLogDto.getChallengePoint(),
			currentMember.getEmail());

		// 3. 하나머니 기록에 들어감
		HanamoneyTransactionLogDto hanamoneyTransactionLogDto
			= HanamoneyTransactionLogDto.builder()
			.transDate(LocalDateTime.now())
			.memberEmail(currentMember.getEmail())
			.transAmount(challengeLogDto.getChallengePoint())
			.transBalance(hanamoneyDto.getBalance() + challengeLogDto.getChallengePoint())
			.transType("입금")
			.transCategory("챌린지 적립")
			.transName("챌린지 적립")
			.build();
		hanamoneyMapper.insertTransactionLog(hanamoneyTransactionLogDto);

	}

	// 1만보 사진 인증
	public String walkChallengeOCR(String fileName) {
		String apiURL = ncpApiOcrURL;
		String secretKey = ncpApiOcrSecret;
		String imageFile = uploadPath + "/" + fileName; // 파일 입력

		try {
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setUseCaches(false);
			con.setDoInput(true);
			con.setDoOutput(true);
			con.setReadTimeout(30000);
			con.setRequestMethod("POST");
			String boundary = "----" + UUID.randomUUID().toString().replaceAll("-", "");
			con.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);
			con.setRequestProperty("X-OCR-SECRET", secretKey);

			JSONObject json = new JSONObject();
			json.put("version", "V2");
			json.put("requestId", UUID.randomUUID().toString());
			json.put("timestamp", System.currentTimeMillis());
			JSONObject image = new JSONObject();
			image.put("format", "jpg");
			image.put("name", "demo");
			JSONArray images = new JSONArray();
			images.put(image);
			json.put("images", images);
			String postParams = json.toString();

			con.connect();
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			long start = System.currentTimeMillis();
			File file = new File(imageFile);
			writeMultiPart(wr, postParams, file, boundary);
			wr.close();

			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}

			br.close();
			System.out.println(response);
			JSONObject jsonResponse = new JSONObject(response.toString());
			JSONArray imagesArray = jsonResponse.getJSONArray("images");
			JSONObject firstImage = imagesArray.getJSONObject(0);
			JSONArray fieldsArray = firstImage.getJSONArray("fields");

			if (fieldsArray.length() > 1) {  // 배열에 최소 2개의 요소가 있는지 확인
				JSONObject secondField = fieldsArray.getJSONObject(1);
				String valueAtPosition = secondField.getString("inferText");
				System.out.println("Value at the desired position: " + valueAtPosition);

				// 문자열에서 숫자만 추출하고 나머지 문자 제거
				String numericValue = valueAtPosition.replaceAll("[^0-9]", "");

				try {
					int valueInt = Integer.parseInt(numericValue);
					if (valueInt >= 10000) {
						return "성공";
					}
				} catch (NumberFormatException e) {
					// 정수로 변환할 수 없는 경우 처리
					System.out.println("숫자로 변환할 수 없습니다: " + numericValue);
					return "실패";
				}

			} else {
				System.out.println("Not enough elements in the fields array");
				return "실패";
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return "실패";
	}

	// 영수증 사진 인증
	public String fileOCR(String fileName) {
		String apiURL = ncpApiOcrURL;
		String secretKey = ncpApiOcrSecret;
		String imageFile = uploadPath + "/" + fileName; // 파일 입력

		try {
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setUseCaches(false);
			con.setDoInput(true);
			con.setDoOutput(true);
			con.setReadTimeout(30000);
			con.setRequestMethod("POST");
			String boundary = "----" + UUID.randomUUID().toString().replaceAll("-", "");
			con.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);
			con.setRequestProperty("X-OCR-SECRET", secretKey);

			JSONObject json = new JSONObject();
			json.put("version", "V2");
			json.put("requestId", UUID.randomUUID().toString());
			json.put("timestamp", System.currentTimeMillis());
			JSONObject image = new JSONObject();
			image.put("format", "jpg");
			image.put("name", "demo");
			JSONArray images = new JSONArray();
			images.put(image);
			json.put("images", images);
			String postParams = json.toString();

			con.connect();
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			long start = System.currentTimeMillis();
			File file = new File(imageFile);
			writeMultiPart(wr, postParams, file, boundary);
			wr.close();

			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}

			br.close();
			System.out.println(response);
			String result = response.toString();

			boolean torf = result.contains("개인컵");
			System.out.println("개인컵 여부 : " + torf);

			if (torf) {
				// 포인트 지급 dao
				return "성공";
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return "실패";
	}
}

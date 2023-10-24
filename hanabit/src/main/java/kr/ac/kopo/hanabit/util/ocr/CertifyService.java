package kr.ac.kopo.hanabit.util.ocr;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class CertifyService {

	@Value("${ncp.api.ocr.url}")
	private String ncpApiOcrURL;
	@Value("${ncp.api.ocr.secret}")
	private String ncpApiOcrSecret;

	private static void writeMultiPart(OutputStream out, String jsonMessage, File file, String boundary)
		throws IOException {
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
			fileString.append("Content-Disposition:form-data; name=\"file\"; filename=");
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

	public Map<String, String> cerificationWithIdCard(String file) {
		StringBuffer response = OCRGeneralAPI(file);
		System.out.println(response);

		JSONObject jObject = new JSONObject(response.toString());
		System.out.println(jObject.toString());

		JSONArray imagesArr = jObject.getJSONArray("images");

		JSONObject images = imagesArr.getJSONObject(0);
		log.info(String.valueOf(imagesArr.getJSONObject(0)));
		String inferResult = images.getString("inferResult");

		Map<String, String> map = new HashMap<>();

		if (inferResult.equals("SUCCESS")) {
			JSONArray fields = images.getJSONArray("fields");

			JSONObject typeObj = fields.getJSONObject(0);
			String type = typeObj.getString("inferText");
			log.info("type={}", type);

			if (type.equals("주민등록증")) {

				for (int i = 0; i < fields.length(); i++) {
					JSONObject field = fields.getJSONObject(i);
					log.info("field (" + i + ") ={}", field);
				}

				// [1]이름
				JSONObject field = fields.getJSONObject(1);
				String name = field.getString("inferText");
				// name = name.substring(0, name.length() - 2);
				name = name.substring(0, name.length());
				map.put("name", name);

				// [3,4,5] 970916-1123456 주민번호
				map.put("regNoFront", fields.getJSONObject(3).getString("inferText"));
				map.put("regNoBack", fields.getJSONObject(5).getString("inferText"));

			}
		}

		return map;
	}

	@SuppressWarnings("unused")
	private StringBuffer OCRGeneralAPI(String imgFile) {
		String apiURL = ncpApiOcrURL;
		String secretKey = ncpApiOcrSecret;

		String imageFile = imgFile;

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
			//			long start = System.currentTimeMillis();
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

			return response;
		} catch (Exception e) {
			System.out.println(e);
		}

		return null;
	}

}

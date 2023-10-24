package kr.ac.kopo.hanabit.util.sms;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MessageService {

	@Value("${coolsms.api.key}")
	private String apiKey;

	@Value("${coolsms.api.secret}")
	private String apiSecret;

	@Value("${coolsms.api.fromnumber}")
	private String fromNumber;

	/**
	 * 6자리 인증키 생성, int 반환
	 *
	 * @return
	 */
	private static int generateAuthNo() {
		java.util.Random generator = new java.util.Random();
		generator.setSeed(System.currentTimeMillis());
		return generator.nextInt(1000000) % 1000000;
	}

	public void sendMMS(String toNumber, String fromName) {

		Message coolsms = new Message(apiKey, apiSecret);

		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", toNumber);
		params.put("from", fromNumber);
		params.put("type", "MMS");
		params.put("text", "\n[1QHanabit] 원큐하나빗에서 " + fromName + "님이 기프티콘을 보내셨습니다!");
		params.put("imageId", "ST01FZ231016020550503QVJzh5teicH");

		try {
			JSONObject obj = (JSONObject)coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}

	}

	public void sendMessage(String toNumber, String message) {

		Message coolsms = new Message(apiKey, apiSecret);

		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", toNumber);
		params.put("from", fromNumber);
		params.put("type", "SMS");
		params.put("text", message);
		params.put("1Q.Gather", "test app 1.2"); // application name and version

		try {
			JSONObject obj = (JSONObject)coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
	}

	public int sendAuthNumberMessage(String tel) {
		int randomNumber = generateAuthNo();
		sendMessage(tel, "[1QHanabit] 인증번호 " + randomNumber + " 를 입력하세요.");
		return randomNumber;
	}

}
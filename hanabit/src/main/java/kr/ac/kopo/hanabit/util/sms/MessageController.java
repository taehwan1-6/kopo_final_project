package kr.ac.kopo.hanabit.util.sms;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequiredArgsConstructor
@Slf4j
public class MessageController {

	private final MessageService messageService;

	@PostMapping("/auth")
	public void auth(@RequestBody String jsonData, HttpSession session, Model model) {

		JSONObject jObject = new JSONObject(jsonData);
		String tel = jObject.getString("tel");
		log.info("tel={}", tel);

		int authNum = messageService.sendAuthNumberMessage(tel);
		session.setAttribute("authNum", authNum);
		log.info("authNum={}", authNum);
	}

	@PostMapping("/auth/check")
	public ResponseEntity<?> check(@RequestBody String jsonData, HttpSession session) {

		JSONObject jObject = new JSONObject(jsonData);
		String authNum = jObject.getString("authNum");
		System.out.println("authNum : " + authNum);

		String num = String.valueOf(session.getAttribute("authNum"));
		System.out.println("num : " + num);

		System.out.println(authNum.equals(num));
		if (num != null && authNum.equals(num)) {
			System.out.println("성공");
			return new ResponseEntity<>("성공", HttpStatus.OK);
		}

		return new ResponseEntity<>("실패", HttpStatus.SERVICE_UNAVAILABLE);
	}
}
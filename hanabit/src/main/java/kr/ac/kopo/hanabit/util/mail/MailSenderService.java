package kr.ac.kopo.hanabit.util.mail;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class MailSenderService {

	private final JavaMailSenderImpl mailSender;

	public int makeRandomNum() {
		Random r = new Random();
		int checkNum = r.nextInt(888888) + 11111;
		log.info("인증번호 : " + checkNum);
		return checkNum;
	}

	public void mailSend(String setForm, String toMail, String title, String content) {
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setForm);
			helper.setTo(toMail);
			helper.setSubject(title);

			String htmlContent = "<img src='cid:image'><br>" + content;
			helper.setText(htmlContent, true);

			ClassPathResource imageResource = new ClassPathResource("static/logo.png");
			helper.addInline("image", imageResource);

			mailSender.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String joinEmail(String email) {
		int authNum = makeRandomNum();
		String setForm = "kickoutter.kopo@gmail.com";
		String toMail = email;
		String title = "(주)원큐하나빗 회원 가입 인증 이메일 입니다.";

		String content =
			"홈페이지를 방문해주셔서 감사합니다." +    //html 형식으로 작성 !
				"<br><br>" +
				"인증 번호는 " + authNum + "입니다." +
				"<br>" +
				"해당 인증번호를 인증번호 확인란에 기입하여 주세요.";

		mailSend(setForm, toMail, title, content);
		return Integer.toString(authNum);
	}
}

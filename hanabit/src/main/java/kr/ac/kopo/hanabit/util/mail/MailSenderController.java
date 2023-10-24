package kr.ac.kopo.hanabit.util.mail;

import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class MailSenderController {

	private final JavaMailSenderImpl mailSender;
	private final MailSenderService mailSenderService;

	@GetMapping("/check-mail")
	@ResponseBody
	public String checkMail(@RequestParam("email") String email) {
		log.info(email);
		return mailSenderService.joinEmail(email);
	}
}

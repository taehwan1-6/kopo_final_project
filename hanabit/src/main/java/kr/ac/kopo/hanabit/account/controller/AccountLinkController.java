package kr.ac.kopo.hanabit.account.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.kopo.hanabit.account.dto.AccountDto;
import kr.ac.kopo.hanabit.account.service.AccountService;
import kr.ac.kopo.hanabit.member.dto.MemberDto;
import kr.ac.kopo.hanabit.member.mapper.MemberMapper;
import kr.ac.kopo.hanabit.util.ocr.CertifyService;
import kr.ac.kopo.hanabit.util.ocr.MyFileNameGenerator;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@RequestMapping("/account/link")
@Slf4j
public class AccountLinkController {

	private final CertifyService certifyService;
	private final AccountService accountService;
	private final MemberMapper memberMapper;
	@Value("${upload.path.idcard}")
	private String idcardUploadPath;

	// 계좌 연결 시작

	// 신분증 인증1
	@GetMapping("/auth")
	public String createAuth(@SessionAttribute MemberDto currentMember,
		Model model) {
		model.addAttribute("currentMember", currentMember);

		return "account/link/linkAuth";
	}

	@PostMapping("/auth")
	public String createAuth(MultipartFile[] uploadfile,
		Model model) {

		String uploadPath = idcardUploadPath;
		System.out.println(uploadPath);

		for (MultipartFile file : uploadfile) {
			File newFileName = MyFileNameGenerator.rename(new File(uploadPath, file.getOriginalFilename()));

			try {
				file.transferTo(newFileName);
			} catch (Exception e) {
				e.printStackTrace();
			}

			System.out.println(newFileName.getPath().replace('/', '/'));
			Map<String, String> idcardInfo = certifyService.cerificationWithIdCard(newFileName.getPath());

			model.addAttribute("idcardInfo", idcardInfo);
			model.addAttribute("idcard", newFileName.getName());
		}

		return "account/link/linkAuth2";
	}

	@PostMapping("/auth/complete")
	public String createForm(@SessionAttribute("currentMember") MemberDto currentMember,
		@RequestParam String personalNum) {
		int result = memberMapper.updatePersonalNum(currentMember.getEmail(), personalNum);

		if (result == 1) {
			log.info("주민번호 업데이트 성공");
		} else {
			log.info("주민번호 중복");
		}

		return "account/link/linkAuthComplete";
	}

	@GetMapping("/complete")
	public String createComplete(@SessionAttribute MemberDto currentMember,
		Model model) {

		List<AccountDto> accounts = accountService.getAllByType(currentMember.getPersonalNum(), "입출금");
		log.info("accounts={}", accounts);
		model.addAttribute("accounts", accounts);

		return "account/link/linkComplete";
	}

}

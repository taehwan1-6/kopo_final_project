package kr.ac.kopo.hanabit.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import kr.ac.kopo.hanabit.commcode.dto.CategoryCodeDto;
import kr.ac.kopo.hanabit.commcode.mapper.CommCodeMapper;
import kr.ac.kopo.hanabit.member.dto.MemberDto;
import kr.ac.kopo.hanabit.member.dto.MemberJoinDto;
import kr.ac.kopo.hanabit.member.dto.MemberLoginDto;
import kr.ac.kopo.hanabit.member.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@SessionAttributes({"currentMember", "currentJoin"})
@RequestMapping("/member")
@Slf4j
public class MemberController {

	private final CommCodeMapper commCodeMapper;
	private final MemberMapper memberMapper;

	@Value("${upload.path.idcard}")
	private String idcardUploadPath;

	// 회원 삭제
	@DeleteMapping("/delete")
	public ResponseEntity<String> delete(@SessionAttribute MemberDto currentMember) {
		memberMapper.delete(currentMember.getEmail());
		return ResponseEntity.ok("success");
	}

	// #join
	@GetMapping("/join")
	public String join(Model model) {
		List<CategoryCodeDto> categoryCodes = commCodeMapper.selectAllById("100");
		model.addAttribute("categoryCodes", categoryCodes);

		return "member/joinForm";
	}

	@PostMapping("/join")
	public ResponseEntity<String> join(@RequestBody MemberJoinDto memberJoinDto) {
		log.info("memberJoinDto={}", memberJoinDto);
		memberMapper.join(memberJoinDto);
		return ResponseEntity.ok("success");
	}

	// mobile Login
	@GetMapping("/login-mobile")
	public String loginMobile() {
		return "member/mobileLoginForm";
	}

	// #login
	@GetMapping("/login")
	public String login() {
		return "member/loginForm";
	}

	@PostMapping("/login")
	public String login(@ModelAttribute("memberLoginDto") MemberLoginDto memberLoginDto,
		Model model) {
		MemberDto memberDto = memberMapper.login(memberLoginDto);
		model.addAttribute("currentMember", memberDto);
		log.info("currentMember = {}", memberDto);

		if ("관리자".equals(memberDto.getRole())) {

			return "redirect:/admin";
		} else {

			return "redirect:/";
		}
	}

	// logout
	@GetMapping("/logout")
	public String logout(SessionStatus sessionStatus) {
		sessionStatus.setComplete();
		return "redirect:/"; // 로그아웃 후 로그인 페이지로 리다이렉트
	}

}

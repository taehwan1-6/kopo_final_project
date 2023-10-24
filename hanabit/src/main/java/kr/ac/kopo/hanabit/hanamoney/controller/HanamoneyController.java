package kr.ac.kopo.hanabit.hanamoney.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.ac.kopo.hanabit.account.dto.AccountDto;
import kr.ac.kopo.hanabit.account.service.AccountService;
import kr.ac.kopo.hanabit.hanamoney.dto.HanamoneyDto;
import kr.ac.kopo.hanabit.hanamoney.dto.HanamoneyTransactionDto;
import kr.ac.kopo.hanabit.hanamoney.dto.HanamoneyTransactionLogDto;
import kr.ac.kopo.hanabit.hanamoney.mapper.HanamoneyMapper;
import kr.ac.kopo.hanabit.hanamoney.service.HanamoneyService;
import kr.ac.kopo.hanabit.member.dto.MemberDto;
import kr.ac.kopo.hanabit.member.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@RequestMapping("/hanamoney")
@Slf4j
public class HanamoneyController {

	private final HanamoneyMapper hanamoneyMapper;
	private final MemberMapper memberMapper;

	private final AccountService accountService;
	private final HanamoneyService hanamoneyService;

	/**
	 * MVC
	 */
	// 무료 송금
	@PostMapping("/transfer")
	public String transferFree(
		@SessionAttribute("currentMember") MemberDto currentMember,
		@ModelAttribute("hanamoneyTransactionDto") HanamoneyTransactionDto hanamoneyTransactionDto,
		@RequestParam String targetAccountNum) {

		HanamoneyDto myHanamoney = hanamoneyMapper.selectByEmail(currentMember.getEmail());
		AccountDto targetAccount = accountService.getByAccountNum(targetAccountNum);

		HttpStatus httpStatus = hanamoneyService.transferFree(currentMember, hanamoneyTransactionDto, myHanamoney,
			targetAccount);

		if (httpStatus == HttpStatus.OK) {
			return "redirect:/hanamoney";
		} else {
			return "redirect:/hanamoney";
		}
	}

	// 메인
	@GetMapping()
	public String hanamoney(@SessionAttribute("currentMember") MemberDto currentMember,
		Model model) {
		HanamoneyDto hanamoneyDto = hanamoneyMapper.selectByEmail(currentMember.getEmail());
		model.addAttribute("hanamoney", hanamoneyDto);

		if (hanamoneyDto != null) {
			// 하나머니 거래내역
			List<HanamoneyTransactionLogDto> hanamoneyTransactionLogDtos = hanamoneyMapper.selectAllTransactionLog(
				currentMember.getEmail());
			model.addAttribute("hanamoneyTransactionLogDtos", hanamoneyTransactionLogDtos);

			if (hanamoneyDto.getLinkedAccountNum() != null) {
				AccountDto linkedAccount = accountService.getByAccountNum(hanamoneyDto.getLinkedAccountNum());
				model.addAttribute("linkedAccount", linkedAccount);
			}
		}

		return "mypage/hanamoney";
	}

	// 이용신청
	@GetMapping("/intro")
	public String intro() {
		return "hanamoney/hanamoneyIntro";
	}

	@GetMapping("/tos")
	public String tos() {
		return "hanamoney/hanamoneyTos";
	}

	@PostMapping("/create")
	public String create(@SessionAttribute("currentMember") MemberDto currentMember,
		@RequestParam int easyPassword) {
		HanamoneyDto hanamoneyDto = HanamoneyDto.builder()
			.memberEmail(currentMember.getEmail())
			.balance(0)
			.easyPassword(easyPassword)
			.build();

		hanamoneyMapper.insert(hanamoneyDto);

		return "redirect:/hanamoney/complete";
	}

	@GetMapping("/complete")
	public String complete() {
		return "hanamoney/hanamoneyCreateComplete";
	}

	// 충전
	// 1. 만약에 계좌와 연동 해놨으면, 모달로 떠서 그냥 금액입력 후 간편비밀번호만 치면 충전되게.
	@PostMapping("/charge")
	public String charge(
		@SessionAttribute("currentMember") MemberDto currentMember,
		@ModelAttribute("hanamoneyTransactionDto") HanamoneyTransactionDto hanamoneyTransactionDto) {

		HanamoneyDto myHanamoney = hanamoneyMapper.selectByEmail(currentMember.getEmail());
		AccountDto myAccount = accountService.getByAccountNum(myHanamoney.getLinkedAccountNum());

		HttpStatus httpStatus = hanamoneyService.charge(currentMember, hanamoneyTransactionDto, myHanamoney, myAccount);

		if (httpStatus == HttpStatus.OK) {
			return "redirect:/hanamoney";
		} else {
			return "redirect:/hanamoney";
		}

	}

	@GetMapping("/charge")
	public String chargeComplete() {
		return "hanamoney/chargeComplete";
	}

	/**
	 * REST
	 */
	@PostMapping("/link-account")
	public ResponseEntity<String> linkAccount(
		@SessionAttribute MemberDto currentMember,
		@RequestParam("accountNum") String linkedAccountNum) {
		int result = hanamoneyMapper.updateLinkedAccountNum(linkedAccountNum, currentMember.getEmail());

		if (result == 1) {
			memberMapper.updateIsLinkedAccount(currentMember.getEmail(), "연동");
			return ResponseEntity.ok("하나머니 계좌연동 성공!");
		} else {
			return ResponseEntity.ok("하나머니 계좌연동 실패!");
		}
	}

}

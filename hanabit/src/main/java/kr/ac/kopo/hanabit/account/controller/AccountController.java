package kr.ac.kopo.hanabit.account.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.ac.kopo.hanabit.account.dto.AccountDto;
import kr.ac.kopo.hanabit.account.dto.TransactionResponseDto;
import kr.ac.kopo.hanabit.account.service.AccountService;
import kr.ac.kopo.hanabit.account.service.TransactionService;
import kr.ac.kopo.hanabit.member.dto.MemberDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@RequestMapping("/account")
@Slf4j
public class AccountController {

	private final AccountService accountService;
	private final TransactionService transactionService;

	// 계좌 조회 페이지 (거래내역)
	@GetMapping("/{accountNum}")
	public String accountTransaction(
		@SessionAttribute MemberDto currentMember,
		@PathVariable String accountNum,
		Model model) {
		List<AccountDto> accounts = accountService.getAll(currentMember.getPersonalNum());
		List<AccountDto> checkingAccounts = accountService.getAllByType(currentMember.getPersonalNum(), "입출금");
		List<AccountDto> termDepositAccounts = accountService.getAllByType(currentMember.getPersonalNum(), "예금");

		AccountDto pickAccount = accountService.getByAccountNum(accountNum);
		List<TransactionResponseDto> allTransaction
			= transactionService.getAllTransaction(currentMember.getPersonalNum(), accountNum, pickAccount.getType());

		if (!accounts.isEmpty()) {
			model.addAttribute("accounts", accounts);
			model.addAttribute("cAccounts", checkingAccounts);
			model.addAttribute("tdAccounts", termDepositAccounts);

			model.addAttribute("allTransaction", allTransaction);
		}

		return "mypage/myAccount";
	}

	// 계좌 조회 페이지
	@GetMapping
	public String account(@SessionAttribute MemberDto currentMember,
		Model model) {
		List<AccountDto> accounts = accountService.getAll(currentMember.getPersonalNum());
		List<AccountDto> checkingAccounts = accountService.getAllByType(currentMember.getPersonalNum(), "입출금");
		List<AccountDto> termDepositAccounts = accountService.getAllByType(currentMember.getPersonalNum(), "예금");

		if (!accounts.isEmpty()) {
			model.addAttribute("accounts", accounts);
			model.addAttribute("cAccounts", checkingAccounts);
			model.addAttribute("tdAccounts", termDepositAccounts);
		}

		return "mypage/myAccount";
	}

	// 계좌 개설 및 연동 페이지
	@GetMapping("/create-link")
	public String createAndLink() {

		return "account/createAndLink";
	}

}

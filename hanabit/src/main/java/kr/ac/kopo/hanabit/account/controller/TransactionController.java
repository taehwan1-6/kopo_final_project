package kr.ac.kopo.hanabit.account.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.ac.kopo.hanabit.account.dto.TransactionResponseDto;
import kr.ac.kopo.hanabit.account.service.TransactionService;
import kr.ac.kopo.hanabit.member.dto.MemberDto;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class TransactionController {

	private final TransactionService transactionService;

	@GetMapping("/transactions")
	@ResponseBody
	public List<TransactionResponseDto> transactions(
		@SessionAttribute("currentMember") MemberDto currentMember,
		@RequestParam("accountNum") String accountNum,
		@RequestParam("type") String type) {

		List<TransactionResponseDto> transactions = transactionService.getAllTransaction(
			currentMember.getPersonalNum(),
			accountNum,
			type);

		return transactions;
	}
}

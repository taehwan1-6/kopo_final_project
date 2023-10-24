package kr.ac.kopo.hanabit.hanamoney.service;

import org.springframework.http.HttpStatus;

import kr.ac.kopo.hanabit.account.dto.AccountDto;
import kr.ac.kopo.hanabit.hanamoney.dto.HanamoneyDto;
import kr.ac.kopo.hanabit.hanamoney.dto.HanamoneyTransactionDto;
import kr.ac.kopo.hanabit.member.dto.MemberDto;

public interface HanamoneyService {

	HttpStatus transferFree(MemberDto currentMember,
		HanamoneyTransactionDto hanamoneyTransactionDto,
		HanamoneyDto myHanamoney,
		AccountDto targetAccount);

	HttpStatus charge(MemberDto currentMember,
		HanamoneyTransactionDto hanamoneyTransactionDto,
		HanamoneyDto myHanamoney,
		AccountDto myAccount);
}

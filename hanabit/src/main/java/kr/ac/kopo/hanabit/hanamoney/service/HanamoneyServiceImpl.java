package kr.ac.kopo.hanabit.hanamoney.service;

import java.time.LocalDateTime;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.kopo.hanabit.account.dto.AccountDto;
import kr.ac.kopo.hanabit.account.dto.AccountTransferRequestDto;
import kr.ac.kopo.hanabit.account.service.AccountService;
import kr.ac.kopo.hanabit.hanamoney.dto.HanamoneyDto;
import kr.ac.kopo.hanabit.hanamoney.dto.HanamoneyTransactionDto;
import kr.ac.kopo.hanabit.hanamoney.dto.HanamoneyTransactionLogDto;
import kr.ac.kopo.hanabit.hanamoney.mapper.HanamoneyMapper;
import kr.ac.kopo.hanabit.member.dto.MemberDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class HanamoneyServiceImpl implements HanamoneyService {

	private final HanamoneyMapper hanamoneyMapper;

	private final AccountService accountService;

	@Override
	@Transactional
	public HttpStatus transferFree(
		MemberDto currentMember,
		HanamoneyTransactionDto hanamoneyTransactionDto,
		HanamoneyDto myHanamoney,
		AccountDto targetAccount) {

		// 1. hanamoneys에 balance update
		hanamoneyMapper.updateBalance(
			myHanamoney.getBalance() - hanamoneyTransactionDto.getAmount(),
			currentMember.getEmail());// 보낸 금액만큼 -

		// 2. hanamoney_transactions에 insert // 카테고리: 무료송금, 이름: 무료송금
		HanamoneyTransactionLogDto hanamoneyTransactionLogDto
			= HanamoneyTransactionLogDto.builder()
			.transDate(LocalDateTime.now())
			.memberEmail(currentMember.getEmail())
			.transAmount(hanamoneyTransactionDto.getAmount())
			.transBalance(myHanamoney.getBalance() - hanamoneyTransactionDto.getAmount())
			.transType(hanamoneyTransactionDto.getTransType())
			.transCategory(hanamoneyTransactionDto.getTransCategory())
			.transName(hanamoneyTransactionDto.getTransName())
			.targetBankCode(hanamoneyTransactionDto.getTargetBankCode())
			.targetAccountNum(hanamoneyTransactionDto.getTargetAccountNum())
			.build();

		hanamoneyMapper.insertTransactionLog(hanamoneyTransactionLogDto);

		// 3. 입금으로 depositAccount로 한번에 처리
		AccountTransferRequestDto accountTransferRequestDto
			= AccountTransferRequestDto.builder()
			.accountNum(targetAccount.getAccountNum())
			.type("입금")
			.transactionAmount(hanamoneyTransactionDto.getAmount())
			.transactionName(hanamoneyTransactionDto.getTransName())
			.targetBankCode(hanamoneyTransactionDto.getTargetBankCode())
			.targetAccountNum("하나머니 " + currentMember.getName())
			.build();

		accountService.depositAccount(accountTransferRequestDto);

		return HttpStatus.OK;
	}

	@Override
	@Transactional
	public HttpStatus charge(
		MemberDto currentMember,
		HanamoneyTransactionDto hanamoneyTransactionDto,
		HanamoneyDto myHanamoney,
		AccountDto myAccount) {

		if (myHanamoney.getEasyPassword() == hanamoneyTransactionDto.getEasyPassword()) {
			log.info("간편 비밀번호가 확인되었습니다. = {}", hanamoneyTransactionDto.getEasyPassword());
			// 간편비밀번호로 계좌비밀번호 대체
			int accountPassword = myAccount.getPassword();

			// 1. hanamoneys에 balance update
			hanamoneyMapper.updateBalance(
				myHanamoney.getBalance() + hanamoneyTransactionDto.getAmount(),
				currentMember.getEmail());// 보낸 금액만큼 +플러스

			// 2. hanamoney_transactions에 insert // 카테고리: 충전 적립, 이름: 하나은행->하나머니
			HanamoneyTransactionLogDto hanamoneyTransactionLogDto
				= HanamoneyTransactionLogDto.builder()
				.transDate(LocalDateTime.now())
				.memberEmail(currentMember.getEmail())
				.transAmount(+hanamoneyTransactionDto.getAmount())
				.transBalance(myHanamoney.getBalance() + hanamoneyTransactionDto.getAmount())
				.transType(hanamoneyTransactionDto.getTransType())
				.transCategory(hanamoneyTransactionDto.getTransCategory())
				.transName(hanamoneyTransactionDto.getTransName())
				.build();

			hanamoneyMapper.insertTransactionLog(hanamoneyTransactionLogDto);

			// 3. 출금으로 withdrawAccount로 한번에 처리
			AccountTransferRequestDto accountTransferRequestDto
				= AccountTransferRequestDto.builder()
				.accountNum(myHanamoney.getLinkedAccountNum())
				.type("출금")
				.transactionAmount(-hanamoneyTransactionDto.getAmount())
				.transactionName(hanamoneyTransactionDto.getTransName())
				.targetBankCode(hanamoneyTransactionDto.getTargetBankCode())
				.targetAccountNum("하나머니충전")
				.build();

			accountService.withdrawAccount(accountPassword, accountTransferRequestDto);

			return HttpStatus.OK;
		} else {
			log.info("간편 비밀번호가 일치하지 않습니다. 다시 한번 시도해주세요.= {}", hanamoneyTransactionDto.getEasyPassword());
			return HttpStatus.BAD_REQUEST;
		}
	}
}

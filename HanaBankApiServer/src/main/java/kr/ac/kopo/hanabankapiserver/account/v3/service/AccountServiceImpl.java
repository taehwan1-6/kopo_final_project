package kr.ac.kopo.hanabankapiserver.account.v3.service;

import kr.ac.kopo.hanabankapiserver.account.v3.dto.AccountCreateRequestDto;
import kr.ac.kopo.hanabankapiserver.account.v3.dto.AccountDto;
import kr.ac.kopo.hanabankapiserver.account.v3.dto.AccountTransactionLogDto;
import kr.ac.kopo.hanabankapiserver.account.v3.dto.AccountTransferRequestDto;
import kr.ac.kopo.hanabankapiserver.account.v3.mapper.AccountMapper;
import kr.ac.kopo.hanabankapiserver.member.dto.MemberDto;
import kr.ac.kopo.hanabankapiserver.member.mapper.MemberMapper;
import kr.ac.kopo.hanabankapiserver.util.AccountNumberGenerator;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@Slf4j
public class AccountServiceImpl implements AccountService {

    private final AccountMapper accountMapper;
    private final MemberMapper memberMapper;

    @Transactional
    public void depositAccount(AccountTransferRequestDto accountTransferRequestDto,
                               AccountDto sourceAccount) {
        // 1. 입금 계좌에서 잔고 + 플러스
        accountMapper.updateBalance(
                sourceAccount.getBalance() + accountTransferRequestDto.getTransactionAmount(),
                sourceAccount.getAccountNum());

        // 2. 입금받는 거래내역 insert
        AccountTransactionLogDto sourceAccountTransactionLog
                = AccountTransactionLogDto.builder()
                . transactionDate(LocalDateTime.now())
                .accountNum(sourceAccount.getAccountNum())
                .type("입금")
                .transactionAmount(accountTransferRequestDto.getTransactionAmount())
                .transactionBalance(sourceAccount.getBalance() + accountTransferRequestDto.getTransactionAmount())
                .transactionName(accountTransferRequestDto.getTransactionName())
                .targetBankCode(accountTransferRequestDto.getTargetBankCode())
                .targetAccountNum(accountTransferRequestDto.getTargetAccountNum()) //ex) 하나머니에서 무료송금 받기, atm기 입금
                .build();

        accountMapper.insertTransactionLog(sourceAccountTransactionLog);

    }

    @Transactional
    public void accountWithdraw(AccountTransferRequestDto accountTransferRequestDto,
                                AccountDto sourceAccount) {
        // 1. 출금하는 계좌에서 잔고 -마이너스
        accountMapper.updateBalance(
                sourceAccount.getBalance() - accountTransferRequestDto.getTransactionAmount(),
                sourceAccount.getAccountNum());

        // 2. 출금하는 거래내역 insert
        AccountTransactionLogDto sourceAccountTransactionLog
                = AccountTransactionLogDto.builder()
                . transactionDate(LocalDateTime.now())
                .accountNum(sourceAccount.getAccountNum())
                .type("출금")
                .transactionAmount(accountTransferRequestDto.getTransactionAmount())
                .transactionBalance(sourceAccount.getBalance() - accountTransferRequestDto.getTransactionAmount())
                .transactionName(accountTransferRequestDto.getTransactionName())
                .targetBankCode(accountTransferRequestDto.getTargetBankCode())
                .targetAccountNum(accountTransferRequestDto.getTargetAccountNum()) //ex) 하나머니충전, atm출금
                .build();

        accountMapper.insertTransactionLog(sourceAccountTransactionLog);

    }



    @Transactional
    public void accountTransfer(AccountTransferRequestDto accountTransferRequestDto,
                                AccountDto sourceAccount,
                                AccountDto destinationAccount) {
        // 1. 출금하는 계좌에서 잔고 -마이너스
        accountMapper.updateBalance(
                sourceAccount.getBalance() - accountTransferRequestDto.getTransactionAmount(),
                sourceAccount.getAccountNum());
        // 1-2. 입금되는 계좌에서 잔고 +
        accountMapper.updateBalance(
                destinationAccount.getBalance() + accountTransferRequestDto.getTransactionAmount(),
                destinationAccount.getAccountNum());

        // 2. 출금하는 거래내역 insert
        AccountTransactionLogDto sourceAccountTransactionLog
                = AccountTransactionLogDto.builder()
                . transactionDate(LocalDateTime.now())
                .accountNum(sourceAccount.getAccountNum())
                .type("출금")
                .transactionAmount(accountTransferRequestDto.getTransactionAmount())
                .transactionBalance(sourceAccount.getBalance() - accountTransferRequestDto.getTransactionAmount())
                .transactionName(accountTransferRequestDto.getTransactionName())
                .targetBankCode(destinationAccount.getBankCode())
                .targetAccountNum(destinationAccount.getAccountNum())
                .build();

        accountMapper.insertTransactionLog(sourceAccountTransactionLog);

        // 2-2. 입금되는 계좌 거래내역 insert
        AccountTransactionLogDto destinationAccountTransactionLog
                = AccountTransactionLogDto.builder()
                . transactionDate(LocalDateTime.now())
                .accountNum(destinationAccount.getAccountNum())
                .type("입금")
                .transactionAmount(accountTransferRequestDto.getTransactionAmount())
                .transactionBalance(destinationAccount.getBalance() + accountTransferRequestDto.getTransactionAmount())
                .transactionName(accountTransferRequestDto.getTransactionName())
                .targetBankCode(sourceAccount.getBankCode())
                .targetAccountNum(sourceAccount.getAccountNum())
                .build();

        accountMapper.insertTransactionLog(destinationAccountTransactionLog);
    }





    @Transactional
    public AccountDto createAccount(AccountCreateRequestDto accountCreateRequestDto) {

        Optional<MemberDto> memberDto = Optional.ofNullable(memberMapper.selectByPersonalNum(accountCreateRequestDto.getPersonalNum()));
        if (!memberDto.isPresent()) {
            // 가입한 회원이 없으면 먼저 회원가입 해줘야함.
            MemberDto newMember = MemberDto.builder()
                    .email(accountCreateRequestDto.getMemberEmail())
                    .password("pass")
                    .name("원큐하나빗 회원")
                    .personalNum(accountCreateRequestDto.getPersonalNum())
                    .createdAt(LocalDateTime.now())
                    .build();
            log.info("newMember={}", newMember);

            memberMapper.joinAtHanabit(newMember);

            MemberDto memberHanabit = memberMapper.selectByPersonalNum(accountCreateRequestDto.getPersonalNum());

            AccountDto accountDto = AccountDto.builder()
                    .accountNum(new AccountNumberGenerator().generateAccountNumber())
                    .password(accountCreateRequestDto.getPassword())
                    .productName(accountCreateRequestDto.getProductName())
                    .balance(0)
                    .type(accountCreateRequestDto.getType())
                    .status("활성")
                    .bankCode(accountCreateRequestDto.getBankCode())
                    .createdAt(LocalDateTime.now())
                    .memberEmail(memberHanabit.getEmail())
                    .build();

            accountMapper.insert(accountDto);


            return accountDto;

        } else {

            AccountDto accountDto = AccountDto.builder()
                    .accountNum(new AccountNumberGenerator().generateAccountNumber())
                    .password(accountCreateRequestDto.getPassword())
                    .productName(accountCreateRequestDto.getProductName())
                    .balance(0)
                    .type(accountCreateRequestDto.getType())
                    .status("활성")
                    .bankCode(accountCreateRequestDto.getBankCode())
                    .createdAt(LocalDateTime.now())
                    .memberEmail(memberDto.get().getEmail())
                    .build();

            accountMapper.insert(accountDto);


            return accountDto;
        }


    }

}

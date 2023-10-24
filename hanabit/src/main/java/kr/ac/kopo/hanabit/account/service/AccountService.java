package kr.ac.kopo.hanabit.account.service;

import kr.ac.kopo.hanabit.account.dto.AccountCreateRequestDto;
import kr.ac.kopo.hanabit.account.dto.AccountDto;
import kr.ac.kopo.hanabit.account.dto.AccountTransferRequestDto;
import org.springframework.http.HttpStatus;

import java.util.List;

public interface AccountService {

    /**
     * v3
     */
    // 입금
    HttpStatus depositAccount(AccountTransferRequestDto accountTransferRequestDto);

    // 출금
    HttpStatus withdrawAccount(int password, AccountTransferRequestDto accountTransferRequestDto);
    // 계좌이체
    HttpStatus transferAccount(int password, AccountTransferRequestDto accountTransferRequestDto);

    // selectAll
    List<AccountDto> getAll(String personalNum);
    List<AccountDto> getAllByType(String personalNum, String type);

    // select
    AccountDto getByAccountNum(String accountNum);

    // insert
    AccountDto createAccount(AccountCreateRequestDto accountCreateRequestDto);

}

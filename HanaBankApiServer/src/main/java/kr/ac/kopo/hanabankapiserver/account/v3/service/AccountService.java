package kr.ac.kopo.hanabankapiserver.account.v3.service;

import kr.ac.kopo.hanabankapiserver.account.v3.dto.AccountCreateRequestDto;
import kr.ac.kopo.hanabankapiserver.account.v3.dto.AccountDto;
import kr.ac.kopo.hanabankapiserver.account.v3.dto.AccountTransferRequestDto;

public interface AccountService {

    void accountTransfer(AccountTransferRequestDto accountTransferRequestDto,
                         AccountDto sourceAccount,
                         AccountDto destinationAccount);

    void accountWithdraw(AccountTransferRequestDto accountTransferRequestDto,
                         AccountDto sourceAccount);

    void depositAccount(AccountTransferRequestDto accountTransferRequestDto,
                         AccountDto sourceAccount);

    AccountDto createAccount(AccountCreateRequestDto accountCreateRequestDto);

}

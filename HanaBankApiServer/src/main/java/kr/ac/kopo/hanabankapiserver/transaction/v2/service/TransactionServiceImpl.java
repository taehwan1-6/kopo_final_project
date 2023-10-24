package kr.ac.kopo.hanabankapiserver.transaction.v2.service;

import kr.ac.kopo.hanabankapiserver.account.v3.dto.AccountDto;
import kr.ac.kopo.hanabankapiserver.account.v3.mapper.AccountMapper;
import kr.ac.kopo.hanabankapiserver.transaction.v2.dto.TransactionRequestDto;
import kr.ac.kopo.hanabankapiserver.transaction.v2.dto.TransactionResponseDto;
import kr.ac.kopo.hanabankapiserver.transaction.v2.mapper.TransactionMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class TransactionServiceImpl implements TransactionService {

    private final TransactionMapper transactionMapper;
    private final AccountMapper accountMapper;

    @Override
    public List<TransactionResponseDto> getAllTransaction(String personalNum, String accountNum, String accountType) {
        List<TransactionResponseDto> transactions = transactionMapper.selectAllTransaction(personalNum, accountNum, accountType);

        return transactions;
    }

    // 계좌 이체, 입금 받을 때
    @Override
    @Transactional
    public void transfer(TransactionRequestDto transactionRequestDto) {

        // Check if transactionRequestDto is null
        if(transactionRequestDto == null) {
            throw new IllegalArgumentException("transactionRequestDto should not be null");
        }
        transactionMapper.decreaseBalanceForAccountNum(transactionRequestDto);
        transactionMapper.increaseBalanceForTargetAccountNum(transactionRequestDto);


        // 위의거 성공 시, 거래내역 테이블에 insert
        // Check if accountResponseDto1 is null
        AccountDto accountResponseDto1 = accountMapper.selectByAccountNum(transactionRequestDto.getAccountNum());
        if(accountResponseDto1 == null) {
            throw new IllegalStateException("No account found for account number: " + transactionRequestDto.getAccountNum());
        }
        transactionRequestDto.setBankCode(accountResponseDto1.getBankCode());
        transactionRequestDto.setTransactionBalance(accountResponseDto1.getBalance());
        transactionMapper.insertAccountNum(transactionRequestDto);

        // Check if accountResponseDto2 is null
        AccountDto accountResponseDto2 = accountMapper.selectByAccountNum(transactionRequestDto.getTargetAccountNum());
        if(accountResponseDto2 == null) {
            throw new IllegalStateException("No account found for target account number: " + transactionRequestDto.getTargetAccountNum());
        }
        transactionRequestDto.setTargetBankCode(accountResponseDto2.getBankCode());
        transactionRequestDto.setTransactionBalance(accountResponseDto2.getBalance());
        transactionMapper.insertTargetAccountNum(transactionRequestDto);
    }

//    @Override
//    @Transactional
//    public int transferOut(TransactionRequestDto transactionRequestDto) {
//
//        transactionMapper.increaseBalanceForAccountNum(transactionRequestDto);
//        transactionMapper.decreaseBalanceForTargetAccountNum(transactionRequestDto);
//
//        // 위의거 성공 시, 거래내역 테이블에 insert
//        int response = transactionMapper.insertTargetAccountNum(transactionRequestDto);
//
//        return response;
//    }


}

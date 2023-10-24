package kr.ac.kopo.hanabankapiserver.transaction.v2.service;

import kr.ac.kopo.hanabankapiserver.transaction.v2.dto.TransactionRequestDto;
import kr.ac.kopo.hanabankapiserver.transaction.v2.dto.TransactionResponseDto;

import java.util.List;

public interface TransactionService {

    List<TransactionResponseDto> getAllTransaction(String personalNum, String accountNum, String accountType);

//    int transferIn(TransactionRequestDto transactionRequestDto);
//
//    int transferOut(TransactionRequestDto transactionRequestDto);

    void transfer(TransactionRequestDto transactionRequestDto);
}

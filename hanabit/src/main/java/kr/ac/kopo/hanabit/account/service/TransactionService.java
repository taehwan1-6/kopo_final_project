package kr.ac.kopo.hanabit.account.service;

import kr.ac.kopo.hanabit.account.dto.TransactionRequestDto;
import kr.ac.kopo.hanabit.account.dto.TransactionResponseDto;

import java.util.List;

public interface TransactionService {

    //  api 서버에서 주민번호에 맡는 회원의 모든 입출금 계좌 조회
    List<TransactionResponseDto> getAllTransaction(String personalNum, String accountNum, String accountType);

    // 계좌이체
    String transfer(TransactionRequestDto transactionRequestDto);
}

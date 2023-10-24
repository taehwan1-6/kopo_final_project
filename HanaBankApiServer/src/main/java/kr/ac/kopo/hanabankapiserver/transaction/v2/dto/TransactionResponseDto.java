package kr.ac.kopo.hanabankapiserver.transaction.v2.dto;

import lombok.Data;

@Data
public class TransactionResponseDto {

    private String transactionDate; // 입출금 일시
    private String accountNum; // 계좌_계좌번호

    private String bankCode; // 보내는 은행코드 (Nullable)

    private String accountType; // 계좌의 유형 (입출금, 예금, 적금)


    private String transactionType; // 거래 유형 (입금, 출금)


    private int transactionAmount; // 거래 금액
    private int transactionBalance; // 거래 후 잔액

    private String transactionName; // 거래내역명 (Nullable)

    private String targetBankCode; // 거래대상은행코드 (Nullable)
    private String targetAccountNum; // 거래대상 계좌번호

}
package kr.ac.kopo.hanabit.account.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class AccountTransactionLogDto {

	private LocalDateTime transactionDate; // 입출금 일시
	private String accountNum; // 계좌_계좌번호

	private String type; // 거래 유형 (입금, 출금)

	private int transactionAmount; // 거래 금액
	private int transactionBalance; // 거래 후 잔액

	private String transactionName; // 거래내역명
	private String targetBankCode; // 거래대상은행코드 (하나, 국민 등)
	private String targetAccountNum; // 거래대상 계좌번호
}

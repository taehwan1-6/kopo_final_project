package kr.ac.kopo.hanabit.account.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class TransactionRequestDto {

	//    private Date transactionDate; // 입출금 일시 default sysdate
	private String accountNum; // 계좌_계좌번호

	private String bankCode; // 보내는 계좌 은행코드 -> api서버에서 처리

	//    private String type; // 거래 유형 (입금, 출금)

	private int transactionAmount; // 거래 금액
	private int transactionBalance; // 거래 후 잔액 -> api서버에서 처리

	private String transactionName; // 거래내역명 (Nullable)

	private String targetBankCode; // 거래대상은행코드 (Nullable) > api서버에서 처리
	private String targetAccountNum; // 거래대상 계좌번호

}
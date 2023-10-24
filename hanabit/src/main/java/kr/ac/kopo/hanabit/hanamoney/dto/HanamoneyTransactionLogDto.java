package kr.ac.kopo.hanabit.hanamoney.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class HanamoneyTransactionLogDto {

	private LocalDateTime transDate;      // 거래 일시 - java
	private String memberEmail;       // 회원 이메일 - java

	private int transAmount;       // 거래 금액 - jsp
	private int transBalance;      // 거래 후 잔고 - java

	// 아래 것들은 다 화면마다 달라지니 화면에서 받자.
	private String transType;         // 거래 타입 (입금, 출금) - jsp
	private String transCategory;     // 거래 카테고리 - jsp
	// (들어오는거: 충전 적립, 이벤트 적립, 무료 적립, 챌린지 적립,
	// 나가는거: 선물하기 사용, 무료송금 등)

	private String transName;         // 거래내역명 - jsp

	private String targetBankCode; // 거래대상은행코드 (하나, 국민 등)
	private String targetAccountNum; // 거래대상은행코드 (하나, 국민 등)

}

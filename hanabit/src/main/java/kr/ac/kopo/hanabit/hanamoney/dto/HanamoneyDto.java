package kr.ac.kopo.hanabit.hanamoney.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class HanamoneyDto {

	private String memberEmail;  // 회원 아이디(회원 식별번호) pk
	private int balance;   // 잔고
	private int easyPassword; // 간편비밀번호
	private String linkedAccountNum; // o 연동 계좌번호

}

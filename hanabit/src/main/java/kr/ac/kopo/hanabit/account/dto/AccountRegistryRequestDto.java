package kr.ac.kopo.hanabit.account.dto;

import lombok.Data;

@Data
// 상품을 가입하면, 하나은행 ap	i 서버로 계좌를 개설했다는 정보를 보내는 dto
public class AccountRegistryRequestDto {

	private String accountNum; // * setter
	private int password; // * form

	private String productName; // 가입한 상품 이름 form
	// private int balance;
	private String type; // 계좌종류 (입출금,예금,적금) setter

	private String status; // 계좌상태 (활성,비활성) setter

	private String bankCode; // 은행코드 (하나,국민 등) -> 근데 '하나'만 쓸거임 (카드소비내역에서면 다른거 씀) setter

	// private String createdAt;

	private String memberEmail; // FK - 어떤 회원인지 식별할 이메일 setter
}

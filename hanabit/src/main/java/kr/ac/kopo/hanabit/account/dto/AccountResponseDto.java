package kr.ac.kopo.hanabit.account.dto;

import lombok.Data;

@Data
public class AccountResponseDto {

    private String accountNum;
    private int password;

    private String productName; // 가입한 상품 이름
    private int balance;
    private String type; // 계좌종류 (입출금,예금,적금)

    private String status; // 계좌상태 (활성,비활성)

    private String bankCode; // 은행코드 (하나,국민 등) -> 근데 '하나'만 쓸거임 (카드소비내역에서면 다른거 씀)

    private String createdAt;

    private String memberEmail; // FK - 어떤 회원인지 식별할 이메일

}

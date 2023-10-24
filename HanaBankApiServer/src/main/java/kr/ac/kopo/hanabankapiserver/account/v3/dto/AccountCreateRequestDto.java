package kr.ac.kopo.hanabankapiserver.account.v3.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class AccountCreateRequestDto {

//    private String accountNum; // api

    private String personalNum;

    private int password; // jsp

    private String productName; // 가입한 상품 이름 // jsp

//    private int balance; // default 0 // api
    private String type; // 계좌종류 (입출금,예금,적금) // jsp

//    private String status; // 계좌상태 (활성,비활성) // api

    private String bankCode; // 은행코드 (하나,국민 등) -> 근데 '하나'만 쓸거임 (카드소비내역에서면 다른거 씀) // jsp

//    private LocalDateTime createdAt; // api

    private String memberEmail; // FK - 어떤 회원인지 식별할 이메일 // api

//    private String memberPersonalNum; // java단에서 줘야 memberEmail파악 가

}

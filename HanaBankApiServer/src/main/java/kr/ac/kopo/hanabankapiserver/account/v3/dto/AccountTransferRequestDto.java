package kr.ac.kopo.hanabankapiserver.account.v3.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class AccountTransferRequestDto {

//    private LocalDateTime transactionDate; // java  // Java의 LocalDate를 사용하려면 java.time 패키지를 import해야 합니다.
    private String accountNum; // 출금 계좌 -- jsp

    private String type; // 출금 or 입금 -- jsp

    private int transactionAmount; // 거래 금액 -- jsp
//    private int transactionBalance; // 거래 후 잔고 -- java

    private String transactionName; // 거래 이름 -- jsp

    private String targetBankCode; // 입금 계좌 은행코드 -- jsp
    private String targetAccountNum; // 입금 계좌 번호 -- jsp

}

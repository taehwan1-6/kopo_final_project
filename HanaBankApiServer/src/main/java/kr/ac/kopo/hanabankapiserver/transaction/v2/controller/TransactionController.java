package kr.ac.kopo.hanabankapiserver.transaction.v2.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import kr.ac.kopo.hanabankapiserver.apikey.service.ApiKeyService;
import kr.ac.kopo.hanabankapiserver.transaction.v2.dto.TransactionResponseDto;
import kr.ac.kopo.hanabankapiserver.transaction.v2.service.TransactionService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Tag(name = "하나은행 거래내역 API", description = "...")
@RestController
@RequiredArgsConstructor
@RequestMapping("/hanabank/v2/transaction")
@Slf4j
public class TransactionController {

    private final ApiKeyService apiKeyService;
    private final TransactionService transactionService;

    @Operation(summary = "계좌 거래내역 전체 조회 메소드", description = "...")
    @GetMapping()
    public ResponseEntity<List<TransactionResponseDto>> savingsList(
            @RequestParam("apiKey") String apiKey,
            @RequestParam String personalNum,
            @RequestParam String accountNum,
            @RequestParam String accountType) {

        // apiKey 확인 성공하면
        if (apiKeyService.getCompanyUserByApiKey(apiKey) != null) {
            // 주민번호로 명의의 계좌 조회
            List<TransactionResponseDto> transactions = transactionService.getAllTransaction(personalNum, accountNum, accountType);
            log.info("transactions={}", transactions);

            return new ResponseEntity<>(transactions, HttpStatus.OK);
        }

        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }


    // @Operation(summary = "클릭 시, 본 계좌에 계좌이체 메소드", description = "...")
    // @PostMapping("/transfer")
    // public ResponseEntity<String> transfer(
    //         @RequestParam("apiKey") String apiKey,
    //         @RequestBody TransactionRequestDto transactionRequestDto) {
    //
    //     // apiKey 확인 성공하면
    //     if (apiKeyService.getCompanyUserByApiKey(apiKey) != null) {
    //
    //         transactionService.transfer(transactionRequestDto);
    //
    //         return new ResponseEntity<>("계좌이체 성공!", HttpStatus.OK);
    //     }
    //
    //     return new ResponseEntity<>("계좌이체 실패..", HttpStatus.NOT_FOUND);
    // }
}

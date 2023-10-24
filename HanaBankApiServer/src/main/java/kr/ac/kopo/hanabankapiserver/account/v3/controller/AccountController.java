package kr.ac.kopo.hanabankapiserver.account.v3.controller;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import kr.ac.kopo.hanabankapiserver.account.v3.dto.AccountCreateRequestDto;
import kr.ac.kopo.hanabankapiserver.account.v3.dto.AccountDto;
import kr.ac.kopo.hanabankapiserver.account.v3.dto.AccountTransferRequestDto;
import kr.ac.kopo.hanabankapiserver.account.v3.mapper.AccountMapper;
import kr.ac.kopo.hanabankapiserver.account.v3.service.AccountService;
import kr.ac.kopo.hanabankapiserver.apikey.mapper.ApiKeyMapper;
import kr.ac.kopo.hanabankapiserver.member.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Tag(name = "하나은행 계좌 관련 API", description = "...")
@RestController
@RequiredArgsConstructor
@RequestMapping("/hanabank/v3/account")
@Slf4j
public class AccountController { // 계좌 생성, 계좌 조회에 관련된 것

    private final ApiKeyMapper apiKeyMapper;
    private final AccountMapper accountMapper;
    private final MemberMapper memberMapper;

    private final AccountService accountService;

    // 입금
    @Operation(summary = "입금 ", description = "...")
    @PostMapping("/deposit")
    public ResponseEntity depositAccount(
            @RequestParam String apiKey,
            @RequestBody AccountTransferRequestDto accountTransferRequestDto) {

        AccountDto sourceAccount = accountMapper.selectByAccountNum(accountTransferRequestDto.getAccountNum());

        // apiKey 확인 성공하면
        if (apiKeyMapper.select(apiKey) != null) {
                accountService.depositAccount(accountTransferRequestDto, sourceAccount);
                return new ResponseEntity<>("입금 성공!", HttpStatus.OK);

        } else {
            return new ResponseEntity<>("입금 실패..", HttpStatus.BAD_REQUEST);
        }
    }

    // 출금 (계좌이체는 출금, 입금 계좌가 동시에 일어나지만, 출금은 출금계좌만 일어남, ex) atm으로 현금뽑기, 하나머니 충전
    @Operation(summary = "출금 ", description = "...")
    @PostMapping("/withdraw")
    public ResponseEntity withdrawAccount(
            @RequestParam String apiKey,
            @RequestParam int password,
            @RequestBody AccountTransferRequestDto accountTransferRequestDto) {

        AccountDto sourceAccount = accountMapper.selectByAccountNum(accountTransferRequestDto.getAccountNum());

        // apiKey 확인 성공하면
        if (apiKeyMapper.select(apiKey) != null) {
            // 계좌이체할때 비밀번호 입력하는데, 비밀번호가 같다면 넘어감
            if (password == sourceAccount.getPassword()) {
                accountService.depositAccount(accountTransferRequestDto, sourceAccount);
                return new ResponseEntity<>("출금 성공!", HttpStatus.OK);
            }

        } else {
            return new ResponseEntity<>("출금 실패..", HttpStatus.BAD_REQUEST);
        }
        return new ResponseEntity<>("비밀번호 불일치..", HttpStatus.BAD_REQUEST);
    }




    // selectAll
    // 모든 계좌 조회
    @Operation(summary = "모든 계좌 조회", description = "...")
    @GetMapping("/all")
    public List<AccountDto> accountAll(
            @RequestParam String apiKey,
            @RequestParam String personalNum) {

        // apiKey 확인 성공하면
        if (apiKeyMapper.select(apiKey) != null) {
            List<AccountDto> accounts = accountMapper.selectAllByPersonalNum(personalNum);

            return accounts;
        }

        throw new IllegalArgumentException("일치하는 apiKey가 없습니다.");

    }

    @Operation(summary = "계좌타입에 따른 모든 계좌 조회 (입출금, 적금, 예금을 선택)", description = "...")
    @GetMapping("/all/type")
    public List<AccountDto> accountAllByType(
            @RequestParam String apiKey,
            @RequestParam String personalNum,
            @RequestParam String type) {

        // apiKey 확인 성공하면
        if (apiKeyMapper.select(apiKey) != null) {
            // 주민번호로 명의의 계좌 조회
            List<AccountDto> accounts = accountMapper.selectAllByPersonalNumAndType(personalNum, type);
            log.info("accountAllByType, accounts={}", accounts);
            log.info("personalNum={}", personalNum);
            log.info("type={}", type);

            return accounts;
        }

        throw new IllegalArgumentException("일치하는 apiKey가 없습니다.");
    }

    // select
    @Operation(summary = "계좌번호로 계좌 단건 조회", description = "...")
    @GetMapping("")
    public AccountDto accountByAccountNum(
            @RequestParam String apiKey,
            @RequestParam String accountNum) {

        // apiKey 확인 성공하면
        if (apiKeyMapper.select(apiKey) != null) {
            // 주민번호로 명의의 계좌 조회
            AccountDto account = accountMapper.selectByAccountNum(accountNum);

            return account;
        }

        throw new IllegalArgumentException("일치하는 apiKey가 없습니다.");
    }

    // update
    // 계좌이체
    @Operation(summary = "계좌 이체 ", description = "...")
    @PostMapping("/transfer")
    public HttpStatus transferAccount(
            @RequestParam String apiKey,
            @RequestParam int password,
            @RequestBody AccountTransferRequestDto accountTransferRequestDto) {

        AccountDto sourceAccount = accountMapper.selectByAccountNum(accountTransferRequestDto.getAccountNum());
        AccountDto destinationAccount = accountMapper.selectByAccountNum(accountTransferRequestDto.getTargetAccountNum());

        // apiKey 확인 성공하면
        if (apiKeyMapper.select(apiKey) != null) {
            // 계좌이체할때 비밀번호 입력하는데, 비밀번호가 같다면 넘어감
            if (password == sourceAccount.getPassword()) {
                accountService.accountTransfer(accountTransferRequestDto, sourceAccount, destinationAccount);
                return HttpStatus.OK;
            }
            return HttpStatus.BAD_REQUEST;
        }
        throw new IllegalArgumentException("일치하는 apiKey가 없습니다.");
    }





    // insert
    @Operation(summary = "계좌 생성", description = "...")
    @PostMapping("/create")
    public AccountDto createAccount(
            @RequestParam String apiKey,
            @RequestBody AccountCreateRequestDto accountCreateRequestDto) {

        AccountDto response = null;
        // apiKey 확인 성공하면
        if (apiKeyMapper.select(apiKey) != null) {
            AccountDto account = accountService.createAccount(accountCreateRequestDto);
            return account;
        } else {
            log.info("apiKey 불일치");
        }
        return response;
    }

}

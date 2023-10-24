package kr.ac.kopo.hanabit.account.service;

import kr.ac.kopo.hanabit.account.dto.AccountCreateRequestDto;
import kr.ac.kopo.hanabit.account.dto.AccountDto;
import kr.ac.kopo.hanabit.account.dto.AccountTransferRequestDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;
import java.util.List;

@Service
@Slf4j
public class AccountServiceImpl implements AccountService {

    @Value("${hanabank.apikey}")
    private String apiKey;

    @Override
    public HttpStatus depositAccount(AccountTransferRequestDto accountTransferRequestDto) {
        URI uri = UriComponentsBuilder
                .fromUriString("http://localhost:8082/")
                .path("/hanabank/v3/account/deposit")
                .queryParam("apiKey", apiKey)
                .encode()
                .build()
                .toUri();

        RestTemplate restTemplate = new RestTemplate();

        // 헤더 생성 (만약 필요하다면)
        HttpHeaders headers = new HttpHeaders();
        headers.set("Content-Type", "application/json;charset=UTF-8");
        // 기타 필요한 헤더는 여기에 추가하세요.

        // HTTP 요청 본문과 헤더를 담는 엔터티 생성
        HttpEntity<AccountTransferRequestDto> entity = new HttpEntity<>(accountTransferRequestDto, headers);

        ResponseEntity<String> response = restTemplate.exchange(uri, HttpMethod.POST, entity, String.class);
        String responseBody = response.getBody();

        // API 응답의 상태 코드를 확인하고 그대로 반환
        return response.getStatusCode();

//        if ("입금 성공!".equals(responseBody)) {
//            return response;
////            return HttpStatus.OK;
//        } else {
//            return response;
//        }
    }

    @Override
    public HttpStatus withdrawAccount(
            int password,
            AccountTransferRequestDto accountTransferRequestDto) {

        URI uri = UriComponentsBuilder
                .fromUriString("http://localhost:8082/")
                .path("/hanabank/v3/account/withdraw")
                .queryParam("apiKey", apiKey)
                .queryParam("password", password)
                .encode()
                .build()
                .toUri();

        RestTemplate restTemplate = new RestTemplate();


        // 헤더 생성 (만약 필요하다면)
        HttpHeaders headers = new HttpHeaders();
        headers.set("Content-Type", "application/json;charset=UTF-8");
        // 기타 필요한 헤더는 여기에 추가하세요.

        // HTTP 요청 본문과 헤더를 담는 엔터티 생성
        HttpEntity<AccountTransferRequestDto> entity = new HttpEntity<>(accountTransferRequestDto, headers);
//            HttpEntity<AccountTransferRequestDto> entity = new HttpEntity<>(accountTransferRequestDto);

//            ResponseEntity<ResponseEntity> response
//                    = restTemplate.exchange(uri, HttpMethod.POST, entity, new ParameterizedTypeReference<ResponseEntity>() {});
        ResponseEntity<String> response = restTemplate.exchange(uri, HttpMethod.POST, entity, String.class);
        String responseBody = response.getBody();

        return response.getStatusCode();
    }


    @Override
    public HttpStatus transferAccount(int password, AccountTransferRequestDto accountTransferRequestDto) {
        URI uri = UriComponentsBuilder
                .fromUriString("http://localhost:8082/")
                .path("/hanabank/v3/account/transfer")
                .queryParam("apiKey", apiKey)
                .queryParam("password", password)
                .encode()
                .build()
                .toUri();

        RestTemplate restTemplate = new RestTemplate();


        // 헤더 생성 (만약 필요하다면)
        HttpHeaders headers = new HttpHeaders();
        headers.set("Content-Type", "application/json;charset=UTF-8");
        // 기타 필요한 헤더는 여기에 추가하세요.

        // HTTP 요청 본문과 헤더를 담는 엔터티 생성
        HttpEntity<AccountTransferRequestDto> entity = new HttpEntity<>(accountTransferRequestDto, headers);

//            ResponseEntity<ResponseEntity> response
//                    = restTemplate.exchange(uri, HttpMethod.POST, entity, new ParameterizedTypeReference<ResponseEntity>() {});
        ResponseEntity<String> response = restTemplate.exchange(uri, HttpMethod.POST, entity, String.class);
        String responseBody = response.getBody();

        return response.getStatusCode();
    }

    @Override
    public List<AccountDto> getAll(String personalNum) {
        URI uri = UriComponentsBuilder
                .fromUriString("http://localhost:8082/")
                .path("/hanabank/v3/account/all")
                .queryParam("apiKey", apiKey)
                .queryParam("personalNum", personalNum)
                .encode()
                .build()
                .toUri();

        RestTemplate restTemplate = new RestTemplate();

        // header 생성
        HttpHeaders headers = new HttpHeaders();
        headers.set("Content-Type", "application/json");

        // HTTP 요청 body과 header를 담는 엔터티 생성
        HttpEntity<String> entity
                = new HttpEntity<>(null, headers);

        // HTTP 요청
        ResponseEntity<List<AccountDto>> response
                = restTemplate.exchange(uri, HttpMethod.GET, entity, new ParameterizedTypeReference<List<AccountDto>>() {});


        return response.getBody();

    }

    @Override
    public List<AccountDto> getAllByType(String personalNum, String type) {
        URI uri = UriComponentsBuilder
                .fromUriString("http://localhost:8082/")
                .path("/hanabank/v3/account/all/type")
                .queryParam("apiKey", apiKey)
                .queryParam("personalNum", personalNum)
                .queryParam("type", type)
                .encode()
                .build()
                .toUri();

        RestTemplate restTemplate = new RestTemplate();

        // header 생성
        HttpHeaders headers = new HttpHeaders();
        headers.set("Content-Type", "application/json");

        // HTTP 요청 body과 header를 담는 엔터티 생성
        HttpEntity<String> entity
                = new HttpEntity<>(null, headers);

        // HTTP 요청
        ResponseEntity<List<AccountDto>> response
                = restTemplate.exchange(uri, HttpMethod.GET, entity, new ParameterizedTypeReference<List<AccountDto>>() {});

        log.info("getAllByType, response={}", response);

        return response.getBody();

    }

    @Override
    public AccountDto getByAccountNum(String accountNum) {
        URI uri = UriComponentsBuilder
                .fromUriString("http://localhost:8082/")
                .path("/hanabank/v3/account")
                .queryParam("apiKey", apiKey)
                .queryParam("accountNum", accountNum)
                .encode()
                .build()
                .toUri();

        RestTemplate restTemplate = new RestTemplate();

        // header 생성
        HttpHeaders headers = new HttpHeaders();
        headers.set("Content-Type", "application/json");

        // HTTP 요청 body과 header를 담는 엔터티 생성
        HttpEntity<String> entity
                = new HttpEntity<>(null, headers);

        // HTTP 요청
        ResponseEntity<AccountDto> response
                = restTemplate.exchange(uri, HttpMethod.GET, entity, new ParameterizedTypeReference<AccountDto>() {});


        return response.getBody();
    }

    @Override
    public AccountDto createAccount(
            AccountCreateRequestDto accountCreateRequestDto) {

        URI uri = UriComponentsBuilder
                .fromUriString("http://localhost:8082/")
                .path("/hanabank/v3/account/create")
                .queryParam("apiKey", apiKey)
                .encode()
                .build()
                .toUri();

        RestTemplate restTemplate = new RestTemplate();


        try {
            // 헤더 생성 (만약 필요하다면)
            HttpHeaders headers = new HttpHeaders();
            headers.set("Content-Type", "application/json");
            // 기타 필요한 헤더는 여기에 추가하세요.

            // HTTP 요청 본문과 헤더를 담는 엔터티 생성
            HttpEntity<AccountCreateRequestDto> entity = new HttpEntity<>(accountCreateRequestDto, headers);


            ResponseEntity<AccountDto> response
                    = restTemplate.exchange(uri, HttpMethod.POST, entity, new ParameterizedTypeReference<AccountDto>() {});

            if (response.getStatusCode() == HttpStatus.OK) {
//                return response.getStatusCode();
                return response.getBody();
            } else {
                throw new RuntimeException("Failed with HTTP error code : " + response.getStatusCode());
            }

        } catch (Exception e) {
            throw new RuntimeException("Exception: " + e.getMessage());
        }

    }
}

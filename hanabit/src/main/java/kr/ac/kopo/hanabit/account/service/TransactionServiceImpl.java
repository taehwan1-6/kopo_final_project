package kr.ac.kopo.hanabit.account.service;

import kr.ac.kopo.hanabit.account.dto.TransactionRequestDto;
import kr.ac.kopo.hanabit.account.dto.TransactionResponseDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;
import java.util.List;

@Service
@Slf4j
public class TransactionServiceImpl implements TransactionService {

    @Value("${hanabank.apikey}")
    private String apiKey;

    @Override
    public List<TransactionResponseDto> getAllTransaction(String personalNum, String accountNum, String accountType) {
        // GET
        // 둘다 queryParam으로 보내기
        URI uri = UriComponentsBuilder
                .fromUriString("http://localhost:8082")
                .path("/hanabank/v2/transaction")
                .queryParam("apiKey", apiKey)
                .queryParam("personalNum", personalNum)
                .queryParam("accountNum", accountNum)
                .queryParam("accountType", accountType)
                .encode()
                .build()
                .toUri();

        RestTemplate restTemplate = new RestTemplate();

//        List<TransactionResponseDto> response = restTemplate.getForObject(uri, List.class);
//        return response;

        // header 생성
        HttpHeaders headers = new HttpHeaders();
        headers.set("Content-Type", "application/json");

        // HTTP 요청 body과 header를 담는 엔터티 생성
        HttpEntity<String> entity
                = new HttpEntity<>(null, headers);

        // HTTP 요청
        ResponseEntity<List<TransactionResponseDto>> response
                = restTemplate.exchange(uri, HttpMethod.GET, entity, new ParameterizedTypeReference<List<TransactionResponseDto>>() {});

        log.info("getAllByType, response={}", response);

        return response.getBody();


    }

    @Override
    public String transfer(TransactionRequestDto transactionRequestDto) {

        URI uri = UriComponentsBuilder
            .fromUriString("http://localhost:8082")
            .path("/hanabank/v2/transaction/transfer")
            .queryParam("apiKey", apiKey)
            .encode()
            .build()
            .toUri();

        RestTemplate restTemplate = new RestTemplate();

        // 헤더 생성 (만약 필요하다면)
        HttpHeaders headers = new HttpHeaders();
        headers.set("Content-Type", "application/json");
        // 기타 필요한 헤더는 여기에 추가하세요.

        // HTTP 요청 본문과 헤더를 담는 엔터티 생성
        HttpEntity<TransactionRequestDto> entity = new HttpEntity<>(transactionRequestDto, headers);

        // POST 요청 보내기
        ResponseEntity<String> response = restTemplate.exchange(uri, HttpMethod.POST, entity, String.class);

        // 응답 출력 (필요에 따라 수정하실 수 있습니다)
        log.info(response.getBody());

        return response.getBody();
    }
}

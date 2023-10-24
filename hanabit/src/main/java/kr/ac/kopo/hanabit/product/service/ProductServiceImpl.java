package kr.ac.kopo.hanabit.product.service;

import kr.ac.kopo.hanabit.account.dto.AccountCreateRequestDto;
import kr.ac.kopo.hanabit.account.dto.AccountDto;
import kr.ac.kopo.hanabit.account.dto.AccountTransferRequestDto;
import kr.ac.kopo.hanabit.account.service.AccountService;
import kr.ac.kopo.hanabit.challenge.mapper.ChallengeMapper;
import kr.ac.kopo.hanabit.member.dto.MemberDto;
import kr.ac.kopo.hanabit.member.service.MemberService;
import kr.ac.kopo.hanabit.product.entity.ProductEntity;
import kr.ac.kopo.hanabit.product.entity.ProductMemberEntity;
import kr.ac.kopo.hanabit.product.repository.ProductMemberRepository;
import kr.ac.kopo.hanabit.product.repository.ProductPaginationRepository;
import kr.ac.kopo.hanabit.product.repository.ProductRepository;
import kr.ac.kopo.hanabit.util.ocr.MyFileNameGenerator;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.File;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class ProductServiceImpl implements ProductService {

    private final ProductRepository productRepository;
    private final ProductPaginationRepository paginationRepository;
    private final ProductMemberRepository productMemberRepository;
    private final AccountService accountService;
    private final MemberService memberService;
    private final ProductMemberRepository productMemRepository;
    private final ChallengeMapper challengeMapper;

    @Value("${upload.path.product}")
    private String productImgUploadPath;


    @Transactional
    public String maturityRate(ProductMemberEntity productMember) {
        productMember.setRegistryProductStatus("만기");
        productMemRepository.save(productMember);

        // 0. 현재까지의 챌린지 횟수
        LocalDate RegistryDate = productMember.getRegistryDate();
        LocalDate MaturityDate = productMember.getMaturityDate();
        int c = challengeMapper.countChallengeLogsByDateRange(RegistryDate, MaturityDate);

        // 0-1. 챌린지 횟수 별 우대금리
        Double productPreferRate = productMember.getProductEntity().getProductPreferRate();
        switch (c / 10) {
            case 1:
                productPreferRate = productPreferRate * (1 / 4);
                break;
            case 2:
                productPreferRate = productPreferRate * (2 / 4);
                break;
            case 3:
                productPreferRate = productPreferRate * (3 / 4);
                break;
            case 4:
                break;
            default:
                if (c < 10) {
                    productPreferRate = 0.0;
                } else {
                }
                break;
        }


        // 1. 가입한 정기예금 계좌로 이자 지급
        int amount = productMember.getRegistryAmount();
        int period = productMember.getRegistryPeriod();
        Double baseRate = productMember.getProductEntity().getProductBaseRate();
        Double preferRate = productPreferRate;
        int rate = (int) (amount * ((baseRate + preferRate) / 100) * (period / 12) - (154 / 1000));

        AccountTransferRequestDto accountTransferRequestDto
                = AccountTransferRequestDto.builder()
                .accountNum(productMember.getRegistryProductAccountNum())
                .type("입금")
                .transactionAmount(rate)
                .transactionName("정기예금 이자지급")
                .targetBankCode("하나")
                .targetAccountNum("하나은행")
                .build();
        accountService.depositAccount(accountTransferRequestDto);


        try {
            System.out.println("Waiting for 100 seconds...");
            Thread.sleep(100 * 1000);  // 100초 동안 대기
            System.out.println("Resumed after 100 seconds");
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        // 2. 가입한 정기예금 계좌에서 -> 연결해놨던 입출금 계좌로 계좌 이체
        AccountDto registryAccount
                = accountService.getByAccountNum(productMember.getRegistryProductAccountNum());
        AccountTransferRequestDto accountTransferRequestDto2
                = AccountTransferRequestDto.builder()
                .accountNum(registryAccount.getAccountNum())
                .type("출금")
                .transactionAmount(registryAccount.getBalance())
                .transactionName("정기예금 이자지급")
                .targetBankCode("하나")
                .targetAccountNum("하나빗 챌린지 정기예금")
                .build();
        accountService.transferAccount(registryAccount.getPassword(), accountTransferRequestDto2);

        return "만기 이자 지급 성공";
    }


    @Override
    @Transactional
    public String registryProduct(MemberDto currentMember, String productCode, ProductMemberEntity registry) {

        try {
            ProductEntity product = productRepository.getReferenceById(productCode);

            // 2. 계좌 정보에 insert (계좌 생성)
            AccountCreateRequestDto accountCreateRequestDto = AccountCreateRequestDto.builder()
                    .personalNum(currentMember.getPersonalNum())
                    .password(registry.getRegistryAccountPassword())
                    .productName(product.getProductName())
                    .type("예금")
                    .bankCode("하나")
                    .memberEmail(currentMember.getEmail())
                    .build();
            AccountDto newAccount = accountService.createAccount(accountCreateRequestDto);

            // 1. 상품 가입 회원 insert
            ProductMemberEntity registryBuilder = ProductMemberEntity.builder()
                    .registryProductAccountNum(newAccount.getAccountNum())
                    .linkedAccountNum(registry.getLinkedAccountNum())
                    .registryAmount(registry.getRegistryAmount() * 10000)
                    .registryPeriod(registry.getRegistryPeriod())
                    .registryAccountPassword(registry.getRegistryAccountPassword())
                    .registryDate(LocalDate.now())
                    .maturityDate(LocalDate.now().plusMonths(registry.getRegistryPeriod()))
                    .registryProductStatus("진행")
                    .productEntity(product)
                    .memberEntity(memberService.convertToEntity(currentMember))
                    .build();
            productMemberRepository.save(registryBuilder);

            // 3. 연동 계좌 -> 새로운 정기예금 계좌 가입금액만큼 계좌이체
            AccountTransferRequestDto accountTransferRequestDto = AccountTransferRequestDto.builder()
                    .accountNum(registry.getLinkedAccountNum())
                    .type("출금")
                    .transactionAmount(registry.getRegistryAmount() * 10000)
                    .transactionName("입출금|" + registry.getLinkedAccountNum() + "-> 정기예금")
                    .targetBankCode("하나")
                    .targetAccountNum(registryBuilder.getRegistryProductAccountNum())
                    .build();

            HttpStatus httpStatus = accountService.transferAccount(registry.getRegistryAccountPassword(),
                    accountTransferRequestDto);

            if (httpStatus == HttpStatus.OK) {
                return "정기예금 상품 가입 성공";
            } else {
                return "정기예금 상품 가입 실패";
            }

        } catch (Exception e) {
            e.printStackTrace();
            return "정기예금 상품 가입 실패";
        }

    }

    @Override
    public Page<ProductEntity> getProductList(int page) {
        List<Sort.Order> sorts = new ArrayList<>();
        sorts.add(Sort.Order.desc("productCreatedAt"));
        Pageable pageable = PageRequest.of(page, 6, Sort.by(sorts));
        return paginationRepository.findAll(pageable);
    }

    @Override
    @Transactional
    public ProductEntity createProduct(ProductEntity productEntity,
                                       MultipartHttpServletRequest request) {
        MultipartFile file1 = request.getFile("signImg1");

        String uploadPath = productImgUploadPath;
        productEntity.setProductImgPath("common/assets/images/upload/product");

        if (!file1.isEmpty()) {
            File newFileName1 = MyFileNameGenerator.rename(new File(uploadPath, file1.getOriginalFilename()));
            log.info("newFileName1.getName() = {}", newFileName1.getName());

            productEntity.setProductTitleImg(newFileName1.getName());
            log.info("productDto = {}", productEntity);

            try {
                file1.transferTo(newFileName1);

            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        // 챌린지 개설 insert
        ProductEntity result = productRepository.save(productEntity);

        return result;
    }
}

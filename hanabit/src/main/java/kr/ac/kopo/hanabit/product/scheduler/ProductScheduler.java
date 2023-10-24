package kr.ac.kopo.hanabit.product.scheduler;

import kr.ac.kopo.hanabit.account.service.AccountService;
import kr.ac.kopo.hanabit.challenge.mapper.ChallengeMapper;
import kr.ac.kopo.hanabit.product.entity.ProductMemberEntity;
import kr.ac.kopo.hanabit.product.repository.ProductMemberRepository;
import kr.ac.kopo.hanabit.product.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.util.List;

@Component
@RequiredArgsConstructor
public class ProductScheduler {

    private final ProductMemberRepository productMemRepository;
    private final ChallengeMapper challengeMapper;
    private final AccountService accountService;
    private ProductService productService;

    // 매일 0시 0분 0초에 실행
    @Scheduled(cron = "0 0 0 * * ?")
    public void checkAndUpdateProductStatus() {
        // 여기서 상품의 상태를 확인하고 필요한 경우 상태를 변경하는 로직을 수행
        List<ProductMemberEntity> productMembers = productMemRepository.findAll();
        for (ProductMemberEntity productMember : productMembers) {
            if (LocalDate.now() == productMember.getMaturityDate()) {
                productService.maturityRate(productMember);
            }
        }
    }
}


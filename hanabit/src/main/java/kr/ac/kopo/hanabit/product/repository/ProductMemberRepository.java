package kr.ac.kopo.hanabit.product.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.hanabit.product.entity.ProductMemberEntity;

@Repository
public interface ProductMemberRepository extends JpaRepository<ProductMemberEntity, String> {
	ProductMemberEntity findByMemberEntityEmail(String memberEmail);

	// 상태가 "만기"로 업데이트하는 메서드
}






package kr.ac.kopo.hanabit.product.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.hanabit.product.entity.ProductEntity;

@Repository
public interface ProductPaginationRepository extends JpaRepository<ProductEntity, Integer> {
	Page<ProductEntity> findAll(Pageable pageable);
}

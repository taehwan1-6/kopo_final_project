package kr.ac.kopo.hanabit.gifticon.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.hanabit.gifticon.entity.Gifticon;

@Repository
public interface GifticonRepository extends JpaRepository<Gifticon, String>, JpaSpecificationExecutor<Gifticon> {

	Page<Gifticon> findAllByOrderByGifticonCreatedAtDesc(Pageable pageable);
}

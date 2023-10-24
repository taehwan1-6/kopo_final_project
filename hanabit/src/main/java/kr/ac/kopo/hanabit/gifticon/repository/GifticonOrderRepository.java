package kr.ac.kopo.hanabit.gifticon.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.hanabit.gifticon.entity.GifticonOrder;

@Repository
public interface GifticonOrderRepository extends JpaRepository<GifticonOrder, String> {
}
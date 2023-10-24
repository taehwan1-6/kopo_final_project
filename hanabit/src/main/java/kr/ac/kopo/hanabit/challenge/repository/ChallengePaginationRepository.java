package kr.ac.kopo.hanabit.challenge.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.hanabit.challenge.dto.ChallengeDto;

@Repository
public interface ChallengePaginationRepository extends JpaRepository<ChallengeDto, Integer> {
	Page<ChallengeDto> findAll(Pageable pageable);

	Page<ChallengeDto> findByChallengeCategory(String challengeCategory, Pageable pageable);

}

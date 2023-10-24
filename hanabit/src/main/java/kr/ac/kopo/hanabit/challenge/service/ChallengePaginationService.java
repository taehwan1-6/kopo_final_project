package kr.ac.kopo.hanabit.challenge.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import kr.ac.kopo.hanabit.challenge.dto.ChallengeDto;
import kr.ac.kopo.hanabit.challenge.repository.ChallengePaginationRepository;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ChallengePaginationService {

	private final ChallengePaginationRepository paginationRepository;

	public Page<ChallengeDto> getChallengeList(int page) {
		List<Sort.Order> sorts = new ArrayList<>();
		sorts.add(Sort.Order.desc("challengeCreatedAt"));
		Pageable pageable = PageRequest.of(page, 6, Sort.by(sorts));
		return paginationRepository.findAll(pageable);
	}

	public Page<ChallengeDto> getChallengeListCategory(int page, String challengeCategory) {
		List<Sort.Order> sorts = new ArrayList<>();
		sorts.add(Sort.Order.desc("challengeCreatedAt"));
		Pageable pageable = PageRequest.of(page, 6, Sort.by(sorts));
		return paginationRepository.findByChallengeCategory(challengeCategory, pageable);
	}

}

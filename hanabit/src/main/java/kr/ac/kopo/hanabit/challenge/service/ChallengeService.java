package kr.ac.kopo.hanabit.challenge.service;

import kr.ac.kopo.hanabit.challenge.dto.ChallengeLogDto;

public interface ChallengeService {

	// 영수증 인증 사진 올리고, ocr 인증
	String fileOCR(String fileName);

	// 인증 되면 -> 챌린지 기록에 insert
	void insertChallengeLog(ChallengeLogDto challengeLogDto);

}

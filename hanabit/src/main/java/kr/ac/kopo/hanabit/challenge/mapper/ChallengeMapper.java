package kr.ac.kopo.hanabit.challenge.mapper;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.ac.kopo.hanabit.challenge.dto.ChallengeDto;
import kr.ac.kopo.hanabit.challenge.dto.ChallengeLogDto;

@Mapper
public interface ChallengeMapper {

	int countChallengeLogsByDateRange(@Param("startDate") LocalDate startDate,
		@Param("endDate") LocalDate endDate);

	List<Map<String, Object>> selectChallengeLogPoint(String memberEmail);

	int sumPointByMemberEmail(String memberEmail);

	List<ChallengeLogDto> selectAllChallengeLogByMemberEmail(String memberEmail);

	List<Map<String, Object>> selectChallengeLogMap(String memberEmail);

	// selectAll
	List<ChallengeDto> selectAll();

	List<ChallengeDto> selectAllByCategory(String category);

	// select
	ChallengeDto selectByChallengeCode(String challengeCode);

	// insert
	int insertChallengeLog(ChallengeLogDto challengeLogDto);

	int insertChallenge(ChallengeDto challengeDto);
}

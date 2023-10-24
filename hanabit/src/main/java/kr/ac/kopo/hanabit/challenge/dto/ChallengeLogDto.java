package kr.ac.kopo.hanabit.challenge.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ChallengeLogDto {

	private int challengeLogId; // * 챌린지 기록 id (pk)
	private LocalDateTime challengeLogDate; // * 챌린지 기록 일시
	private int challengePoint; // * 챌린지로 얻은 하나머니

	private String challengeCode; // * 챌린지 식별 코드 (fk)

	private String memberEmail; // * 회원 이메일 (fk)

}

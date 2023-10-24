package kr.ac.kopo.hanabit.challenge.dto;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "hb_challenges")
public class ChallengeDto {

	@Id
	private String challengeCode;  // * 챌린지 식별 id
	private String challengeName;  // * 챌린지명
	private int challengeRewardAmount;  // * 챌린지 포인트 금액

	private String challengeInfoSummary;
	private String challengeInfoContent;  // o 챌린지 설명
	private String challengeAuthContent;  // o 챌린지 설명

	private String challengeImgPath;
	private String challengeTitleImg;  // 챌린지 타이틀 이미지
	private String challengeAuthImg;  // 챌린지인증 이미지

	private String challengeCategory;  // 챌린지 카테고리
	private String challengeStatus;  // 챌린지 상태 (진행, 종료)

	private LocalDateTime challengeCreatedAt;

}

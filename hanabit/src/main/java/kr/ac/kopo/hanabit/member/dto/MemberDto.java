package kr.ac.kopo.hanabit.member.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MemberDto {

	private String email; // Primary key
	private String password; // Not null
	private String name; // Not null

	private String personalNum; // Nullable
	private String phoneNum; // Nullable

	private String interest; // Nullable

	private String profileImgPath; // Nullable
	private String profileImgName; // Nullable

	private String role;
	private String createdAt;

	private String isLinkedAccount; // o 연동 계좌 유무
}

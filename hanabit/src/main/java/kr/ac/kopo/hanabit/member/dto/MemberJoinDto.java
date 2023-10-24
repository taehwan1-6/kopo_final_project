package kr.ac.kopo.hanabit.member.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MemberJoinDto {
	private String email;
	private String password;
	private String name;

	private String interest;

	//	private String personalNum;
}

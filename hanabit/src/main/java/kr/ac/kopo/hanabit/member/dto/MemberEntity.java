package kr.ac.kopo.hanabit.member.dto;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "hb_members")
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MemberEntity {

	@Id
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

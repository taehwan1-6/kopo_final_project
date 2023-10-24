package kr.ac.kopo.hanabit.member.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.ac.kopo.hanabit.member.dto.MemberDto;
import kr.ac.kopo.hanabit.member.dto.MemberJoinDto;
import kr.ac.kopo.hanabit.member.dto.MemberLoginDto;

@Mapper
public interface MemberMapper {

	/**
	 * v2
	 */
	int updateIsLinkedAccount(
		@Param("email") String email,
		@Param("isLinkedAccount") String isLinkedAccount);

	int updatePersonalNum(
		@Param("email") String email,
		@Param("personalNum") String personalNum);

	/**
	 *
	 */
	int delete(String email);

	void join(MemberJoinDto memberJoinDto);

	void join2(MemberJoinDto memberJoinDto);

	MemberDto login(MemberLoginDto memberLoginDto);
}

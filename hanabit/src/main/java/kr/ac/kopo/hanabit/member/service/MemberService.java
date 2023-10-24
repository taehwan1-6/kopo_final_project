package kr.ac.kopo.hanabit.member.service;

import kr.ac.kopo.hanabit.member.dto.MemberDto;
import kr.ac.kopo.hanabit.member.dto.MemberEntity;
import kr.ac.kopo.hanabit.member.dto.MemberJoinDto;
import kr.ac.kopo.hanabit.member.dto.MemberLoginDto;

public interface MemberService {

	void join(MemberJoinDto memberJoinDto);

	void join2(MemberJoinDto memberJoinDto);

	MemberDto login(MemberLoginDto memberLoginDto);

	// Dto <-> Entity 형변환
	MemberEntity convertToEntity(MemberDto dto);

	MemberDto convertToDto(MemberEntity entity);
}

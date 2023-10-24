package kr.ac.kopo.hanabit.member.service;

import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import kr.ac.kopo.hanabit.member.dto.MemberDto;
import kr.ac.kopo.hanabit.member.dto.MemberEntity;
import kr.ac.kopo.hanabit.member.dto.MemberJoinDto;
import kr.ac.kopo.hanabit.member.dto.MemberLoginDto;
import kr.ac.kopo.hanabit.member.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {

	private final MemberMapper memberMapper;

	private final ModelMapper modelMapper;

	@Override
	public void join(MemberJoinDto memberJoinDto) {
		memberMapper.join(memberJoinDto);
	}

	public void join2(MemberJoinDto memberJoinDto) {
		memberMapper.join2(memberJoinDto);
	}

	@Override
	public MemberDto login(MemberLoginDto memberLoginDto) {
		MemberDto memberDto = memberMapper.login(memberLoginDto);

		return memberDto;
	}

	// Dto <-> Entity 형변환
	public MemberEntity convertToEntity(MemberDto dto) {
		return modelMapper.map(dto, MemberEntity.class);
	}

	public MemberDto convertToDto(MemberEntity entity) {
		return modelMapper.map(entity, MemberDto.class);
	}
}

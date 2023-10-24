package kr.ac.kopo.hanabit.hanamoney.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.ac.kopo.hanabit.hanamoney.dto.HanamoneyTransactionLogDto;
import kr.ac.kopo.hanabit.hanamoney.mapper.HanamoneyMapper;
import kr.ac.kopo.hanabit.member.dto.MemberDto;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/hanamoney-log")
public class HanamoneyLogController {

	private final HanamoneyMapper hanamoneyMapper;

	@GetMapping
	@ResponseBody
	public List<HanamoneyTransactionLogDto> hanamoneyLogs(@SessionAttribute MemberDto currentMember) {
		List<HanamoneyTransactionLogDto> hanamoneyTransactionLogDtos = hanamoneyMapper.selectAllTransactionLog(
			currentMember.getEmail());

		return hanamoneyTransactionLogDtos;
	}
}

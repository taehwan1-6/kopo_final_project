package kr.ac.kopo.hanabit.challenge.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.ac.kopo.hanabit.challenge.mapper.ChallengeMapper;
import kr.ac.kopo.hanabit.challenge.service.ChallengeServiceImpl;
import kr.ac.kopo.hanabit.member.dto.MemberDto;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/my-challenge")
public class MyChallengeController {

	private final ChallengeServiceImpl challengeService;
	private final ChallengeMapper challengeMapper;

	@GetMapping("/log")
	@ResponseBody
	public List<Map<String, Object>> myPoint(
		@SessionAttribute MemberDto currentMember) {
		List<Map<String, Object>> data = challengeMapper.selectChallengeLogPoint(currentMember.getEmail());
		return data;

	}

	@ResponseBody
	@PostMapping("/calendar")
	public List<Map<String, Object>> myPointCalendar(
		@SessionAttribute MemberDto currentMember,
		@RequestParam("challengeCode") String challengeCode,
		HttpSession session,
		Model model) {

		List<Map<String, Object>> calendarList = new ArrayList<>();
		List<Map<String, Object>> challengeHistoryMapList = challengeService.challengeLogMap(currentMember.getEmail());
		System.out.println("challengeHistoryMapList:" + challengeHistoryMapList);
		for (Map<String, Object> challengeHistory : challengeHistoryMapList) {
			HashMap<String, Object> map = new HashMap<String, Object>();

			map.put("title", challengeHistory.get("CHALLENGE_NAME"));
			map.put("start", challengeHistory.get("CHALLENGE_LOG_DATE"));

			calendarList.add(map);
		}
		System.out.println("calendarList: " + calendarList);
		return calendarList;

	}

	@GetMapping
	public String myChallenge(@SessionAttribute MemberDto currentMember,
		Model model) {

		int sumPoint = challengeMapper.sumPointByMemberEmail(currentMember.getEmail());
		model.addAttribute("sumPoint", sumPoint);

		return "mypage/myChallenge";
	}

}

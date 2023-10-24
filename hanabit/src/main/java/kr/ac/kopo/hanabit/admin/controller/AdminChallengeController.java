package kr.ac.kopo.hanabit.admin.controller;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.ac.kopo.hanabit.admin.service.AdminChallengeService;
import kr.ac.kopo.hanabit.challenge.dto.ChallengeDto;
import kr.ac.kopo.hanabit.challenge.service.ChallengePaginationService;
import kr.ac.kopo.hanabit.commcode.dto.CategoryCodeDto;
import kr.ac.kopo.hanabit.commcode.mapper.CommCodeMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/challenges")
@Slf4j
public class AdminChallengeController {

	private final CommCodeMapper commCodeMapper;

	private final AdminChallengeService challengeService;
	private final ChallengePaginationService paginationService;

	@PostMapping
	public String createChallenge(
		@ModelAttribute ChallengeDto challengeDto,
		MultipartHttpServletRequest request) {
		int result = challengeService.createChallenge(challengeDto, request);

		if (result == 1) {
			log.info("챌린지가 개설이 성공하였습니다!");
		} else {
			log.info("챌린지가 개설에 실패하였습니다..");
		}

		return "redirect:/admin/challenges";
	}

	@GetMapping("/create")
	public String challengeCreateForm(Model model) {
		List<CategoryCodeDto> categoryDtos = commCodeMapper.selectAllById("100");
		model.addAttribute("categoryDtos", categoryDtos);
		return "admin/container/adminChallengeCreateForm";
	}

	@GetMapping
	public String pagingChallenges(Model model,
		@RequestParam(value = "page", defaultValue = "0") int page) {
		Page<ChallengeDto> paging = paginationService.getChallengeList(page);
		model.addAttribute("paging", paging);

		List<CategoryCodeDto> categoryDtos = commCodeMapper.selectAllById("100");
		model.addAttribute("categoryDtos", categoryDtos);

		return "admin/container/adminChallenges";
	}

}

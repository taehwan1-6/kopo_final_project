package kr.ac.kopo.hanabit.challenge.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.kopo.hanabit.challenge.dto.ChallengeDto;
import kr.ac.kopo.hanabit.challenge.dto.ChallengeLogDto;
import kr.ac.kopo.hanabit.challenge.mapper.ChallengeMapper;
import kr.ac.kopo.hanabit.challenge.service.ChallengePaginationService;
import kr.ac.kopo.hanabit.challenge.service.ChallengeServiceImpl;
import kr.ac.kopo.hanabit.commcode.dto.CategoryCodeDto;
import kr.ac.kopo.hanabit.commcode.mapper.CommCodeMapper;
import kr.ac.kopo.hanabit.member.dto.MemberDto;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/challenges")
public class ChallengeController {

	private final ChallengeServiceImpl challengeService;
	private final ChallengeMapper challengeMapper;
	private final CommCodeMapper commCodeMapper;
	private final ChallengePaginationService paginationService;
	@Value("${upload.path.challenge.auth}")
	private String authUploadPath;
	@Value("${kakao.hanabit.appkey}")
	private String kakaoAppKey;

	@GetMapping
	public String pagingChallenges(Model model,
		@RequestParam(value = "page", defaultValue = "0") int page) {
		Page<ChallengeDto> paging = paginationService.getChallengeList(page);
		model.addAttribute("pagingChallenges", paging);

		List<CategoryCodeDto> categoryCodeDtos = commCodeMapper.selectAllById("100");
		model.addAttribute("categories", categoryCodeDtos);

		return "challenge/challenges";
	}

	@GetMapping("/category/{category}")
	public String challengesByCategory(@PathVariable("category") String category,
		@RequestParam(value = "page", defaultValue = "0") int page,
		Model model) {
		List<CategoryCodeDto> categoryCodeDtos = commCodeMapper.selectAllById("100");
		model.addAttribute("categories", categoryCodeDtos);

		Page<ChallengeDto> paging = paginationService.getChallengeListCategory(page, category);
		model.addAttribute("pagingChallenges", paging);

		return "challenge/challenges";
	}

	@GetMapping("/{challengeCode}")
	public String detail(
		@SessionAttribute MemberDto currentMember,
		@PathVariable String challengeCode,
		Model model) {
		model.addAttribute("currentMember", currentMember);

		ChallengeDto challengeDto = challengeMapper.selectByChallengeCode(challengeCode);
		model.addAttribute("challengeDto", challengeDto);
		model.addAttribute("kakaoAppKey", kakaoAppKey);

		return "challenge/challengeDetail";
	}

	@ResponseBody
	@PostMapping("/uploadfile")
	public String fileUpload(
		@SessionAttribute MemberDto currentMember,
		@RequestParam("file1") MultipartFile file,
		@RequestParam String challengeCode,
		@RequestParam int challengePoint)
		throws IllegalStateException, IOException {

		if (!file.isEmpty()) {
			String fullPath = authUploadPath + "/" + file.getOriginalFilename();
			file.transferTo(new File(fullPath));

			ChallengeDto currentChallenge = challengeMapper.selectByChallengeCode(challengeCode);
			String fileOCR = "";
			if (currentChallenge.getChallengeName().equals("[광명시보건소x하나빗] 1만보 걷기 챌린지")) {
				fileOCR = challengeService.walkChallengeOCR(file.getOriginalFilename());

			} else {
				fileOCR = challengeService.fileOCR(file.getOriginalFilename());

			}

			if (fileOCR == "성공") {
				ChallengeLogDto challengeLogDto = ChallengeLogDto.builder()
					.challengeCode(challengeCode)
					.challengePoint(challengePoint)
					.memberEmail(currentMember.getEmail())
					.build();

				challengeService.insertChallengeLog(challengeLogDto, currentMember);

				return "성공";
			}

		}

		return "실패";
	}
}

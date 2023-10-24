package kr.ac.kopo.hanabit.gifticon.controller;

import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.ac.kopo.hanabit.gifticon.entity.Gifticon;
import kr.ac.kopo.hanabit.gifticon.repository.GifticonOrderRepository;
import kr.ac.kopo.hanabit.gifticon.repository.GifticonRepository;
import kr.ac.kopo.hanabit.gifticon.service.GifticonService;
import kr.ac.kopo.hanabit.hanamoney.mapper.HanamoneyMapper;
import kr.ac.kopo.hanabit.member.dto.MemberDto;
import kr.ac.kopo.hanabit.member.service.MemberService;
import kr.ac.kopo.hanabit.util.sms.MessageService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@RequestMapping("/gifticon")
@Slf4j
public class GifticonController {

	private final GifticonService gifticonService;
	private final GifticonRepository gifticonRepository;
	private final GifticonOrderRepository gifticonOrderRepository;

	private final MemberService memberService;

	private final MessageService messageService;
	private final HanamoneyMapper hanamoneyMapper;

	@PostMapping("/gift")
	public void gift() {

	}

	@PostMapping("/sms")
	@ResponseBody
	public void giftMMS(@RequestBody String jsonData
		, @SessionAttribute MemberDto currentMember) {

		gifticonService.giftMMS(jsonData, currentMember);

	}

	@GetMapping("/{gifticonCode}")
	public String gifitconDetail(
		@PathVariable String gifticonCode,
		Model model) {
		Gifticon gifticon = gifticonRepository.getReferenceById(gifticonCode);
		model.addAttribute("gifticon", gifticon);

		return "gifticon/gifticonDetail";
	}

	@GetMapping
	public String giftshop(Model model,
		@RequestParam(value = "page", defaultValue = "0") int page) {
		Page<Gifticon> pageGifticons = gifticonService.getGifticons(page, 6);
		model.addAttribute("pageGifticons", pageGifticons);
		log.info("pageGifticons={}", pageGifticons);

		return "gifticon/gifticons";
	}
}

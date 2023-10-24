package kr.ac.kopo.hanabit.gifticon.service;

import java.time.LocalDateTime;

import org.json.JSONObject;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.kopo.hanabit.gifticon.entity.Gifticon;
import kr.ac.kopo.hanabit.gifticon.entity.GifticonOrder;
import kr.ac.kopo.hanabit.gifticon.repository.GifticonOrderRepository;
import kr.ac.kopo.hanabit.gifticon.repository.GifticonRepository;
import kr.ac.kopo.hanabit.hanamoney.dto.HanamoneyDto;
import kr.ac.kopo.hanabit.hanamoney.dto.HanamoneyTransactionLogDto;
import kr.ac.kopo.hanabit.hanamoney.mapper.HanamoneyMapper;
import kr.ac.kopo.hanabit.member.dto.MemberDto;
import kr.ac.kopo.hanabit.member.service.MemberService;
import kr.ac.kopo.hanabit.util.sms.MessageService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class GifticonService {

	private final GifticonRepository gifticonRepository;
	private final GifticonOrderRepository gifticonOrderRepository;

	private final MemberService memberService;

	private final MessageService messageService;
	private final HanamoneyMapper hanamoneyMapper;

	@Transactional
	public void giftMMS(String jsonData, MemberDto currentMember) {

		JSONObject jObject = new JSONObject(jsonData);
		String tel = jObject.getString("tel");
		String gifticonCode = jObject.getString("gifticonCode");
		String amountCount = jObject.getString("amountCount");
		Integer amountCountInt = Integer.parseInt(amountCount);
		log.info("jObject={}", jObject);

		// 1. 기프티콘 문자 보내기
		messageService.sendMMS(tel, currentMember.getName());

		// 2. 하나머니 금액만큼 차감
		Gifticon gifticon = gifticonRepository.getReferenceById(gifticonCode);
		int price = (int)(gifticon.getGifticonAmount() * amountCountInt);

		HanamoneyDto myHanamoney = hanamoneyMapper.selectByEmail(currentMember.getEmail());
		hanamoneyMapper.updateBalance(myHanamoney.getBalance() - price, currentMember.getEmail());

		// 2-1. 하나머니 기록에 남음
		HanamoneyTransactionLogDto hanamoneyTransactionLogDto
			= HanamoneyTransactionLogDto.builder()
			.transDate(LocalDateTime.now())
			.memberEmail(currentMember.getEmail())
			.transAmount(price)
			.transBalance(myHanamoney.getBalance() - price)
			.transType("출금")
			.transCategory("선물하기")
			.transName("선물하기")
			.build();
		hanamoneyMapper.insertTransactionLog(hanamoneyTransactionLogDto);

		// 3. 기프티콘 거래내역에 insert
		GifticonOrder gifticonOrder = GifticonOrder.builder()
			.gifticonOrderTargetPhoneNumber(tel)
			.gifticonOrderNumber(amountCountInt)
			.gifticonOrderAmount(price)
			.gifticon(gifticon)
			.member(memberService.convertToEntity(currentMember))
			.build();
		gifticonOrderRepository.save(gifticonOrder);
	}

	public Page<Gifticon> getGifticons(int page, int size) {
		PageRequest pageable = PageRequest.of(page, size);
		return gifticonRepository.findAllByOrderByGifticonCreatedAtDesc(pageable);
	}
}

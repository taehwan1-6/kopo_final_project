package kr.ac.kopo.hanabit.product.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.ac.kopo.hanabit.account.dto.AccountDto;
import kr.ac.kopo.hanabit.account.service.AccountService;
import kr.ac.kopo.hanabit.member.dto.MemberDto;
import kr.ac.kopo.hanabit.member.service.MemberService;
import kr.ac.kopo.hanabit.product.entity.ProductEntity;
import kr.ac.kopo.hanabit.product.entity.ProductMemberEntity;
import kr.ac.kopo.hanabit.product.repository.ProductMemberRepository;
import kr.ac.kopo.hanabit.product.repository.ProductRepository;
import kr.ac.kopo.hanabit.product.service.ProductService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor()
@RequestMapping("/product")
@Slf4j
public class ProductController {

	private final ProductRepository productRepository;
	private final ProductMemberRepository productMemberRepository;

	private final AccountService accountService;
	private final MemberService memberService;
	private final ProductService productService;

	@PostMapping("/registry")
	public String registryProduct(
		@SessionAttribute MemberDto currentMember,
		@RequestParam String productCode,
		@ModelAttribute ProductMemberEntity registry) {

		productService.registryProduct(currentMember, productCode, registry);

		return "redirect:/";
	}

	@GetMapping("/registry")
	public String productRegistry(@SessionAttribute MemberDto currentMember,
		Model model) {

		if (currentMember != null) {
			List<AccountDto> currentAccounts = accountService.getAllByType(currentMember.getPersonalNum(), "입출금");
			model.addAttribute("currentAccounts", currentAccounts);

			Optional<ProductEntity> optionalProduct = productRepository.findById("p1");
			if (optionalProduct.isPresent()) {
				ProductEntity product = optionalProduct.get();
				model.addAttribute("product", product);
			} else {
				// 여기에 필요한 오류 처리를 추가할 수 있습니다. 예: 로그 작성, 오류 메시지 설정 등
			}
		}

		return "product/productRegistry";
	}

	@GetMapping("/tos")
	public String productTos() {

		return "product/productTos";
	}

	@GetMapping()
	public String productTd(Model model) {
		Optional<ProductEntity> productEntity = productRepository.findById("p1");
		if (productEntity.isPresent()) {
			ProductEntity product = productEntity.get();
			model.addAttribute("product", product);
		}

		return "product/product";
	}
}

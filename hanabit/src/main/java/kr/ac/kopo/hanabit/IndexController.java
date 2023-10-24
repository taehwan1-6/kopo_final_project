package kr.ac.kopo.hanabit;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.ac.kopo.hanabit.challenge.mapper.ChallengeMapper;
import kr.ac.kopo.hanabit.commcode.dto.CategoryCodeDto;
import kr.ac.kopo.hanabit.commcode.mapper.CommCodeMapper;
import kr.ac.kopo.hanabit.product.entity.ProductEntity;
import kr.ac.kopo.hanabit.product.repository.ProductRepository;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class IndexController {

	private final CommCodeMapper commCodeMapper;
	private final ChallengeMapper challengeMapper;
	private final ProductRepository productRepository;

	@GetMapping("/")
	public String index(Model model) {
		List<CategoryCodeDto> categoryCodeDtos = commCodeMapper.selectAllById("100");
		model.addAttribute("categories", categoryCodeDtos);

		List<ProductEntity> products = productRepository.findAll();
		model.addAttribute("products", products);

		return "index";
	}

	@GetMapping("/admin/challenge/create")
	public String createChallenge(Model model) {

		return "admin/product/savingsCreateForm";
	}
}

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

import kr.ac.kopo.hanabit.commcode.dto.CategoryCodeDto;
import kr.ac.kopo.hanabit.commcode.mapper.CommCodeMapper;
import kr.ac.kopo.hanabit.product.entity.ProductEntity;
import kr.ac.kopo.hanabit.product.service.ProductService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/products")
@Slf4j
public class AdminProductController {

	private final CommCodeMapper commCodeMapper;
	private final ProductService productService;

	@PostMapping
	public String createProduct(
		@ModelAttribute ProductEntity productEntity,
		MultipartHttpServletRequest request) {

		ProductEntity result = productService.createProduct(productEntity, request);

		if (result != null) {
			log.info("금융상품 개설이 성공하였습니다!");
		} else {
			log.info("금융상품 개설에 실패하였습니다..");
		}

		return "redirect:/admin";
	}

	@GetMapping("/create")
	public String createProduct(Model model) {
		List<CategoryCodeDto> categoryDtos = commCodeMapper.selectAllById("400");
		model.addAttribute("categoryDtos", categoryDtos);

		return "admin/container/product/adminProductCreateForm";
	}

	@GetMapping
	public String pagingProducts(Model model,
		@RequestParam(value = "page", defaultValue = "0") int page) {
		Page<ProductEntity> paging = productService.getProductList(page);
		model.addAttribute("paging", paging);

		List<CategoryCodeDto> categoryDtos = commCodeMapper.selectAllById("400"); // 상품 카테고리 (입출금, ~)
		model.addAttribute("categoryDtos", categoryDtos);

		return "admin/container/product/adminProducts";
	}

}

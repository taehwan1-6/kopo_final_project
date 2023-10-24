package kr.ac.kopo.hanabit.admin.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.kopo.hanabit.apikey.entity.ApiKey;
import kr.ac.kopo.hanabit.apikey.repository.ApiKeyRepository;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class AdminController {

	private final ApiKeyRepository apiKeyRepository;

	@PostMapping("/api-setting")
	public String adminApiSettingPost(
		@RequestParam String apiKey,
		@RequestParam String company) {
		ApiKey apiKeyBuilder = ApiKey.builder()
			.apiKey(apiKey)
			.company(company)
			.build();
		apiKeyRepository.save(apiKeyBuilder);

		return "redirect:/admin/api-setting";
	}

	@GetMapping("/api-setting")
	public String adminApiSetting(Model model) {
		List<ApiKey> apiKey = apiKeyRepository.findByCompany("하나은행");
		String hanabankApiKey = "";
		if (!apiKey.isEmpty()) {
			ApiKey hanabankApi = apiKey.get(0);
			model.addAttribute("hanabankApi", hanabankApi);
			hanabankApiKey = hanabankApi.getApiKey();
		}

		return "admin/container/adminApiSetting";
	}

	@GetMapping
	public String admin() {
		return "admin/admin";
	}

}

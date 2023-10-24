package kr.ac.kopo.hanabankapiserver.apikey.service;

import org.springframework.stereotype.Service;

import kr.ac.kopo.hanabankapiserver.apikey.mapper.ApiKeyMapper;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ApiKeyServiceImpl implements ApiKeyService {

	private final ApiKeyMapper apiKeyMapper;

	@Override
	public String getCompanyUserByApiKey(String apiKey) {
		String companyUser = apiKeyMapper.selectCompanyUserByApiKey(apiKey);

		return companyUser;
	}
}

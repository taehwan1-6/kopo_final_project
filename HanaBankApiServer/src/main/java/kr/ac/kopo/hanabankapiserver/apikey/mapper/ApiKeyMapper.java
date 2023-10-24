package kr.ac.kopo.hanabankapiserver.apikey.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ApiKeyMapper {

	String selectCompanyUserByApiKey(String apiKey);

	String select(String apiKey);
}

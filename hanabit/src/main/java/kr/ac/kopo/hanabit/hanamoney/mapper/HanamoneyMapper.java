package kr.ac.kopo.hanabit.hanamoney.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.ac.kopo.hanabit.hanamoney.dto.HanamoneyDto;
import kr.ac.kopo.hanabit.hanamoney.dto.HanamoneyTransactionLogDto;

@Mapper
public interface HanamoneyMapper {

	/**
	 * 하나머니
	 */
	// select
	HanamoneyDto selectByEmail(@Param("memberEmail") String memberEmail);

	// update
	int updateBalance(@Param("balance") int balance,
		@Param("memberEmail") String memberEmail);

	int updateLinkedAccountNum(@Param("linkedAccountNum") String linkedAccountNum,
		@Param("memberEmail") String memberEmail);

	// insert
	int insert(HanamoneyDto hanamoneyDto);

	int insertTransactionLog(HanamoneyTransactionLogDto hanamoneyTransactionLogDto);

	/**
	 * 하나머니 거래 기록
	 */
	// select
	List<HanamoneyTransactionLogDto> selectAllTransactionLog(String memberEmail);
}

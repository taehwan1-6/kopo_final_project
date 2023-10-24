package kr.ac.kopo.hanabit.commcode.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.ac.kopo.hanabit.commcode.dto.CategoryCodeDto;

@Mapper
public interface CommCodeMapper {

	// select
	@Select("select *" +
		" from hb_common_codes" +
		" where common_code_type_id = #{commCodeTypeId}")
	List<CategoryCodeDto> selectAllById(@Param("commCodeTypeId") String commCodeTypeId);
}

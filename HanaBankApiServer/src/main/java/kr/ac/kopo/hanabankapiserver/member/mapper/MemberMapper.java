package kr.ac.kopo.hanabankapiserver.member.mapper;

import kr.ac.kopo.hanabankapiserver.member.dto.MemberDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface MemberMapper {

    MemberDto selectByPersonalNum(@Param("personalNum") String personalNum);
    int joinAtHanabit(MemberDto memberDto);


//    @Select("select *" +
//            " from bank_members" +
//            " where PERSONAL_NUM = #{personalNum}")
//    MemberDto selectByPersonalNum(@Param("personalNum") String personalNum);
//
//    @Insert("INSERT INTO bank_members \n" +
//            "        (\n" +
//            "            EMAIL,\n" +
//            "            PASSWORD,\n" +
//            "            NAME,\n" +
//            "            PERSONAL_NUM,\n" +
//            "            CREATED_AT\n" +  // 콤마를 제거했습니다.
//            "        ) \n" +
//            "        VALUES \n" +
//            "        (#{email},\n" +
//            "            #{password},\n" +
//            "            #{name},\n" +
//            "            #{personalNum},\n" +
//            "            #{createdAt})")
//    MemberDto joinAtHanabit(MemberDto memberDto);
}

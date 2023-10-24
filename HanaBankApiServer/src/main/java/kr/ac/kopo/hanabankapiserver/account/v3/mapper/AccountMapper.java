package kr.ac.kopo.hanabankapiserver.account.v3.mapper;

import kr.ac.kopo.hanabankapiserver.account.v3.dto.AccountDto;
import kr.ac.kopo.hanabankapiserver.account.v3.dto.AccountTransactionLogDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface AccountMapper {

    // selectAll
    List<AccountDto> selectAllByPersonalNum(String personalNum);
    List<AccountDto> selectAllByPersonalNumAndType(@Param("personalNum") String personalNum,
                                                   @Param("type") String type);

    // select
    AccountDto selectByAccountNum(String accountNum);

    // update
    int updateBalance(@Param("balance") int balance,
                      @Param("accountNum") String accountNum);

    // insert
    int insert(AccountDto accountDto);
    int insertTransactionLog(AccountTransactionLogDto accountTransactionLogDto);

}

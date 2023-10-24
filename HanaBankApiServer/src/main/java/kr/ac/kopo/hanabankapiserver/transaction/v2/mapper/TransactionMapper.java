package kr.ac.kopo.hanabankapiserver.transaction.v2.mapper;

import kr.ac.kopo.hanabankapiserver.transaction.v2.dto.TransactionRequestDto;
import kr.ac.kopo.hanabankapiserver.transaction.v2.dto.TransactionResponseDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface TransactionMapper {

    List<TransactionResponseDto> selectAllTransaction(@Param("personalNum") String personalNum,
                                                             @Param("accountNum") String accountNum,
                                                             @Param("accountType") String accountType);

//    int insert(TransactionRequestDto transactionRequestDto);

    int insertAccountNum(TransactionRequestDto transactionRequestDto);
    int insertTargetAccountNum(TransactionRequestDto transactionRequestDto);


    // 계좌이체 시
//    void increaseBalanceForAccountNum(TransactionRequestDto transactionRequestDto);
//    void decreaseBalanceForTargetAccountNum(TransactionRequestDto transactionRequestDto);

//    // 계좌이체 시, 출금했을 때
    void decreaseBalanceForAccountNum(TransactionRequestDto transactionRequestDto);
    void increaseBalanceForTargetAccountNum(TransactionRequestDto transactionRequestDto);
}

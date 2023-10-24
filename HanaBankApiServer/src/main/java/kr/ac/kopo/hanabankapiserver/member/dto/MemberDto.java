package kr.ac.kopo.hanabankapiserver.member.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MemberDto {

    private String email; // pk
    private String password; // nn
    private String name; // nn
    private String phone;
    private String personalNum; // unique
    private String address;
    private LocalDateTime createdAt; // nn
    private String profileImageName;
    private String profileImagePath;
}

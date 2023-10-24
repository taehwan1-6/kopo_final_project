package kr.ac.kopo.hanabit.admin.service;

import kr.ac.kopo.hanabit.challenge.dto.ChallengeDto;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface AdminChallengeService {

    int createChallenge(ChallengeDto challengeDto,
                        MultipartHttpServletRequest request);
}

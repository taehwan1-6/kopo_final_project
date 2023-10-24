package kr.ac.kopo.hanabit.admin.service;

import kr.ac.kopo.hanabit.challenge.dto.ChallengeDto;
import kr.ac.kopo.hanabit.challenge.mapper.ChallengeMapper;
import kr.ac.kopo.hanabit.util.ocr.MyFileNameGenerator;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.File;

@Service
@RequiredArgsConstructor
@Slf4j
public class AdminChallengeServiceImpl implements AdminChallengeService {

    @Value("${upload.path.challenge}")
    private String challengeImgUploadPath;

    private final ChallengeMapper challengeMapper;

    @Override
    @Transactional
    public int createChallenge(ChallengeDto challengeDto,
                               MultipartHttpServletRequest request) {
        MultipartFile file1 = request.getFile("signImg1");
        MultipartFile file3 = request.getFile("signImg3");

        String uploadPath = challengeImgUploadPath;
        challengeDto.setChallengeImgPath("common/assets/images/upload/challenge");

        if (!file1.isEmpty()) {
            File newFileName1 = MyFileNameGenerator.rename(new File(uploadPath, file1.getOriginalFilename()));
            log.info("newFileName1.getName() = {}", newFileName1.getName());

            challengeDto.setChallengeTitleImg(newFileName1.getName());
            log.info("challengeDto = {}", challengeDto);

            try {
                file1.transferTo(newFileName1);

            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        if (!file3.isEmpty()) {
            File newFileName3 = MyFileNameGenerator.rename(new File(uploadPath, file3.getOriginalFilename()));
            challengeDto.setChallengeAuthImg(newFileName3.getName());

            try {
                file3.transferTo(newFileName3);

            } catch (Exception e) {
                e.printStackTrace();
            }
        }


        // 챌린지 개설 insert
        int result = challengeMapper.insertChallenge(challengeDto);

        return result;
    }
}

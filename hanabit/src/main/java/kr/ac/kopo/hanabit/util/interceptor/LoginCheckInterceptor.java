package kr.ac.kopo.hanabit.util.interceptor;

import kr.ac.kopo.hanabit.member.dto.MemberDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Slf4j
@Component
public class LoginCheckInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {

        HttpSession session = request.getSession();
        MemberDto memberDto = (MemberDto) session.getAttribute("currentMember");

        String requestURI = request.getRequestURI();
        //        System.out.println("LoginCheckInterceptor [interceptor] : " + requestURI);

        if (memberDto == null) {
            // 로그인 되지 않음
            //            System.out.println("[미인증 사용자 요청]");

            //로그인으로 redirect
            response.sendRedirect("/member/join?redirectURL=" + requestURI);
            return false;
        }
        // 로그인 되어있을 떄
        return true;
    }
}

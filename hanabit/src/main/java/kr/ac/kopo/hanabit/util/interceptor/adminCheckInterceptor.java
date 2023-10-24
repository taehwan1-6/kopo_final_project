package kr.ac.kopo.hanabit.util.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import kr.ac.kopo.hanabit.member.dto.MemberDto;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class adminCheckInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws
		Exception {

		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto)session.getAttribute("currentMember");

		String requestURI = request.getRequestURI();
		System.out.println("adminCheckInterceptor [interceptor] : " + requestURI);

		if (memberDto == null || !"관리자".equals(memberDto.getRole())) {
			System.out.println("[권한 없는 사용자 요청]");
			response.sendRedirect("/error-404"); // 권한이 없다는 페이지로 리디렉션
			return false;
		}
		return true;
	}

}

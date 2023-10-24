package kr.ac.kopo.hanabit.util.interceptor;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfiguration implements WebMvcConfigurer {

	@Override
	public void addInterceptors(InterceptorRegistry registry) {

		// 일반 로그인 확인 인터셉터
		registry.addInterceptor(new LoginCheckInterceptor())
			.order(1)
			.addPathPatterns("/**")
			.excludePathPatterns("/admin/**", "/", "/gifticon", "/challenges",
				"/product", "/member/**", "/common/**", "/geeks/**", "/jobvia/**");

		// 관리자 권한 확인 인터셉터
		registry.addInterceptor(new adminCheckInterceptor())
			.order(2)
			.addPathPatterns("/admin/**");
	}
}


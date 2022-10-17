package com.seu.app;

import java.util.Arrays;
import java.util.List;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.seu.app.interceptor.LoginInterceptor;
import com.seu.app.interceptor.ManagerInterceptor;

@Configuration
public class ServerConfigure implements WebMvcConfigurer {
	// 인터셉터가 처리될 매핑주소를 List 컬랙션으로 작성한다. 
	private static final List<String> URL_PATTERNS = Arrays.asList(
			"/member/memberEdit","/member/memberEditOk"
			
			
			);

	
	private static final List<String> URL_PATTERNS_MANAGER = Arrays.asList(
			"/report/reportWrite",
			"/report/reportWriteOk",
			"/report/reportEdit/*",
			"/report/reportEditOk",
			"/report/reportDelete/*",
			"/manager/*"
			);
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new LoginInterceptor()).addPathPatterns(URL_PATTERNS);
		registry.addInterceptor(new ManagerInterceptor()).addPathPatterns(URL_PATTERNS_MANAGER);

	}
}

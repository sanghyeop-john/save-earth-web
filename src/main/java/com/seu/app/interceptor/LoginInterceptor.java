package com.seu.app.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceptor implements HandlerInterceptor {
		@Override
		public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
			//로그인 여부 확인하기
			HttpSession session = request.getSession();
			
			//session에서 로그인 정보를 구해온다.
			String logStatus = (String)session.getAttribute("logStatus"); //null, Y
			
			if(logStatus!=null && logStatus.equals("Y")) {
				//로그인 상태일때
				return true;
			}else {
				//로그인 안된경우
				response.sendRedirect("/member/login");
				return false;
			}
		}
}

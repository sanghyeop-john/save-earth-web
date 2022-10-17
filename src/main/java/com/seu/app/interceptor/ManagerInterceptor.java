package com.seu.app.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class ManagerInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		//로그인 여부 확인하기
		HttpSession session = request.getSession();
		
		//session에서 로그인 정보를 구해온다.
		String ManagerStatus = (String)session.getAttribute("ManagerStatus"); //null, Y
		
		if(ManagerStatus!=null && ManagerStatus.equals("Y")) {
			//로그인 상태일때
			return true;
		}else {
			//로그인 안된경우
			response.sendRedirect("/");
			return false;
		}
	}
}

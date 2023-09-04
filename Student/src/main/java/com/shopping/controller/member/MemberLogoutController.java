package com.shopping.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;

public class MemberLogoutController extends SuperClass{

	@Override //회원이 로그 아웃을 시도합니다.
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		super.session.invalidate();//모든 정보 삭제
		
		super.gotopage("member/meLoginForm.jsp");
	}	
}

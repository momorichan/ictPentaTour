package com.shopping.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//하위 컨트롤러들이 공통적으로 사용하는 기능들을 여기에 명시합니다.
public class SuperClass implements SuperController{
	private HttpServletRequest request;
	private HttpServletResponse response;
	protected HttpSession session;

	
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		this.request = request;
		this.response = response;
		this.session = request.getSession();
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		this.request = request;
		this.response = response;
		this.session = request.getSession();
	}

	public void gotopage(String gotopage) {
		if(this.request ==null) {
			System.out.println("doGet/doPost() 메소드 호출 누락");
			return;
		}
		
		//요청한 페이지로 포워딩합니다.
		RequestDispatcher dispatcher = null;
		
		try {
			dispatcher = request.getRequestDispatcher(gotopage);
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void setAlertMessage(String message) {
		//session 영역에서 "alertMessage"라는 이름으로 사용자에게 주의/오류/경고 문구 등을 띄워줍니다.
		//in common.jsp 파일 하단 참조
		session.setAttribute("alertMessage",message);
	}

}

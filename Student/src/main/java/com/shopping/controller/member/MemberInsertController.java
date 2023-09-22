package com.shopping.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Member;
import com.shopping.model.dao.MemberDao;

//회원 가입을 위한 컨트롤러
public class MemberInsertController extends SuperClass{
	private final String PREFIX = "member/" ;

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		super.gotopage(PREFIX + "meInsertForm.jsp");

	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		
		Member bean = new Member();
		
		bean.setMeid(request.getParameter("meid"));
		bean.setPassword(request.getParameter("password"));
		bean.setName(request.getParameter("name"));
		bean.setGender(request.getParameter("gender"));
		bean.setBirth(request.getParameter("birth"));
		bean.setPhone(request.getParameter("phone"));
		bean.setAddress(request.getParameter("address"));
		bean.setRole(request.getParameter("role"));
		
		bean.setStatus(Integer.parseInt(request.getParameter("salary")));
		
		MemberDao dao = new MemberDao();
		
		int cnt = -1;
		
		try {
			cnt = dao.InsertData(bean);
			if(cnt == -1) {//가입 실패
				new MemberInsertController().doGet(request, response);
			}else { //가입 성공
				new MemberLoginController().doPost(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			new MemberInsertController().doGet(request, response);
		}

		
	}
	
}
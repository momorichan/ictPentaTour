package com.shopping.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Member;
import com.shopping.model.dao.MemberDao;

public class MemberUpdateController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		String meid = request.getParameter("meid");
		MemberDao dao = new MemberDao();
		Member bean = dao.getDataByPrimaryKey(meid);
		if(bean.getGender().equals("남자")) {
			request.setAttribute("malecheck", "checked=\"checked\"");
			request.setAttribute("femalecheck", "");
		} else {
			request.setAttribute("femalecheck", "checked=\"checked\"");
			request.setAttribute("malecheck", "");
		}
		request.setAttribute("bean", bean);
		if(bean.getRole().equals("1")) {
			request.setAttribute("role", "일반");
		} else if(bean.getRole().equals("2")){
			request.setAttribute("role", "관리자");
		}
		super.gotopage("member/meUpdateForm.jsp");
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		
		Member bean = new Member();
		MemberDao dao = new MemberDao();
		int cnt = -1;
		
		bean.setMeid(request.getParameter("meid"));
		bean.setPassword(request.getParameter("password"));
		bean.setName(request.getParameter("name"));
		bean.setGender(request.getParameter("gender"));
		bean.setBirth(request.getParameter("birth"));
		bean.setPhone(request.getParameter("phone"));
		bean.setAddress(request.getParameter("address"));
		bean.setRole(request.getParameter("role"));
		
		try {
			cnt = dao.UpdateMemberData(bean);
			new MemberDetailController().doGet(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

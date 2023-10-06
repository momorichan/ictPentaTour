package com.shopping.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Member;
import com.shopping.model.dao.MemberDao;

public class MemberDetailController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		String meid = request.getParameter("meid");
		
		MemberDao dao = new MemberDao();
		
		Member bean = null;
		
		try {
			bean = dao.getDataByPrimaryKey(meid);
			
			if(bean == null) {
				super.setAlertMessage("잘못된 회원 정보입니다.");
				super.gotopage("common/home.jsp");
			}else {
				if(bean.getRole().equals("1")) {
					request.setAttribute("role", "일반");
				} else {
					request.setAttribute("role", "관리자");
				}
				request.setAttribute("bean", bean);
				super.gotopage("member/meDetail.jsp");
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
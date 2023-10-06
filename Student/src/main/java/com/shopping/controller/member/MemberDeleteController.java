package com.shopping.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.HomeController;
import com.shopping.controller.SuperClass;
import com.shopping.model.dao.MemberDao;

public class MemberDeleteController  extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		String meid = request.getParameter("meid");
		MemberDao dao = new MemberDao();
		int cnt = -1;
		
		try {
			cnt = dao.deleteData(meid);
			super.session.invalidate();
			new HomeController().doGet(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
}

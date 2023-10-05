package com.shopping.controller.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Review;
import com.shopping.model.dao.ReviewDao;

public class ReviewDeleteController extends SuperClass{
	private final String PREFIX = "common/" ;

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		Integer trid = Integer.parseInt(request.getParameter("trid"));
		
		ReviewDao dao = new ReviewDao();
		
		int cnt = -1;
		
		cnt = dao.DeleteData(trid);
		
		super.gotopage(PREFIX+"back1.jsp");
	}
}

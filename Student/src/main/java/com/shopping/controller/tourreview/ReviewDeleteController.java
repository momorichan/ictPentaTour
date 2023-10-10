package com.shopping.controller.tourreview;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Review;
import com.shopping.model.dao.TourReviewDao;

public class ReviewDeleteController extends SuperClass{
	private final String PREFIX = "common/" ;

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		Integer trid = Integer.parseInt(request.getParameter("trid"));
		
		TourReviewDao dao = new TourReviewDao();
		
		int cnt = -1;
		
		cnt = dao.DeleteData(trid);
		
		super.gotopage(PREFIX+"back1.jsp");
	}
}

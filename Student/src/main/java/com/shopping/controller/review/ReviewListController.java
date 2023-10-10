package com.shopping.controller.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.dao.ReviewDao;

public class ReviewListController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		ReviewDao dao = new ReviewDao();
		try {
			
			Object rating = null;
			request.setAttribute("rating", rating);
			
			int commentAdd = (int) dao.commentAdd();
			double averageRating = dao.calculateAverageRating();
			averageRating = Math.round(averageRating * 100.0) / 100.0;

			// 가져온 평균 평점을 JSP 페이지로 전달
			super.session.setAttribute("commentAdd", commentAdd);
	         super.session.setAttribute("averageRating", averageRating);
			//페이징 정보를 바인딩	
			super.gotopage("accommodation/acDetail.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}

package com.shopping.controller.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Review;
import com.shopping.model.dao.ReviewDao;

public class ReviewInsertController extends SuperClass{
	private final String PREFIX = "review/" ;

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		int acid = Integer.parseInt(request.getParameter("acid"));
		request.setAttribute("acid", acid);
		super.gotopage(PREFIX+"rvInsert.jsp");
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		
		Review bean = new Review();
		MultipartRequest mr = (MultipartRequest)request.getAttribute("mr");
		bean.setMeid(mr.getParameter("meid"));
		bean.setRegdate(mr.getParameter("regdate"));
		int rating = 5;
		if(mr.getParameter("rating") != null)
			rating = Integer.parseInt(mr.getParameter("rating"));
		bean.setRating(rating);
		bean.setContent(mr.getParameter("content"));
		bean.setAcid(Integer.parseInt(mr.getParameter("acid")));
		ReviewDao dao = new ReviewDao();
		
		int cnt = -1;
		
		try {
			cnt = dao.InsertData(bean);
			if(cnt == -1) { //등록 실패
				new ReviewInsertController().doGet(request, response);
			}else { // 성공
				//게시물 목록 보기 페이지로 이동
				response.sendRedirect("common/back2.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
			new ReviewInsertController().doGet(request, response);
		}

		
	}
	
}

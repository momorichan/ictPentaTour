package com.shopping.controller.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Review;
import com.shopping.model.dao.ReviewDao;

public class ReviewInsertController extends SuperClass{
	private final String PREFIX = "review/" ;

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		int acid = Integer.parseInt(request.getParameter("acid"));
		String category = request.getParameter("category");
		String meid = request.getParameter("meid");
		super.session.setAttribute("acid", acid);
		super.session.setAttribute("category", category);
		super.session.setAttribute("meid", meid);
		super.gotopage(PREFIX+"rvInsert.jsp");
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		
		Review bean = new Review();
		bean.setMeid(request.getParameter("meid"));
		bean.setAcid(Integer.parseInt(request.getParameter("acid")));
		bean.setRegdate(request.getParameter("regdate"));
		bean.setRating(Integer.parseInt(request.getParameter("rating")));
		bean.setContent(request.getParameter("content"));
		System.out.println("content is " + request.getParameter("content"));
		ReviewDao dao = new ReviewDao();
		
		int cnt = -1;
		
		try {
			cnt = dao.InsertAcData(bean);
			if(cnt == -1) { //등록 실패
				new ReviewInsertController().doGet(request, response);
			}else { // 성공
				//게시물 목록 보기 페이지로 이동
				new ReviewListController().doGet(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			new ReviewInsertController().doGet(request, response);
		}

		
	}
	
}

package com.shopping.controller.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.dao.ReviewDao;

public class ReviewDeleteController extends SuperClass{

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		int trid = Integer.parseInt(request.getParameter("trid"));
		
		ReviewDao dao = new ReviewDao();

		int cnt = -1 ;
		
		try {
			cnt = dao.DeleteData(trid);
			 if (cnt > 0) {
	                response.getWriter().write("success"); // 삭제 성공 시 "success" 반환
	            } else {
	                response.getWriter().write("fail");    // 삭제 실패 시 "fail" 반환
	            }
			
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().write("fail"); // 예외 발생 시 "fail" 반환
		}
	}

	
}

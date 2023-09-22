package com.shopping.controller.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Review;
import com.shopping.model.dao.ReviewDao;

public class ReviewDetailController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		
		String trid = request.getParameter("trid");
		ReviewDao dao = new ReviewDao();
		Review bean = null;
		
		try {
			bean = dao.getDataByPrimaryKey(trid);

			if(bean == null) {
				super.setAlertMessage("잘못된 접근입니다.");
				super.gotopage("review/rvList.jsp");
			}else {
				request.setAttribute("bean", bean);
				super.gotopage("review/rvDetail.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}

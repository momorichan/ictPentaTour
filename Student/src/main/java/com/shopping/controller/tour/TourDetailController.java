package com.shopping.controller.tour;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Tour;
import com.shopping.model.dao.TourDao;

public class TourDetailController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		String toid = request.getParameter("toid");
		TourDao dao = new TourDao();
		Tour bean = null;
		try {
			bean = dao.getDataByPrimaryKey(toid);
			request.setAttribute("bean", bean);
			super.gotopage("tour/tourDetail.jsp");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}

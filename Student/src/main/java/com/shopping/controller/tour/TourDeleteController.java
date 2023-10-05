package com.shopping.controller.tour;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Tour;
import com.shopping.model.dao.TourDao;

public class TourDeleteController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		int toid = Integer.parseInt(request.getParameter("toid"));
		
		TourDao dao = new TourDao();
		
		dao.DeleteData(toid);
		super.setAlertMessage("삭제 되었습니다.");
		new TourHomeController().doGet(request, response);
	}
}

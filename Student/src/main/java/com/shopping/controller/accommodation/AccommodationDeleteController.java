package com.shopping.controller.accommodation;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.dao.AccommodationDao;

public class AccommodationDeleteController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		int acid = Integer.parseInt(request.getParameter("acid"));
		
		AccommodationDao dao = new AccommodationDao();
		int cnt = -1;
		
		
		try {
			cnt = dao.deleteData(acid);
			new AccommodationListController().doGet(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}

package com.shopping.controller.tour;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Tour;
import com.shopping.model.dao.TourDao;

public class TourDetailPopupController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		int toid = Integer.parseInt(request.getParameter("toid"));
		String meid = request.getParameter("meid");
		Tour bean = new Tour();
		TourDao dao = new TourDao();
		
		bean = dao.getDataByPrimaryKey(toid);
		
		request.setAttribute("bean", bean);
		request.setAttribute("meid", meid);
		
		super.gotopage("tour/tourDetailPopup.jsp");
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		
		MultipartRequest mr = (MultipartRequest)request.getAttribute("mr");
		
		int toid = Integer.parseInt(mr.getParameter("toid"));
		int tqty = Integer.parseInt(mr.getParameter("tqty"));
		String meid = mr.getParameter("meid");
		
		int cnt = -1;
		TourDao dao = new TourDao();
		
		try {
			cnt = dao.InsertReservation(toid, tqty, meid);
			
			super.gotopage("common/ClosePopup.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

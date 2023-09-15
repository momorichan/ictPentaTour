package com.shopping.controller.tour;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Tour;
import com.shopping.model.dao.TourDao;

public class TourInsertController extends SuperClass{
	@Override
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		gotopage("tour/tourInsert.jsp");
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		TourDao dao = new TourDao();
		Tour bean = new Tour();
		
		MultipartRequest mr = (MultipartRequest)request.getAttribute("mr");
		
		bean.setTprice(Integer.parseInt(mr.getParameter("tprice")));
		bean.setTexdate(Integer.parseInt(mr.getParameter("texdate")));
		bean.setTage(Integer.parseInt(mr.getParameter("tage")));
		bean.setTfreeage(Integer.parseInt(mr.getParameter("tfreeage")));
		bean.setTname(mr.getParameter("tname"));
		bean.setTcontent(mr.getParameter("tcontent"));
		bean.setTusedate(mr.getParameter("tusedate"));
		bean.setTimage01(mr.getFilesystemName("timage01"));
		bean.setTimage02(mr.getFilesystemName("timage02"));
		bean.setTimage03(mr.getFilesystemName("timage03"));
		bean.setLocation(mr.getParameter("location"));
		
		int cnt = -1;
		try {
			cnt = dao.InsertData(bean);
			new TourListController().doGet(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}

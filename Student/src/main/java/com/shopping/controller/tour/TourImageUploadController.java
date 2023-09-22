package com.shopping.controller.tour;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Tour;
import com.shopping.model.dao.TourDao;

public class TourImageUploadController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doGet(request, response);
		gotopage("tour/tourHome.jsp");
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		TourDao dao = new TourDao();
		Tour bean = new Tour();
		
		MultipartRequest mr = (MultipartRequest)request.getAttribute("mr");
		
		String fileName01 = mr.getFilesystemName("timage01");
		String fileName02 = mr.getFilesystemName("timage02");
		String fileName03 = mr.getFilesystemName("timage03");
		String fileName04 = mr.getFilesystemName("timage04");
		String fileName05 = mr.getFilesystemName("timage05");
		String fileName06 = mr.getFilesystemName("timage06");
		String fileName07 = mr.getFilesystemName("timage07");
		
		int cnt = -1;
		try {
			new TourHomeController().doGet(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}

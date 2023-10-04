package com.shopping.controller.amenities;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.controller.accommodation.AccommodationInsertController;
import com.shopping.model.bean.Amenities;
import com.shopping.model.dao.AmenitiesDao;

public class AmenitiesInsertController extends SuperClass{
	private final String PREFIX = "amenities/" ;
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		gotopage(PREFIX + "amInsert.jsp");
	}
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		
		Amenities bean = new Amenities();
		
		bean.setName(request.getParameter("name"));
		bean.setDescription(request.getParameter("description"));
		bean.setImage(request.getParameter("image"));
		
		AmenitiesDao dao = new AmenitiesDao();
		
		int cnt = -1;
		try {
			
			cnt = dao.insertData(bean);
			new AccommodationInsertController().doGet(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}

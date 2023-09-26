package com.shopping.controller.amenities;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Amenities;
import com.shopping.model.dao.AmenitiesDao;

public class AmenitiesSelectController extends SuperClass{
@Override
public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {	
	super.doGet(request, response);
	
	AmenitiesDao dao = new AmenitiesDao();
	List<Amenities> lists = null;
	try {
		lists = dao.selectAll();
		request.setAttribute("lists", lists);
		super.gotopage("amenities/amSelect.jsp");
	} catch (Exception e) {
		e.printStackTrace();
	}
}
}

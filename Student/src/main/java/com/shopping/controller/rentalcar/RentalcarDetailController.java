package com.shopping.controller.rentalcar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Rentalcar;
import com.shopping.model.dao.RentalcarDao;

public class RentalcarDetailController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {	
		super.doGet(request, response);
		
		String rcid = String.valueOf(request.getParameter("rcid")) ;
		RentalcarDao dao = new RentalcarDao() ;
		
		try {
			Rentalcar bean = dao.GetDataByPk(rcid) ;
			request.setAttribute("bean", bean); 
			
			super.gotoPage("rentalcar/rcDetail.jsp"); 
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
}

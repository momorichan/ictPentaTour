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
		String rcid = request.getParameter("rcid");
		RentalcarDao dao = new RentalcarDao();
		Rentalcar bean = null;
		try {
			bean = dao.GetDataByPk(rcid);			
			if(bean == null) {
				super.setAlertMessage("잘못된 게시물");
				super.gotoPage("common/home.jsp");
			}else {
				request.setAttribute("bean", bean);
				super.gotoPage("rentalcar/rcDetail.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}

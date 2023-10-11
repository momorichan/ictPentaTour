package com.shopping.controller.rentalcar;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.bean.RentalcarCheck;
import com.shopping.model.dao.RentalcarCheckDao;

public class RentalcarHomeController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doGet(request, response);		
		String meid = request.getParameter("meid");
		List<RentalcarCheck> ccbean = new ArrayList<RentalcarCheck>();
		RentalcarCheckDao carcheckdao = new RentalcarCheckDao();
		
		ccbean = carcheckdao.getDataByMeid(meid);
		
		session.setAttribute("ccbean", ccbean);
		response.sendRedirect("rentalcar/rcHome.jsp");
	}

}

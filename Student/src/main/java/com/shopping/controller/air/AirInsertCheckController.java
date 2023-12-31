package com.shopping.controller.air;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Airline;
import com.shopping.model.bean.Flight;
import com.shopping.model.dao.AirDao;
import com.shopping.model.dao.FlyDao;

public class AirInsertCheckController extends SuperClass{
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doGet(request, response);
		
		Flight bean = new Flight();		
		FlyDao dao = new FlyDao();
		Airline bean2 = null;
		AirDao dao2 = new AirDao();
		
		int regid = (int) session.getAttribute("regid");
		System.out.println("regid 진자 : " + regid);
	
		try
		{
			bean = dao.getDataByFly2(regid);
			bean2 = dao2.getDataByBean(bean.getFlid());
			
			
			request.setAttribute("fly", bean);
			request.setAttribute("beans", bean2);
			
			
			super.gotopage("air/airInsertCheck.jsp");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		
	}

}

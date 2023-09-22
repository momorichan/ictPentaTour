package com.shopping.controller.air;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Airline;
import com.shopping.model.bean.Flight;
import com.shopping.model.dao.AirDao;
import com.shopping.model.dao.FlyDao;


public class AirCheckController extends SuperClass{
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doGet(request, response);
		
		
		System.out.println("regid : " + Integer.parseInt(request.getParameter("regid")));
		
		int regid = Integer.parseInt(request.getParameter("regid"));
		
		
		
		Flight bean = null;
		FlyDao dao = new FlyDao();
		
		Airline air = null;
		AirDao dao2 = new AirDao();
		
		
		try
		{
			bean = dao.getDataByRegid(regid);
			
			if(bean == null)
			{
				super.setAlertMessage("잘못된 예약번호 입니다.");
				new AirHomeController().doGet(request, response);
			}
			else
			{
				air = dao2.getDataByFlid(bean.getFlid());
				request.setAttribute("bean", bean);
				request.setAttribute("air", air);
				super.gotopage("air/airCheck.jsp");
				
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}

package com.shopping.controller.air;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;

import com.shopping.model.bean.Flight;

import com.shopping.model.dao.FlyDao;

public class AirInsertController extends SuperClass{
	
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doGet(request, response);
		
		
		
		int flid = Integer.parseInt(request.getParameter("flid"));

		request.setAttribute("flids", flid);
				
		super.gotopage("air/airInsert.jsp");
	}
	
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doPost(request, response);
		
		System.out.println("regid :" + request.getParameter("regid"));
		System.out.println("flid :" + request.getParameter("flid"));
		System.out.println("seat :" + request.getParameter("seat"));
		System.out.println("stopover :" + request.getParameter("stopover"));
		System.out.println("passengers :" + request.getParameter("passengers"));
		System.out.println("price :" + request.getParameter("price"));

		
		Flight bean = new Flight();
		
		bean.setRegid(Integer.parseInt(request.getParameter("regid")));
		bean.setFlid(Integer.parseInt(request.getParameter("flid")));
		bean.setSeat( request.getParameter("seat"));
		bean.setStopover( request.getParameter("stopover"));
		bean.setPassengers( Integer.parseInt(request.getParameter("passengers")));
		bean.setPrice(Integer.parseInt(request.getParameter("price")));
		
		FlyDao dao = new FlyDao();
		int cnt = -1;
		try
		{
			cnt = dao.InsertData(bean);
			if(cnt == -1)
			{
				new AirInsertController().doGet(request, response);
			}
			else
			{
				request.setAttribute("fly", bean);
				
				super.gotopage("air/airInsertCheck.jsp");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	

}

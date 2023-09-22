package com.shopping.controller.air;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Airline;
import com.shopping.model.bean.Flight;
import com.shopping.model.dao.AirDao;
import com.shopping.model.dao.FlyDao;

public class AirInsertController extends SuperClass{
	
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doGet(request, response);
	
		int flid = Integer.parseInt(request.getParameter("flid"));
		
		AirDao dao = new AirDao();
		
		Airline air = new Airline();
		
		
		try
		{
			air = dao.getDataByBean(flid);
			
			request.setAttribute("flids", air);
			
			super.gotopage("air/airInsert.jsp");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doPost(request, response);
		
		Flight bean = new Flight();		
		FlyDao dao = new FlyDao();

		bean.setFlid(Integer.parseInt(request.getParameter("flid")));
		bean.setSeat( request.getParameter("seat"));
		bean.setStopover( request.getParameter("stopover"));
		bean.setPassengers( Integer.parseInt(request.getParameter("passengers")));
		bean.setPrice(Integer.parseInt(request.getParameter("price")));
		
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
				
				new AirInsertCheckController().doGet(request, response);
				
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	

}

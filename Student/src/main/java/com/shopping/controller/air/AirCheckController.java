package com.shopping.controller.air;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.shopping.controller.SuperClass;


public class AirCheckController extends SuperClass{
	
	
	
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doGet(request, response);
	
		
		
		
		
		try
		{
			
	
			super.gotopage("air/airCheck.jsp");	
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}

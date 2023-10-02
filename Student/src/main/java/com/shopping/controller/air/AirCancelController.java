package com.shopping.controller.air;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.dao.FlyDao;

public class AirCancelController extends SuperClass {
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doGet(request, response);
		
		int regid = Integer.parseInt(request.getParameter("regid"));
		
		
		System.out.println("regid : " + regid);
		
		FlyDao dao = new FlyDao();
		
		
		int cnt = -1;
	
		try
		{
			cnt = dao.deleteFly(regid);
			
			super.setAlertMessage("취소 되었습니다.");
			new AirHomeController().doGet(request, response);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}

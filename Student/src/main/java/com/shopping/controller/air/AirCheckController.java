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
		
		if(request.getParameter("regid") == null || request.getParameter("regid").equals(""))
		{
			super.setAlertMessage("번호를 입력해주세요");
			new AirHomeController().doGet(request, response);
			return;
		}
		if(Integer.parseInt(request.getParameter("regid")) < 10001)
		{
			super.setAlertMessage("정확히 입력해주세요");
			new AirHomeController().doGet(request, response);
			return;
		}
		
		
		if(Integer.parseInt(request.getParameter("regid")) > 10200)
		{
			super.setAlertMessage("정확히 입력해주세요");
			new AirHomeController().doGet(request, response);
			return;
		}
		
		
		int regid = Integer.parseInt(request.getParameter("regid"));
		
		String meid = request.getParameter("meid");
		
		
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
			}
			else
			{
				air = dao2.getDataByFlid(bean.getFlid());
				request.setAttribute("regid", meid);
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

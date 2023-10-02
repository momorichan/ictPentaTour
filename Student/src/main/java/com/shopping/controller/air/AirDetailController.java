package com.shopping.controller.air;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.dao.AirDao;
import com.shopping.model.bean.Airline;

public class AirDetailController extends SuperClass{
	
	
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doGet(request, response);
		
		Integer flid = Integer.parseInt(request.getParameter("flid"));
		
		
		AirDao dao = new AirDao();
		Airline bean = null;
		
		
		try
		{
			bean = dao.getDataByFlid(flid);
			
			if(bean == null)
			{
				super.setAlertMessage("잘못된 정보입니다.");
				super.gotoPage("air/airList.jsp");
			}
			else
			{
				request.setAttribute("bean", bean);
				super.gotoPage("air/airDetail.jsp");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		
	}

}

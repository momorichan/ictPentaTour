package com.shopping.controller.check;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.HomeController;
import com.shopping.controller.SuperClass;
import com.shopping.model.check.BookingItem;
import com.shopping.model.dao.ReserveDao;

public class allCheckController extends SuperClass {

	
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doGet(request, response);
		
		if(super.loginfo==null) {
			super.youNeededLogin();
			return ;
		}
		
		String meid = super.loginfo.getMeid();

		ReserveDao dao = new ReserveDao();
		
		List<BookingItem> lists = new ArrayList<BookingItem>();
		
		BookingItem bean = null;
		try
		{
			bean = dao.GetDataById(meid);
			
			if(bean == null)
			{
				super.setAlertMessage("예약정보가 없습니다.");
				new HomeController().doGet(request, response);
			}
			else
			{
				request.setAttribute("bean", bean);
				super.gotopage("check/allCheck.jsp");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}	
	}
}


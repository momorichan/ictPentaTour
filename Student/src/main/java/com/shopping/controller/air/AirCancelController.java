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
		
		if(super.loginfo==null) 
		{
			super.youNeededLogin();
			return ;
		}
		
		int regid = Integer.parseInt(request.getParameter("regid"));
		
		String meid = request.getParameter("meid");
		
		 if (meid != null && meid.equals(session.getAttribute("regmeid"))) {
		        // meid가 세션에 저장된 값과 일치하면 예약 취소를 수행합니다.
		    } else {
		        // meid가 세션에 저장된 값과 일치하지 않으면 예약 취소를 거부합니다.
		        super.setAlertMessage("예약 취소 권한이 없습니다.");
		        new AirHomeController().doGet(request, response);
		        
		        return;
		    }
		
		
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

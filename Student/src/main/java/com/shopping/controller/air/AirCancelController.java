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
		String resid = request.getParameter("meid");
		
		String meid = super.loginfo.getMeid();
		System.out.println("머함 : " + meid);
		System.out.println("머함2 : " + resid);
		
		 if (meid != null && meid.equals(resid)) {
		        // meid가 세션에 저장된 값과 일치하면 예약 취소를 수행합니다.
		    } else {
		        // meid가 세션에 저장된 값과 일치하지 않으면 예약 취소를 거부합니다.ㅗ
		        super.setAlertMessage("예약 취소 권한이 없습니다.");
		        new AirHomeController().doGet(request, response);
		        
		        return;
		    }
		
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

package com.shopping.controller.rentalcar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.dao.RentalcarDao;

public class RentalcarDeleteController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doGet(request, response);
		
		String rcid = String.valueOf(request.getParameter("rcid"));
		
		System.out.println("여기는 렌터카 삭제 컨트롤러" + rcid);
		RentalcarDao dao = new RentalcarDao();
		int cnt  = -1;
		
		try {
			cnt = dao.DeleteData(rcid);			
			setAlertMessage("삭제되었습니다.");
			new RentalcarListController().doGet(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	
	
}

package com.shopping.controller.rentalcar;

import java.awt.geom.Area;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Board;
import com.shopping.model.bean.Member;
import com.shopping.model.bean.Rentalcar;
import com.shopping.model.dao.RentalcarDao;

public class RentalcarDetailController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {	
		super.doGet(request, response);
		String rcid = String.valueOf(request.getParameter("rcid")) ;
		RentalcarDao dao = new RentalcarDao() ;
		
		try {
			Rentalcar bean = dao.GetDataByPk(rcid) ;
			request.setAttribute("bean", bean); 
			
			super.gotoPage("rentalcar/rcDetail.jsp"); 
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
//		System.out.println(request.getParameter("rcid"));
//		System.out.println(request.getParameter("id"));
//		System.out.println("잘왓네");
		Rentalcar bean = new Rentalcar();
		bean.setRcid(request.getParameter("rcid"));
		Member mbean = new Member();
		mbean.setId(request.getParameter("id"));; // 추후 meid로 변경
		
		RentalcarDao dao = new RentalcarDao();
		int cnt = -1;
		try {
			cnt = dao.InsertDataToCheck(bean, mbean);
			if(cnt == -1) { // 등록 실패
				new RentalcarDetailController().doGet(request, response);
			}else { // 성공
				response.sendRedirect("rentalcar/rcDetail.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();		
			
		}
		
		
	}
}

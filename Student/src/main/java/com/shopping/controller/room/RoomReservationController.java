package com.shopping.controller.room;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.controller.accommodation.AccommodationListController;
import com.shopping.model.bean.Member;
import com.shopping.model.bean.Room;
import com.shopping.model.bean.accommodation;
import com.shopping.model.dao.AccommodationDao;
import com.shopping.model.dao.MemberDao;
import com.shopping.model.dao.RoomDao;

public class RoomReservationController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		int roid = Integer.parseInt(request.getParameter("roid"));
		int acid = Integer.parseInt(request.getParameter("acid"));
		

		Enumeration<String> paramNames = request.getParameterNames();
        List<String> roomList = new ArrayList<String>();

		while (paramNames.hasMoreElements()) {
		    String paramName = paramNames.nextElement();
		    
		    if (paramName.startsWith("room")) {
		        String roomValue = request.getParameter(paramName);
		        roomList.add(roomValue); // 리스트에 추가
		    }
		}

		
		
		Member member = (Member)session.getAttribute("loginfo");
		String meid = member.getMeid();
		
		System.out.println(startDate);
		System.out.println(endDate);
		
		AccommodationDao acdao = new AccommodationDao();
		RoomDao rodao = new RoomDao();
		MemberDao medao = new MemberDao();
		
		accommodation acbean = acdao.getDataByPk(acid);
		Room robean = rodao.getDataByPk(roid);
		Member mebean = medao.getDataByPrimaryKey(meid);
		
		session.setAttribute("acbean", acbean);
		session.setAttribute("robean", robean);
		session.setAttribute("mebean", mebean);
		session.setAttribute("startDate", startDate);
		session.setAttribute("endDate", endDate);
		session.setAttribute("roomList", roomList);
		
		
		response.sendRedirect("room/roReservation.jsp");
		//gotopage("room/roReservation.jsp");
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		
		
		
		
		
		
		try {
			new AccommodationListController().doGet(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}

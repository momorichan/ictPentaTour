package com.shopping.controller.room;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.controller.accommodation.AccommodationUpdateController;
import com.shopping.model.bean.Room;
import com.shopping.model.dao.RoomDao;

public class RoomInsertController extends SuperClass {
	private final String PREFIX = "room/" ;

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		int acid = Integer.parseInt(request.getParameter("acid"));
		
		request.setAttribute("acid", acid);
		super.gotoPage(PREFIX + "roInsert.jsp");			
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		
		Room bean = new Room();
		
		bean.setAcid(Integer.parseInt(request.getParameter("acid")));
		bean.setRoom(request.getParameter("room"));
		bean.setRoominfo(request.getParameter("roominfo"));
		bean.setPrice(Integer.parseInt(request.getParameter("price")));
		bean.setBreakfast(request.getParameter("breakfast"));
		bean.setGuests(Integer.parseInt(request.getParameter("guests")));
		bean.setImage01(request.getParameter("image01"));
		bean.setImage02(request.getParameter("image02"));
		bean.setImage03(request.getParameter("image03"));
		RoomDao dao = new RoomDao();
		
		int cnt = -1;
		
		try {
			cnt = dao.InsertData(bean);	
			
			if(cnt == -1) { // 등록 실패
				new RoomInsertController().doGet(request, response);
				
			}else { // 성공
				new AccommodationUpdateController().doGet(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			new RoomInsertController().doGet(request, response);
		}	
		
	}
}

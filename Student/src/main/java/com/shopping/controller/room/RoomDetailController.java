package com.shopping.controller.room;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Room;
import com.shopping.model.dao.RoomDao;

public class RoomDetailController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		int roid = Integer.parseInt(request.getParameter("roid"));
		
		RoomDao dao = new RoomDao();
		try {
			Room room = dao.getDataByPk(roid);
			
			request.setAttribute("room", room);
			super.gotopage("room/roDetail.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

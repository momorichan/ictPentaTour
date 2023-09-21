package com.shopping.controller.room;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

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
			
			JSONArray jsArr = new JSONArray();
			JSONObject obj = new JSONObject();
			obj.put("roid",room.getRoid());
			obj.put("acid", room.getAcid());
			obj.put("price", room.getPrice());
			obj.put("guests", room.getGuests());
			obj.put("room", room.getRoom());
			obj.put("roominfo", room.getRoominfo());
			obj.put("roomtype", room.getRoomtype());
			obj.put("breakfast", room.getBreakfast());
			obj.put("image01", room.getImage01());
			obj.put("image02", room.getImage02());
			obj.put("image03", room.getImage03());
			jsArr.add(obj);
			
			request.setAttribute("jsArr", jsArr);
			System.out.println("jsArr: " + jsArr.toString());
			super.gotopage("room/roDetail.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

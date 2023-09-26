package com.shopping.controller.accommodation;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Room;
import com.shopping.model.bean.accommodation;
import com.shopping.model.dao.AccommodationDao;
import com.shopping.model.dao.RoomDao;

public class AccommodationUpdateController extends SuperClass{
	private final String PREFIX = "accommodation/" ;
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		int acid = Integer.parseInt(request.getParameter("acid"));
		
		AccommodationDao acdao = new AccommodationDao();
		accommodation acbean = acdao.getDataByPk(acid);
		request.setAttribute("acbean", acbean);
		
		
		RoomDao rodao = new RoomDao();
		List<Room> roomlist = rodao.getDataByFk(acid);
		request.setAttribute("roomlist", roomlist);

		
		
		gotopage(PREFIX+"acUpdate.jsp");
	}
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		
		
		
		
	}
}

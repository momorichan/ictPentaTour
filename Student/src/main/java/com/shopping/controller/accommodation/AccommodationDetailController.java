package com.shopping.controller.accommodation;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Room;
import com.shopping.model.bean.accommodation;
import com.shopping.model.dao.AccommodationDao;
import com.shopping.model.dao.RoomDao;

public class AccommodationDetailController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		Integer acid = super.getNumberData(request.getParameter("acid"));
		
		AccommodationDao dao = new AccommodationDao();
		RoomDao roomdao = new RoomDao();
		
		
		try {
			accommodation bean = dao.getBeanData(acid); 
			List<Room> lists = roomdao.getDataByFk(acid);
			List<String> randomimage = roomdao.randomImage();
			request.setAttribute("roomlists", lists);
			request.setAttribute("acbean", bean);
			request.setAttribute("randomimage", randomimage);
			super.gotopage("accommodation/acDetail.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		

	}
}

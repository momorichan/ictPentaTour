package com.shopping.controller.room;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.controller.accommodation.AccommodationInsertController;
import com.shopping.controller.accommodation.AccommodationUpdateController;
import com.shopping.model.bean.Room;
import com.shopping.model.dao.RoomDao;

public class RoomDeleteController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		int roid = Integer.parseInt(request.getParameter("roid"));

		RoomDao dao = new RoomDao();
		Room bean = dao.getDataByPk(roid);

		String referer = request.getHeader("Referer");
		session.setAttribute("referer", referer);
		System.out.println(referer);
		request.setAttribute("bean", bean);
		gotopage("room/roDelete.jsp");
		
	}
	
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);

		
		int roid = Integer.parseInt(request.getParameter("roid"));

		
		RoomDao dao = new RoomDao();
		int cnt = -1;

		try {
			cnt = dao.deleteData(roid);

			if (cnt != -1) {
				String referer = (String)session.getAttribute("referer");
				System.out.println(referer);
				if (referer != null && referer.contains("acUpdate")) {
					// referer에 "roUpdate"가 포함되어 있는 경우
					
					new AccommodationUpdateController().doGet(request, response);
				} else if (referer != null && referer.contains("acInsert")) {
					// "roInsert"가 포함되어 있는 경우
					new AccommodationInsertController().doGet(request, response);
				} else {
					new AccommodationInsertController().doGet(request, response);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

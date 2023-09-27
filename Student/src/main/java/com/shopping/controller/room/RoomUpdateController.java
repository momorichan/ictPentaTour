package com.shopping.controller.room;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.controller.accommodation.AccommodationInsertController;
import com.shopping.controller.accommodation.AccommodationUpdateController;
import com.shopping.model.bean.Room;
import com.shopping.model.dao.RoomDao;

public class RoomUpdateController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);

		int roid = Integer.parseInt(request.getParameter("roid"));

		RoomDao dao = new RoomDao();
		Room bean = dao.getDataByPk(roid);

		String referer = request.getHeader("Referer");
		session.setAttribute("referer", referer);
		
		request.setAttribute("bean", bean);
		gotopage("room/roUpdate.jsp");
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);

		Room bean = new Room();

		bean.setAcid(Integer.parseInt(request.getParameter("acid")));
		bean.setRoid(Integer.parseInt(request.getParameter("roid")));
		bean.setPrice(Integer.parseInt(request.getParameter("price")));
		bean.setGuests(Integer.parseInt(request.getParameter("guests")));
		bean.setRoom(request.getParameter("room"));
		bean.setRoominfo(request.getParameter("roominfo"));
		bean.setBreakfast(request.getParameter("breakfast"));

		String preimage01 = request.getParameter("preimage01");
		String preimage02 = request.getParameter("preimage02");
		String preimage03 = request.getParameter("preimage03");
		String newimage01 = request.getParameter("newimage01");
		String newimage02 = request.getParameter("newimage02");
		String newimage03 = request.getParameter("newimage03");

		if (newimage01 == "") {
			bean.setImage01(preimage01);
		} else {
			bean.setImage01(newimage01);
		}
		if (newimage02 == "") {
			bean.setImage02(preimage02);
		} else {
			bean.setImage02(newimage02);
		}
		if (newimage03 == "") {
			bean.setImage03(preimage03);
		} else {
			bean.setImage03(newimage03);
		}

		RoomDao dao = new RoomDao();
		int cnt = -1;

		try {
			cnt = dao.updateData(bean);

			if (cnt != -1) {
				String referer = (String)session.getAttribute("referer");
				System.out.println(referer);
				if (referer != null && referer.contains("acUpdate")) {
					// referer에 "roUpdate"가 포함되어 있는 경우
					request.setAttribute("bean", bean);
					new AccommodationUpdateController().doGet(request, response);
				} else if (referer != null && referer.contains("acInsert")) {
					// "roInsert"가 포함되어 있는 경우
					new AccommodationInsertController().doGet(request, response);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

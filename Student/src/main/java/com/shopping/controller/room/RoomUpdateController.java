package com.shopping.controller.room;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Room;
import com.shopping.model.dao.RoomDao;

public class RoomUpdateController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		int roid = Integer.parseInt(request.getParameter("roid"));
		
		RoomDao dao = new RoomDao();
		Room bean = dao.getDataByPk(roid);
		
		request.setAttribute("bean", bean);
		gotopage("room/roUpdate.jsp");
	}
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		
		//		request.getParameter를 활용하여 bean에 저장
		//		다음으로dao에서 업데이트
		//		jsp로 이동

		
		//문제점 : acInsert, acUpdate 두 개가 있어서 어디로 가야할 지 정하는 게 필요
	}
}

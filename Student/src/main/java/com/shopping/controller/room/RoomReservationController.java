package com.shopping.controller.room;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
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
		
		request.setAttribute("acbean", acbean);
		request.setAttribute("robean", robean);
		request.setAttribute("mebean", mebean);
		request.setAttribute("startDate", startDate);
		request.setAttribute("endDate", endDate);
		
		System.out.println(acbean.getCity());
		
		gotopage("room/roReservation.jsp");
	}
}

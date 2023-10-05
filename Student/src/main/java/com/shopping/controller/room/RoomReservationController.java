package com.shopping.controller.room;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.controller.accommodation.AccommodationListController;
import com.shopping.model.bean.Member;
import com.shopping.model.bean.Room;
import com.shopping.model.bean.Rrdetails;
import com.shopping.model.bean.accommodation;
import com.shopping.model.dao.AccommodationDao;
import com.shopping.model.dao.MemberDao;
import com.shopping.model.dao.RoomDao;
import com.shopping.model.dao.RoomreserDao;

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
		
		String meid = request.getParameter("meid");
		int roid = Integer.parseInt(request.getParameter("roid"));
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		
		System.out.println(meid);
		
		Enumeration<String> parameterNames = request.getParameterNames();
		Map<Integer, Rrdetails> roomsMap = new HashMap<>();

		while(parameterNames.hasMoreElements()) {
		    String paramName = parameterNames.nextElement();
		    Matcher m = Pattern.compile("\\d+$").matcher(paramName); // 숫자를 추출하기 위한 정규식
		    if (m.find()) {
		        int roomNumber = Integer.parseInt(m.group());
		        Rrdetails temp = roomsMap.getOrDefault(roomNumber, new Rrdetails());
		        temp.setRoid(roid);

		        if(paramName.startsWith("membername")) {
		            temp.setName(request.getParameter(paramName));
		        }
		        else if(paramName.startsWith("birth")) {
		            temp.setBirth(request.getParameter(paramName));
		        }            
		        else if(paramName.startsWith("gender")) {
		            temp.setGender(request.getParameter(paramName));
		        }            
		        else if(paramName.startsWith("guest")) {
		            temp.setGuests(Integer.parseInt(request.getParameter(paramName)));
		        }
		        
		        roomsMap.put(roomNumber, temp);
		    }
		}

		List<Rrdetails> memberNames = new ArrayList<>(roomsMap.values());

		
		
		RoomreserDao dao = new RoomreserDao();
		
		int cnt = -1;
		
		try {
			
			
			cnt = dao.insertData(meid, memberNames, startDate, endDate);
			
			
			new AccommodationListController().doGet(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}

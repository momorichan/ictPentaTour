package com.shopping.controller.accommodation;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Room;
import com.shopping.model.bean.accommodation;
import com.shopping.model.dao.AccommodationDao;
import com.shopping.model.dao.RoomDao;

public class AccommodationInsertController extends SuperClass{
	private final String PREFIX = "accommodation/" ;
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		RoomDao dao = new RoomDao();
		List<Room> lists = dao.getTempRoom();
		request.setAttribute("roomlist", lists);
		
		// 세션에서 메시지를 가져와서 JSP에 전달하고, 해당 메시지를 세션에서 제거
        if (request.getSession().getAttribute("message") != null) {
            request.setAttribute("message", request.getSession().getAttribute("message"));
            request.getSession().removeAttribute("message");
        }
		
		super.gotoPage(PREFIX + "acInsert.jsp");	
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);

		accommodation bean = new accommodation();
		
		bean.setName(request.getParameter("name"));
		bean.setAddress(request.getParameter("address"));
		bean.setDescription(request.getParameter("description"));
		bean.setImage01(request.getParameter("image01"));
		bean.setImage02(request.getParameter("image02"));
		bean.setImage03(request.getParameter("image03"));
		
		AccommodationDao dao = new AccommodationDao();
		int cnt = -1 ;
		
		String[] templist = request.getParameterValues("amenities");
		
		 int[] amlist = new int[templist.length];
	        for (int i = 0; i < amlist.length; i++) {
	        	amlist[i] = Integer.parseInt(templist[i]);
	        }
		

		
		
		try {
			
			cnt = dao.InsertData(bean, amlist);	
			
			if(cnt == -1) { // 등록 실패
				new AccommodationInsertController().doGet(request, response);
				
			}else { // 성공
				new AccommodationListController().doGet(request, response);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			new AccommodationInsertController().doGet(request, response);
		}	
	}

}

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
		List<Room> roomlist = rodao.getDataByFk(acid); //원래 숙소에 등록된 방 정보
		List<Room> newroomlist = rodao.getTempRoom(); //신규 방 정보
		roomlist.addAll(newroomlist); //원래 방 정보와 신규 방 정보를 결합
		request.setAttribute("roomlist", roomlist);

		gotoPage(PREFIX+"acUpdate.jsp");
	}
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);

		accommodation bean = new accommodation();
		
		bean.setAcid(Integer.parseInt(request.getParameter("acid")));
		bean.setName(request.getParameter("name"));
		bean.setAddress(request.getParameter("address"));
		bean.setDescription(request.getParameter("description"));
		
		
		String preimage01 = request.getParameter("preimage01");
		String preimage02 = request.getParameter("preimage02");
		String preimage03 = request.getParameter("preimage03");
		String newimage01 = request.getParameter("newimage01");
		String newimage02 = request.getParameter("newimage02");
		String newimage03 = request.getParameter("newimage03");
				
		if(newimage01=="") {
			bean.setImage01(preimage01);
		} else {
			bean.setImage01(newimage01);
		}
		if(newimage02=="") {
			bean.setImage02(preimage02);
		} else {
			bean.setImage02(newimage02);
		}
		if(newimage03=="") {
			bean.setImage03(preimage03);
		} else {
			bean.setImage03(newimage03);
		}
		
		
		
		AccommodationDao dao = new AccommodationDao();
		int cnt = -1 ;
		
		String[] templist = request.getParameterValues("amenities");
		
		 int[] amlist = new int[templist.length];
	        for (int i = 0; i < amlist.length; i++) {
	        	amlist[i] = Integer.parseInt(templist[i]);
	        }
		

		
		
		try {
			
			cnt = dao.updateData(bean, amlist);	
			
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

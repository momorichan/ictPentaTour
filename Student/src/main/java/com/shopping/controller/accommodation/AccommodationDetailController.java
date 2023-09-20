package com.shopping.controller.accommodation;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Room;
import com.shopping.model.bean.accommodation;
import com.shopping.model.dao.AccommodationDao;

public class AccommodationDetailController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		Integer acid = super.getNumberData(request.getParameter("acid"));
		
		AccommodationDao dao = new AccommodationDao();

		
		try {
			List<Room> lists = dao.getDataByPk(acid);
			request.setAttribute("lists", lists);
			
			super.gotopage("accommodation/acDetail.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		

	}
}

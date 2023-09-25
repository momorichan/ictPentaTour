package com.shopping.controller.accommodation;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.bean.accommodation;
import com.shopping.model.dao.AccommodationDao;

public class AccommodationInsertController extends SuperClass{
	private final String PREFIX = "accommodation/" ;
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		super.gotoPage(PREFIX + "acInsert.jsp");	
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);

		accommodation bean = new accommodation();
		
		AccommodationDao dao = new AccommodationDao();
		
		int cnt = -1 ;
		try {
			cnt = dao.InsertData(bean);	
			
			if(cnt == -1) { // 등록 실패
				new AccommodationInsertController().doGet(request, response);
				
			}else { // 성공
				// 게시물 목록 보기 페이지로 이동
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			new AccommodationInsertController().doGet(request, response);
		}	
	}

}

package com.shopping.controller.rentalcar;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Board;
import com.shopping.model.bean.Rentalcar;
import com.shopping.model.dao.RentalcarDao;
import com.shopping.utility.Paging;

public class RentalcarListController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {	
		super.doGet(request, response);
		
		String pageNumber = request.getParameter("pageNumber") ;
		String pageSize = request.getParameter("pageSize") ;
		String mode = request.getParameter("mode") ;
		String keyword = request.getParameter("keyword") ;
		
		
		/* 렌트카 페이징 */
		String startLocation = request.getParameter("startLocation");
		String endLocation = request.getParameter("endLocation");
		String date = request.getParameter("date");
		RentalcarDao dao = new RentalcarDao();
		
		
		try {
			int totalCount = dao.GetTotalRecordCount(mode, keyword); // 수정 예정
			String url = super.getUrlInfomation("rcList") ;
			boolean isGrid = false ;
			Paging pageInfo = new Paging(pageNumber, pageSize, totalCount, url, mode, keyword, isGrid);
			
			List<Rentalcar> lists = dao.selectAll(pageInfo);
			
			request.setAttribute("datalist", lists);
			
			// 페이징 관련 정보를 바인딩
			request.setAttribute("pageInfo", pageInfo);
			
			super.gotoPage("rentalcar/rcList.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
}

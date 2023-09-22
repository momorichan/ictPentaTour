package com.shopping.controller.rentalcar;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Rentalcar;
import com.shopping.model.dao.RentalcarDao;
import com.shopping.utility.Paging_bak;

public class RentalcarListController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {	
		super.doGet(request, response);
		String pageNumber = request.getParameter("pageNumber") ;
		String pageSize = request.getParameter("pageSize") ;
		String mode = request.getParameter("mode") ;
		String keyword = request.getParameter("keyword") ;
		
		
		/* 렌트카 페이징 */
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String startLocation = request.getParameter("startLocation");
		String endLocation = request.getParameter("endLocation");
		
		RentalcarDao dao = new RentalcarDao();
		
		
		try {			
			int totalCount = 0;
			Paging_bak pageInfo = null;
			boolean isGrid = false;
			
			if(startDate == "" || startDate == null) {
				totalCount = dao.GetTotalRecordCount(mode, keyword);				
				pageInfo = new Paging_bak(pageNumber, pageSize, totalCount, endDate, mode, keyword, isGrid);
			}else {
				totalCount = dao.GetTotalRecordCount(mode, keyword, startDate, endDate);
				//pageInfo = new Paging_bak(pageNumber, pageSize, startDate, totalCount, endDate, mode, keyword, isGrid);
			
				
			}			
					
			List<Rentalcar> lists = dao.selectAll(pageInfo);
			
			
			String url = super.getUrlInfomation("rcList") ;
			
			
			/*
			 * Paging pageInfo = new Paging(pageNumber, pageSize, totalCount, url, mode,
			 * keyword, isGrid);
			 */
			
			
			
			request.setAttribute("datalist", lists);

			// 페이징 관련 정보를 바인딩
			request.setAttribute("pageInfo", pageInfo);			
			super.gotoPage("rentalcar/rcList.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
}

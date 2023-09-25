package com.shopping.controller.rentalcar;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Rentalcar;
import com.shopping.model.dao.RentalcarDao;
import com.shopping.utility.Paging;

public class RentalcarListController extends SuperClass{
	

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {	
		super.doGet(request, response);
		
		String pageNumber = request.getParameter("pageNumber") ;
		String pageSize = request.getParameter("pageSize") ;	
		
		/* 렌트카 페이징 */
		// list.jsp의  name value 가져옴
		String startLocation = request.getParameter("startLocation");
		String endLocation = request.getParameter("endLocation"); 
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		
		System.out.println(startDate);
		System.out.println(endDate);
		RentalcarDao dao = new RentalcarDao();
		
		int totalCount = 0;
		try {			
			boolean isGrid = false ;
			String url = super.getUrlInfomation("rcList") ;			
//			int totalCount = dao.GetTotalRecordCountSLEL(startLocation,endLocation);
			
			if(startLocation == null || startLocation.equals("all")) {				
				if(endLocation == null || endLocation.equals("all")) {
					// 대여 장소 x, 반납 장소 x, 시작일 o, 반납일 o
					if(startDate != null && endDate != null && startDate.equalsIgnoreCase("") && endDate.equalsIgnoreCase("")) {
						totalCount = dao.GetTotalRecordCountSDED(startDate, endDate);
					}else {
						System.out.println("SL, EL, SD, ED 싹다 null 값");
						totalCount = dao.GetTotalRecordCount();
					}					
				}else {
					// 대여장소 x, 반납 장소 o
					totalCount = dao.GetTotalRecordCountOnlyEndLocation(endLocation);
				}
			// 대여 장소 o,
			}else {  
				if(endLocation == null || startLocation.equals("")) {
					// 대여 장소 o, 반납 장소 x
					totalCount = dao.GetTotalRecordCountOnlyStartLocation(startLocation);
				}else {
					// 대여장소 o, 반납 장소 o
					totalCount = dao.GetTotalRecordCountSLEL(startLocation, endLocation);
				}			
				
			}			
			
			/* Paging */
//			Paging pageInfo = null;
			Paging pageInfo = new Paging(isGrid, pageNumber, pageSize, totalCount, url, startLocation, endLocation);
			if(startLocation == null || startLocation.equals("")) {				
				if(endLocation == null || endLocation.equals("")) {
					if(startDate != null && endDate != null && startDate.equalsIgnoreCase("") && endDate.equalsIgnoreCase("")) {
						// 대여 장소 x, 반납 장소 x, 시작일 o, 반납일 o
						pageInfo = new Paging(pageNumber, pageSize, totalCount, url, startDate, endDate, isGrid);
					}else {
						// 대여 장소 x, 반납 장소 x, 시작일 x , 반납일 x						
						pageInfo = new Paging(pageNumber, pageSize, totalCount, url, startDate, endDate, isGrid);
					}					
				}else {
					// 대여장소 x, 반납 장소 o
					pageInfo = new Paging(pageNumber, pageSize, totalCount, url, startLocation, endLocation, isGrid);
				}
			// 대여 장소 o,
			}else {  
				if(endLocation == null || startLocation.equals("")) {
					// 대여 장소 o, 반납 장소 x
					pageInfo = new Paging(pageNumber, pageSize, totalCount, url, startLocation, endLocation, isGrid);
				}else {
					// 대여장소 o, 반납 장소 o
					pageInfo = new Paging(pageNumber, pageSize, totalCount, url, startLocation, endLocation, isGrid);
				}			
				
			}
						
//			List<Rentalcar> lists = dao.selectAll(pageInfo, startLocation, endLocation);			
			
			List<Rentalcar> lists = null;
			/* lists*/
			if(startLocation == null || startLocation.equals("all")) {				
				if(endLocation == null || endLocation.equals("all")) {
					if(startDate != null && endDate != null && startDate.equalsIgnoreCase("") && endDate.equalsIgnoreCase("")) {
						// 대여 장소 all, 반납 장소 all, 시작일 o, 반납일 o
						lists = dao.selectSDED(pageInfo, startDate, endDate);						
					}else {
						// 대여 장소 all, 반납 장소 all, 시작일 x , 반납일 x						
						lists = dao.selectSLEL(pageInfo, startLocation, endLocation);
					}					
				}else {
					if(startDate != null && endDate != null && startDate.equalsIgnoreCase("") && endDate.equalsIgnoreCase("")) {
						// 대여 장소 all, 반납 장소 o, 시작일 o, 반납일 o
						lists = dao.selectSDED(pageInfo, startDate, endDate);						
					}else {
						// 대여 장소 all, 반납 장소 all, 시작일 x , 반납일 x						
						lists = dao.selectAN(pageInfo);
					}
				}
			// 대여 장소 o,
			}else {  
				if(endLocation == null || endLocation.equals("all")) {					
					if(startDate != null && endDate != null && startDate.equalsIgnoreCase("") && endDate.equalsIgnoreCase("")) {
						// 대여 장소 o, 반납 장소 all, 시작일 o, 반납일 o
						lists = dao.selectSLSDED(pageInfo, startLocation, startDate, endDate);						
					}else {
						// 대여 장소 o, 반납 장소 all, 시작일 x , 반납일 x						
						lists = dao.selectSL(pageInfo, startLocation);
					}										
				}else {
					if(startDate != null && endDate != null && startDate.equalsIgnoreCase("") && endDate.equalsIgnoreCase("")) {
						// 대여 장소 o, 반납 장소 o, 시작일 o, 반납일 o
						lists = dao.selectSLELSDED(pageInfo, startLocation, endLocation, startDate, endDate);						
					}else {
						// 대여 장소 o, 반납 장소 o, 시작일 x , 반납일 x						
						lists = dao.selectSLEL(pageInfo, startLocation, endLocation);
					}
				}			
				
			}
			
			
			
			
			
			
			
			request.setAttribute("datalist", lists);
			// 페이징 관련 정보를 바인딩
			request.setAttribute("pageInfo", pageInfo);
			
			super.gotoPage("rentalcar/rcList.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
}

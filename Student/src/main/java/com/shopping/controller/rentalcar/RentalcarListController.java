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
		String mode = request.getParameter("mode") ;
		String keyword = request.getParameter("keyword") ;

		RentalcarDao dao = new RentalcarDao();
		try {
			int totalCount = dao.GetTotalRecordCount(mode, keyword); 
			String url = super.getUrlInfomation("rcList") ;
			boolean isGrid = true ;
			Paging pageInfo = new Paging(pageNumber, pageSize, totalCount, url, mode, keyword, isGrid);
				
			List<Rentalcar> lists = dao.selectAll(pageInfo);
			
			request.setAttribute("pageInfo", pageInfo);			
			request.setAttribute("datalist", lists);
			super.gotoPage("rentalcar/rcList.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
}

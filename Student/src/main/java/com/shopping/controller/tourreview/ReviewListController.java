package com.shopping.controller.tourreview;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Review;
import com.shopping.model.dao.TourReviewDao;
import com.shopping.utility.Paging;

public class ReviewListController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);

		//페이징 처리를 위한 파라미터들
		String pageNumber = request.getParameter("pageNumber");
		String pageSize = request.getParameter("pageSize");
		String mode = request.getParameter("mode");
		String keyword = request.getParameter("keyword");
		
		String attribute = "meid, rating, regdate, content";
		
		TourReviewDao dao = new TourReviewDao();
		try {
			int totalCount = dao.getTotalRecordCount(1); 
			String url = super.getUrlInfomation("rvList");
			boolean isGrid = false;
			
			Paging pageInfo = 
					new Paging(pageNumber, pageSize, totalCount, url, mode, keyword, isGrid);
			List<Review> lists = dao.selectAll(pageInfo, attribute);
			
			request.setAttribute("datalist", lists);	
			
			//페이징 정보를 바인딩
			request.setAttribute("pageInfo", pageInfo);			
			super.gotopage("tourreview/tourrvList.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}

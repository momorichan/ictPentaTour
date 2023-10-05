package com.shopping.controller.tour;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Review;
import com.shopping.model.bean.Tour;
import com.shopping.model.dao.ReviewDao;
import com.shopping.model.dao.TourDao;
import com.shopping.utility.Paging;

public class TourDetailController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		int toid = Integer.parseInt(request.getParameter("toid"));
		TourDao dao = new TourDao();
		Tour bean = null;
		ReviewDao rdao = new ReviewDao();
		List<Review> rbean = new ArrayList<Review>();
		String pageNumber = request.getParameter("pageNumber");
		String pageSize = "10";
		String mode = request.getParameter("mode");
		String keyword = request.getParameter("keyword");
		try {
			double rating = rdao.calculateAverageRating(toid);
			int qty = rdao.getTotalRecordCount(toid);
			bean = dao.getDataByPrimaryKey(toid);
			String url = super.getUrlInfomation("tourDetail");
			boolean isGrid = false;
			Paging pageInfo = new Paging(pageNumber, pageSize, qty, url, mode, keyword, isGrid, toid);
			rbean = rdao.getDataByToid(pageInfo, toid);
			request.setAttribute("datalist", rbean);
			request.setAttribute("bean", bean);
			request.setAttribute("averageRating", rating);
			request.setAttribute("commentAdd", qty);
			request.setAttribute("pageInfo", pageInfo);
			super.gotopage("tour/tourDetail.jsp");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}

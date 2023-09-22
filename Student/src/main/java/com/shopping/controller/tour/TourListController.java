package com.shopping.controller.tour;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Tour;
import com.shopping.model.dao.TourDao;
import com.shopping.utility.Paging;

public class TourListController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		String pageNumber = request.getParameter("pageNumber");
		String pageSize = request.getParameter("pageSize");
		String mode = request.getParameter("mode");
		String keyword = request.getParameter("keyword");
		String selecttname = "";
		String selectlocation = "";
		
		TourDao dao = new TourDao();
		try {
			int totalCount = dao.GetTotalRecordCount();
			String url = super.getUrlInfomation("tourList");
			boolean isGrid = true;
			Paging pageInfo = new Paging(pageNumber, pageSize, totalCount, url, mode, keyword, isGrid);
			List<Tour> lists = new ArrayList<>();
			totalCount = dao.GetTotalRecordCount(pageInfo.getMode(), pageInfo.getKeyword());
			pageInfo = new Paging(pageNumber, pageSize, totalCount, url, mode, keyword, isGrid);
			lists = dao.selectAll(pageInfo);
			if (pageInfo.getMode().equals("tname"))
				selecttname = "selected=\"selected\"";
			if (pageInfo.getMode().equals("location"))
				selectlocation = "selected=\"selected\"";
			
			request.setAttribute("datalist", lists);
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("selecttname", selecttname);
			request.setAttribute("selectlocation", selectlocation);

			super.gotopage("tour/tourList.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

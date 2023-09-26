package com.shopping.controller.accommodation;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.bean.AcRoomPrice;
import com.shopping.model.dao.AcRoomPriceDao;
import com.shopping.utility.Paging;

public class AccommodationListController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);

		// 페이징 처리를 위한 파라미터들
		String pageNumber = request.getParameter("pageNumber");
		String pageSize = request.getParameter("pageSize");
		String mode = request.getParameter("mode");
		String keyword = request.getParameter("keyword");

		
		AcRoomPriceDao ardao = new AcRoomPriceDao();
		try {
			int totalCount = ardao.getTotalRecordCount(mode, keyword);
			String url = super.getUrlInfomation("acList");
			boolean isGrid = true;

			Paging pageInfo = new Paging(pageNumber, pageSize, totalCount, url, mode, keyword, isGrid);
			List<AcRoomPrice> lists = ardao.selectAll(pageInfo);
			
			request.setAttribute("datalist", lists);
			request.setAttribute("pageInfo", pageInfo);
			
			super.gotopage("accommodation/acList.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

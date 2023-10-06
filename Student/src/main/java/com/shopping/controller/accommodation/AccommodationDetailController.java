package com.shopping.controller.accommodation;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Review;
import com.shopping.model.bean.Room;
import com.shopping.model.bean.accommodation;
import com.shopping.model.dao.AccommodationDao;
import com.shopping.model.dao.ReviewDao;
import com.shopping.model.dao.RoomDao;
import com.shopping.utility.Paging;

public class AccommodationDetailController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		Integer acid = super.getNumberData(request.getParameter("acid"));
		Integer minprice = super.getNumberData(request.getParameter("minprice"));
		
		AccommodationDao dao = new AccommodationDao();
		RoomDao roomdao = new RoomDao();
		
		ReviewDao rdao = new ReviewDao();
		List<Review> rbean = new ArrayList<Review>();
		String pageNumber = request.getParameter("pageNumber");
		String pageSize = "10";
		String mode = request.getParameter("mode");
		String keyword = request.getParameter("keyword");
		
		
		try {
			accommodation bean = dao.getDataByPk(acid); 
			List<Room> lists = roomdao.getDataByFk(acid);
			List<String> randomimage = roomdao.randomImage(acid);
			request.setAttribute("roomlists", lists);
			request.setAttribute("acbean", bean);
			request.setAttribute("randomimage", randomimage);
			request.setAttribute("minprice",minprice);
			double rating = rdao.calculateAverageRating(acid);
			int qty = rdao.getTotalRecordCount(acid);
			String url = super.getUrlInfomation("rvDetail");
			boolean isGrid = false;
			Paging pageInfo = new Paging(pageNumber, pageSize, qty, url, mode, keyword, isGrid);
			String attribute = "acid, meid, rating, regdate, content";
			rbean = rdao.getDataByAcid(pageInfo, acid);
			super.session.setAttribute("datalist", rbean);
			request.setAttribute("pageInfo", pageInfo);
			super.session.setAttribute("commentAdd", qty);
			super.session.setAttribute("averageRating", rating);
		
			//페이징 정보를 바인딩
			super.gotopage("accommodation/acDetail.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			}
		}
}


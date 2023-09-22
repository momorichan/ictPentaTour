package com.shopping.controller.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Review;
import com.shopping.model.dao.ReviewDao;

public class ReviewUpdateController extends SuperClass{
	private final String PREFIX = "review/" ;

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		Integer trid = Integer.parseInt(request.getParameter("trid"));
		
		ReviewDao dao = new ReviewDao();
		
		Review bean = dao.getDataByPk(trid);
		
		request.setAttribute("bean", bean);
		super.gotopage(PREFIX+"rvUpdateForm.jsp");
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		
		Review bean = new Review();
		
		bean.setMeid(request.getParameter("meid"));
		bean.setRating(Integer.parseInt( request.getParameter("rating")));
		bean.setContent(request.getParameter("content"));
		bean.setRegdate(request.getParameter("regdate"));
		
		ReviewDao dao = new ReviewDao();
		
		int cnt = -1;
		
		try {
			cnt = dao.UpdateData(bean);
			if(cnt == -1) { //등록 실패
				new ReviewUpdateController().doGet(request, response);
			}else { // 성공
				//게시물 목록 보기 페이지로 이동
				//페이징 관련 파라미터도 넘겨주어야 함
				
				String gotopage = super.getUrlInfomation("boList");
				gotopage += "&pageNumber=" + request.getParameter("pageNumber");
				gotopage += "&pageSize=" + request.getParameter("pageSize");
				gotopage += "&mode=" + request.getParameter("mode");
				gotopage += "&keyword=" + request.getParameter("keyword");
				response.sendRedirect(gotopage);
				
				//이전 코딩 방식
				//new BoardListController().doGet(request, response);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			new ReviewInsertController().doGet(request, response);
		}

		
	}
}

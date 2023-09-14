package com.shopping.controller.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Board;
import com.shopping.model.dao.BoardDao;

public class BoardUpdateController extends SuperClass{
	private final String PREFIX = "board/" ;

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		Integer no = Integer.parseInt(request.getParameter("no"));
		
		BoardDao dao = new BoardDao();
		
		Board bean = dao.getDataByPk(no);
		
		request.setAttribute("bean", bean);
		super.gotopage(PREFIX+"boUpdateForm.jsp");
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		
		Board bean = new Board();
		
		bean.setNo(super.getNumberData(request.getParameter("no")));
		bean.setId(request.getParameter("id"));
		bean.setPassword(request.getParameter("password"));
		bean.setSubject(request.getParameter("subject"));
		bean.setContent(request.getParameter("content"));
		bean.setRegdate(request.getParameter("regdate"));
		
		BoardDao dao = new BoardDao();
		
		int cnt = -1;
		
		try {
			cnt = dao.UpdateData(bean);
			if(cnt == -1) { //등록 실패
				new BoardUpdateController().doGet(request, response);
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
			new BoardInsertController().doGet(request, response);
		}

		
	}
}

package com.shopping.controller.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Board;
import com.shopping.model.dao.BoardDao;
import com.shopping.utility.Paging;

public class BoardListController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);

		//페이징 처리를 위한 파라미터들
		String pageNumber = request.getParameter("pageNumber");
		String pageSize = request.getParameter("pageSize");
		String mode = request.getParameter("mode");
		String keyword = request.getParameter("keyword");
		
		String attribute = "no, id, password, subject, content, readhit, regdate, remark, groupno, orderno, depth, likes, hates";
		
		BoardDao dao = new BoardDao();
		try {
			int totalCount = dao.getTotalRecordCount("boards", mode, keyword); 
			String url = super.getUrlInfomation("boList");
			boolean isGrid = false;
			
			Paging pageInfo = 
					new Paging(pageNumber, pageSize, totalCount, url, mode, keyword, isGrid);
			
			List<Board> lists = dao.selectAll(pageInfo, attribute);
			
			request.setAttribute("datalist", lists);	
			
			//페이징 정보를 바인딩
			request.setAttribute("pageInfo", pageInfo);			
			super.gotopage("board/boList.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}

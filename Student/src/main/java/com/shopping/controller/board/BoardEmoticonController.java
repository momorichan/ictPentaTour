package com.shopping.controller.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.dao.BoardDao;

public class BoardEmoticonController extends SuperClass{
	@Override // 해당 이모티콘의 값을 +1 증가시킵니다.
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {		
		super.doGet(request, response);
		
		String mode = request.getParameter("mode"); // 좋아요, 싫어요 등의 mode 값
		int no = Integer.parseInt(request.getParameter("no")); // 글 번호
		BoardDao dao = new BoardDao() ;
		int cnt = -1 ;
		
		try {
			cnt = dao.UpdateEmoticon(no, mode) ;
			
			new BoardDetailController().doGet(request, response); 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

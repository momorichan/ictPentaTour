package com.shopping.controller.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.controller.product.ProductListController;
import com.shopping.model.bean.Member;
import com.shopping.model.bean.WishList;
import com.shopping.model.dao.MallDao;
import com.shopping.model.dao.MemberDao;

public class MemberLoginController extends SuperClass{
	private final String PREFIX = "member/" ;

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {		
		super.doGet(request, response);
		super.gotoPage(PREFIX + "meLoginForm.jsp");
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		
		String id = request.getParameter("id") ;
		String password = request.getParameter("password") ;
		System.out.println(id + "/" + password);
		
		MemberDao dao = new MemberDao() ;
		Member bean = null ; 
		
		try {
			bean = dao.getDataByPk(id, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(bean == null) { // 로그인 실패
			String message = "로그인 정보가 잘못 되었습니다.";
			super.setAlertMessage(message) ;
			
			super.gotoPage(PREFIX + "meLoginForm.jsp");
			
		}else { // 로그인 성공
			// session 영역에 나의 로그인 정보를 저장합니다.
			super.session.setAttribute("loginfo", bean);
			
			MallDao mdao = new MallDao() ;
			
			try {
				// 나의 WishList를 테이블에서 읽어 와서 session 영역에 바인딩합니다.
				List<WishList> wishList = mdao.getWishList(bean.getId()) ;
				for(WishList item : wishList) {
					super.mycart.AddCart(item.getPnum(), item.getQty());
				}
				super.session.setAttribute("mycart", mycart);
				
				// 홈 화면으로 이동합니다. 차후 상품 목록 페이지로 갈 예정
				//new HomeController().doGet(request, response) ;
//				new ProductListController().doGet(request, response) ;
				
				super.session.setAttribute("datalist", list);
				super.session.setAttribute("",);
				
				response.sendRedirect(password);
				// 로그인 후 상품리스트 말고 다른 곳으로 가기
				
				
		
				
			} catch (Exception e) {
				e.printStackTrace() ;
			}			
		}
	}
}












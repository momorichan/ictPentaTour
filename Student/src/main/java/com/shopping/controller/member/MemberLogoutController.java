package com.shopping.controller.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.dao.MallDao;

public class MemberLogoutController extends SuperClass {
	@Override // 회원이 로그 아웃을 시도합니다.
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		MallDao dao = new MallDao();
		Map<Integer, Integer> wishList = super.mycart.getAllCartList();
		try {
			// session 영역에 남겨진 장바구니가 있으면, 임시 테이블 WishList에 추가해 줍니다.
			if(super.loginfo != null) {
				if(wishList.size() > 0) {
					dao.insertWishList(super.loginfo.getMeid(),wishList);
				}
			}else {
				super.youNeededLogin();
				return ;
			}
			// 로그인시 저장했던 로그인 정보 등을 깨끗히 비웁니다.
			super.session.invalidate();
			super.gotoPage("member/meLoginForm.jsp"); // 로그인 페이지로 이동함
		} catch (Exception e) {
			e.printStackTrace();

		}
		
		

		
		
	}
}
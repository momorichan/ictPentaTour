package com.shopping.controller.mall;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.controller.product.ProductListController;

// 상품 상세 보기 페이지에서 [장바구니] 버튼을 클릭하였습니다.
public class MallInsertController extends SuperClass {
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		
		if(super.loginfo==null) {
			super.youNeededLogin(); 
			return ;
		}
		
		int stock = Integer.parseInt(request.getParameter("stock")); // 재고 수량
		int qty = Integer.parseInt(request.getParameter("qty"));// 구매할 수량
		
		if(stock < qty) {
			String message = "재고 수량이 부족합니다.";
			super.setAlertMessage(message); 
			new ProductListController().doGet(request, response); 
			
		}else {
			int pnum = Integer.parseInt(request.getParameter("pnum")); // 상품 번호
			super.mycart.addCart(pnum, qty); 
			super.session.setAttribute("mycart", mycart);
			new MallListController().doGet(request, response); 
		}
		
	}
}

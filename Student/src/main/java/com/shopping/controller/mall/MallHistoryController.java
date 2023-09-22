package com.shopping.controller.mall;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.controller.product.ProductListController;
import com.shopping.model.bean.Order;
import com.shopping.model.dao.MallDao;

public class MallHistoryController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);

		if (super.loginfo == null) {
			super.youNeededLogin();
			return;
		}

		MallDao dao = new MallDao();

		try {
			List<Order> orderList = dao.getHistory(super.loginfo.getMeid());
			if(orderList.size() == 0) {
				super.setAlertMessage("주문 이력이 없습니다.");
				new ProductListController().doGet(request, response);
			}else {
				request.setAttribute("orderList", orderList);
				super.gotopage("mall/maHistory.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
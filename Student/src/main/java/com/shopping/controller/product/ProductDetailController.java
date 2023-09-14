package com.shopping.controller.product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Product;
import com.shopping.model.dao.ProductDao;

public class ProductDetailController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		Integer pnum = super.getNumberData(request.getParameter("pnum"));
		
		ProductDao dao = new ProductDao();

		
		try {
			Product bean = dao.getDataByPk(pnum);
			request.setAttribute("bean", bean);
			
//			String gotopage = super.getUrlInfomation("prList");
//			gotopage += "&pageNumber=" + request.getParameter("pageNumber");
//			gotopage += "&pageSize=" + request.getParameter("pageSize");
//			gotopage += "&mode=" + request.getParameter("mode");
//			gotopage += "&keyword=" + request.getParameter("keyword");
//			response.sendRedirect(gotopage);
			
			
			super.gotopage("product/prDetail.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		

	}
}

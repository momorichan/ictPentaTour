package com.shopping.controller.product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Product;
import com.shopping.model.dao.ProductDao;

public class ProductListController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		ProductDao dao = new ProductDao();
		try {
			List<Product> lists = dao.selectAll();
			
			request.setAttribute("datalist", lists);			
			super.gotopage("product/prList.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

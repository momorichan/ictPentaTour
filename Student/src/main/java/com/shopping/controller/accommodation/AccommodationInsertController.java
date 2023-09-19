package com.shopping.controller.accommodation;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.shopping.controller.SuperClass;
import com.shopping.controller.product.ProductListController;
import com.shopping.model.bean.Category;
import com.shopping.model.bean.Product;
import com.shopping.model.dao.CategoryDao;
import com.shopping.model.dao.ProductDao;

public class AccommodationInsertController extends SuperClass{
private final String PREFIX = "accommodation/" ;
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);

		//categories 테이블에서 상품 카테고리 목록을 읽어서 request에 바인딩 합니다.
		CategoryDao dao = new CategoryDao();
		List<Category> lists = null;
		
		try {
			lists = dao.getCategoryList("accommodation","select");
			request.setAttribute("categories", lists);
		} catch (Exception e) {
			e.printStackTrace();
		}

		super.gotopage(PREFIX+"acInsertForm.jsp");
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
				
		MultipartRequest mr = (MultipartRequest)request.getAttribute("mr");
		
		Product bean = new Product();
		
		//bean.setPnum(null); //상품 번호는 시퀀스가 알아서 처리해줌
		bean.setName(mr.getParameter("name"));
		bean.setCompany(mr.getParameter("company"));
		bean.setCategory(mr.getParameter("category"));
		bean.setContents(mr.getParameter("contents"));
		bean.setInputdate(mr.getParameter("inputdate"));
		
		bean.setStock(super.getNumberData(mr.getParameter("stock")));
		bean.setPrice(super.getNumberData(mr.getParameter("price")));
		bean.setPoint(super.getNumberData(mr.getParameter("point")));		
		
		bean.setImage01(mr.getFilesystemName("image01"));
		bean.setImage02(mr.getFilesystemName("image02"));
		bean.setImage03(mr.getFilesystemName("image03"));
		
		ProductDao dao = new ProductDao();
		
		int cnt = -1;
		try {
			cnt = dao.InsertData(bean);
			
			if(cnt == -1) {
				super.gotopage(PREFIX+"prInsertForm.jsp");
			}else {
				new ProductListController().doGet(request, response);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
package com.shopping.controller.product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Category;
import com.shopping.model.bean.Product;
import com.shopping.model.dao.CategoryDao;
import com.shopping.model.dao.ProductDao;

public class ProductUpdateController extends SuperClass{
private final String PREFIX = "product/" ;
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);

		//categories 테이블에서 상품 카테고리 목록을 읽어서 request에 바인딩 합니다.
		CategoryDao cdao = new CategoryDao();
		List<Category> lists = null;
		
		// 상품 수정 시 넘어 오는 상품 번호를 우선 챙깁니다.
		Integer pnum = Integer.parseInt(request.getParameter("pnum"));
		
		ProductDao pdao = new ProductDao();
		
		Product bean = pdao.getDataByPk(pnum);
		
		try {
			lists = cdao.getCategoryList("product","select");
			request.setAttribute("categories", lists);
			request.setAttribute("bean", bean);
		} catch (Exception e) {
			e.printStackTrace();
		}

		super.gotopage(PREFIX+"prUpdateForm.jsp");
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
				
		MultipartRequest mr = (MultipartRequest)request.getAttribute("mr");
		
		Product bean = new Product();
		
		bean.setName(mr.getParameter("name"));
		bean.setCompany(mr.getParameter("company"));
		bean.setCategory(mr.getParameter("category"));
		bean.setContents(mr.getParameter("contents"));
		bean.setInputdate(mr.getParameter("inputdate"));
		
		bean.setPnum(super.getNumberData(mr.getParameter("pnum"))); //상품 등록과는 다르게, 수정은 상품 번호를 반드시 챙겨야 합니다.
		bean.setStock(super.getNumberData(mr.getParameter("stock")));
		bean.setPrice(super.getNumberData(mr.getParameter("price")));
		bean.setPoint(super.getNumberData(mr.getParameter("point")));		
		
		bean.setImage01(mr.getFilesystemName("image01"));
		bean.setImage02(mr.getFilesystemName("image02"));
		bean.setImage03(mr.getFilesystemName("image03"));
		
		ProductDao dao = new ProductDao();
		
		int cnt = -1;
		try {
			cnt = dao.UpdateData(bean);
			
			if(cnt == -1) {
				super.gotopage(PREFIX+"prUpdateForm.jsp");
			}else {
				String gotopage = super.getUrlInfomation("prList");
				gotopage += "&pageNumber=" + mr.getParameter("pageNumber");
				gotopage += "&pageSize=" + mr.getParameter("pageSize");
				gotopage += "&mode=" + mr.getParameter("mode");
				gotopage += "&keyword=" + mr.getParameter("keyword");
				response.sendRedirect(gotopage);			
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

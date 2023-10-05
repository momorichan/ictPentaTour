package com.shopping.controller.rentalcar;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.shopping.controller.SuperClass;
import com.shopping.controller.product.ProductListController;
import com.shopping.model.bean.Category;
import com.shopping.model.bean.Product;
import com.shopping.model.bean.Rentalcar;
import com.shopping.model.dao.CategoryDao;
import com.shopping.model.dao.ProductDao;
import com.shopping.model.dao.RentalcarDao;

public class RentalcarUpdateController extends SuperClass{
	private final String PREFIX = "rentalcar/" ;
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		// Categories 테이블에서 상품 카테고리 목록을 읽어서 request에 바인딩합니다.
		CategoryDao cdao = new CategoryDao() ;
		List<Category> lists = null ;
		
		// 상품 수정시 넘어 오는 상품 번호를 우선 챙깁니다. 
		String rcid = String.valueOf(request.getParameter("rcid"));
		RentalcarDao rdao = new RentalcarDao() ;
		Rentalcar bean = rdao.GetDataByPk(rcid) ;
		
		try {
			lists = cdao.GetCategoryListForCar("rentalcar", "select") ;
			request.setAttribute("categories", lists);
			request.setAttribute("bean", bean); 
			
			System.out.println("리스트입니다"+lists);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		super.gotoPage(PREFIX + "rcUpdateForm.jsp");
		
	}
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		
		MultipartRequest mr = (MultipartRequest)request.getAttribute("mr") ;
		
		Rentalcar bean = new Rentalcar() ;

		bean.setRcid(mr.getParameter("rcid"));
		bean.setCarName(mr.getParameter("carName"));
		bean.setCarType(mr.getParameter("carType"));
		
		bean.setCarImage01(mr.getFilesystemName("carImage01"));
		bean.setCarImage02(mr.getFilesystemName("carImage02"));
		bean.setCarImage03(mr.getFilesystemName("carImage03"));
		
		bean.setStartDate(mr.getParameter("startDate"));
		bean.setEndDate(mr.getParameter("endDate"));
		bean.setStartLocation(mr.getParameter("startLocation"));
		bean.setEndLocation(mr.getParameter("endLocation"));
		bean.setPassengers(mr.getParameter("passengers"));
		
		bean.setPrice(super.getNumberData(mr.getParameter("price")));
		
		RentalcarDao dao = new RentalcarDao() ;
		int cnt = -1 ;
		try {
			cnt = dao.InsertData(bean) ; 
			
			if(cnt == -1) {
				super.gotoPage(PREFIX + "rcInsertForm.jsp");				
			}else {
				 new ProductListController().doGet(request, response); 
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

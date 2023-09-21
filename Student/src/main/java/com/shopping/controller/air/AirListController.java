package com.shopping.controller.air;

import com.shopping.controller.SuperClass;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.model.bean.Airline;
import com.shopping.model.dao.AirDao;
import com.shopping.utility.Paging;

public class AirListController extends SuperClass{

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doGet(request, response);
		
		
		String pageNumber = request.getParameter("pageNumber");
		String pageSize = request.getParameter("pageSize");
		String mode = request.getParameter("mode");
		String keyword = request.getParameter("keyword");
		
		String mode2 = request.getParameter("mode2");
		String keyword2 = request.getParameter("keyword2");
		
		String mode3 = request.getParameter("mode3");
		String keyword3 =  request.getParameter("keyword3");
		
		String mode4 = request.getParameter("mode4");
		String keyword4 =  request.getParameter("keyword4");
				
		AirDao dao = new AirDao();

		int totalCount = 0;
		
		
		try
		{
			boolean isGrid = false; // 상품목록이 아니기때문에 false
			String url = super.getUrlInfomation("airList");
			
			if(keyword2 == "all" || keyword2 == null)
			{
				
				if(keyword3 == null || keyword3.equals(""))
				{
					totalCount = dao.GetTotalRecordCount(mode,keyword); // 수정 예정
				}
				else
				{
					totalCount = dao.GetTotalRecordCountDate(mode,keyword,mode3,keyword3);
				}
			}
			else
			{	
				if(keyword3 == null || keyword3.equals(""))
				{
					totalCount = dao.GetTotalRecordCount(mode,keyword,mode2,keyword2);
				}
				else
				{
					totalCount = dao.GetTotalRecordCountDate2(mode,keyword,mode2,keyword2,mode3,keyword3);
				}
				
			}
			
			
			Paging pageInfo = null; 
			
			if(keyword2 == "all" || keyword2 == null)
			{
				
				if(keyword3 == null || keyword3.equals(""))
				{
					pageInfo = new Paging(pageNumber, pageSize, totalCount, url, mode, keyword,isGrid);
				}
				else
				{
					pageInfo = new Paging(pageNumber, pageSize, totalCount, url, mode, keyword,mode3,keyword3,isGrid);
				}
			}
			else
			{

				if(keyword3 == null || keyword3.equals(""))
				{
					pageInfo = new Paging(pageNumber, pageSize, totalCount, url, mode, keyword, mode2, keyword2,isGrid);
				}
				else
				{
					pageInfo = new Paging(pageNumber, pageSize, totalCount, url, mode, keyword,mode2,keyword2,mode3,keyword3,isGrid);
				}
			}
			
			List<Airline> list = new ArrayList<Airline>();
			
			if(keyword2 == "all" || keyword2 == null)
			{
				
				
				if(keyword3 == null || keyword3.equals(""))
				{
					list = dao.selectA(pageInfo);
				}
				else
				{
					list = dao.selectB(pageInfo);
				}
			}
			else
			{
				
				if(keyword3 == null || keyword3.equals(""))
				{
					list = dao.selectAll(pageInfo);
				}
				else
				{
					list = dao.selectAllb(pageInfo);
				}
				
			}
			
		
			/* List<Board> list2 = dao.selectOne(pageInfo); */
			
			request.setAttribute("datalist", list);
			// pageinfo를 바인딩
			request.setAttribute("pageInfo", pageInfo);
			super.gotopage("air/airList.jsp");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}
	
	
}

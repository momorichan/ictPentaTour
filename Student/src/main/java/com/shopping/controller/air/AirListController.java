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
				// 2 x
				if(keyword3 == null || keyword3.equals(""))
				{
					
					if(keyword4 == null || keyword4.equals(""))
					{
						totalCount = dao.GetTotalRecordCount(mode,keyword); // 수정 예정
					}
					else
					{
						totalCount = dao.GetTotalRecordCountDate2(mode,keyword,mode4,keyword4); // 수정 예정
					}
				}
				else
				{
					if(keyword4 == null || keyword4.equals(""))
					{
						totalCount = dao.GetTotalRecordCountDate2(mode,keyword,mode3,keyword3);
					}
					else
					{
						totalCount = dao.GetTotalRecordCountDate2x3o4o(mode,keyword,mode3,keyword3,mode4,keyword4); // 수정 예정
					}
					
				}
				// 2x --
			}
			else
			{	
				// 2 o
				if(keyword3 == null || keyword3.equals(""))
				{
					if(keyword4 == null || keyword4.equals(""))
					{
						totalCount = dao.GetTotalRecordCount(mode,keyword,mode2,keyword2);
					}
					else
					{
						totalCount = dao.GetTotalRecordCount2o3x4o(mode,keyword,mode2,keyword2,mode4,keyword4);
					}
					
				}
				else
				{
					if(keyword4 == null || keyword4.equals(""))
					{
						totalCount = dao.GetTotalRecordCountDate2(mode,keyword,mode2,keyword2,mode3,keyword3);
					}
					else
					{
						totalCount = dao.GetTotalRecordCountDate2o3o4o(mode,keyword,mode2,keyword2,mode3,keyword3,mode4,keyword4);
					}
				}
				// 2o
				
			}
			
			
			Paging pageInfo = null; 
			
			if(keyword2 == "all" || keyword2 == null)
			{
				// 2 x
				if(keyword3 == null || keyword3.equals(""))
				{
					if(keyword4 == null || keyword4.equals(""))
					{
						// 2x3x4x
						pageInfo = new Paging(pageNumber, pageSize, totalCount, url, mode, keyword,isGrid);
					}
					else
					{
						// 2x3x4o
						pageInfo = new Paging(pageNumber, pageSize, totalCount, url, mode, keyword, mode4 , keyword4,isGrid);
					}		
				}
				else
				{
					if(keyword4 == null || keyword4.equals(""))
					{
						// 2x3o4x
						pageInfo = new Paging(pageNumber, pageSize, totalCount, url, mode, keyword,mode3,keyword3,isGrid);
					}
					else
					{
						// 2x3o4o
						pageInfo = new Paging(pageNumber, pageSize, totalCount, url, mode, keyword, mode3,keyword3, mode4 , keyword4,isGrid);
					}	
				}
				// 2 x---
			}
			else
			{
				// 2 o
				if(keyword3 == null || keyword3.equals(""))
				{
					if(keyword4 == null || keyword4.equals(""))
					{
						// 2o 3x 4x
						pageInfo = new Paging(pageNumber, pageSize, totalCount, url, mode, keyword, mode2, keyword2,isGrid);
					}
					else
					{
						// 2o 3x 4o
						pageInfo = new Paging(pageNumber, pageSize, totalCount, url, mode, keyword, mode2, keyword2 ,mode4,keyword4,isGrid);
					}	
				}
				else
				{
					// 2o 3o 
					
					if(keyword4 == null || keyword4.equals(""))
					{
						// 2o 3o 4x
						pageInfo = new Paging(pageNumber, pageSize, totalCount, url, mode, keyword,mode2,keyword2,mode3,keyword3,isGrid);
					}
					else
					{
						// 2o 3o 4o
						pageInfo = new Paging(pageNumber, pageSize, totalCount, url, mode, keyword,mode2,keyword2,mode3,keyword3,mode4,keyword4,isGrid);
					}	
				}
				// 2 p
			}
			
			List<Airline> list = new ArrayList<Airline>();
			
			if(keyword2 == "all" || keyword2 == null)
			{
				if(keyword3 == null || keyword3.equals(""))
				{
					if(keyword4 == null || keyword4.equals(""))
					{
						list = dao.selectA(pageInfo);
					}
					else
					{
						// 2x 3x 4o
						list = dao.selectB(pageInfo);
					}
				}
				else
				{
					// 2x 3o 
					if(keyword4 == null || keyword4.equals(""))
					{
						// 2x 3o 4x
						list = dao.selectB(pageInfo);
					}
					else
					{
						// 2x 3o 4o
						list = dao.selectAandB(pageInfo);
					}
				}
			}
			else
			{
				// 2 o 
				if(keyword3 == null || keyword3.equals(""))
				{
					
					if(keyword4 == null || keyword4.equals(""))
					{
						list = dao.selectAll(pageInfo);
					}
					else
					{
						list = dao.selectAllb(pageInfo);
					}
				}
				else
				{
					// 3o
					if(keyword4 == null || keyword4.equals(""))
					{
						list = dao.selectAllb(pageInfo);
					}
					else
					{
						list = dao.selectAllList(pageInfo);
					}
					
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
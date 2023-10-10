package com.shopping.controller.tour;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.shopping.controller.SuperClass;
import com.shopping.model.bean.Tour;
import com.shopping.model.dao.TourDao;

public class TourUpdateController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		int toid = Integer.parseInt(request.getParameter("toid"));
		
		Tour bean = new Tour();
		TourDao dao = new TourDao();
		
		bean = dao.getDataByPrimaryKey(toid);
		super.session.setAttribute("bean", bean);
		
		super.gotopage("tour/tourUpdate.jsp");
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		MultipartRequest mr = (MultipartRequest)request.getAttribute("mr");
		String image01before = mr.getParameter("timage01before");
		String image02before = mr.getParameter("timage02before");
		String image03before = mr.getParameter("timage03before");
		String image01after = mr.getFilesystemName("timage01");
		String image02after = mr.getFilesystemName("timage02");
		String image03after = mr.getFilesystemName("timage03");
		
		Tour bean = new Tour();
		
		bean.setToid(Integer.parseInt(mr.getParameter("toid")));
		bean.setLocation(mr.getParameter("location"));
		bean.setTname(mr.getParameter("tname"));
		bean.setTprice(Integer.parseInt(mr.getParameter("tprice")));
		bean.setTusedate(mr.getParameter("tusedate"));
		bean.setTexdate(Integer.parseInt(mr.getParameter("texdate")));
		bean.setTage(Integer.parseInt(mr.getParameter("tage")));
		bean.setTcontent(mr.getParameter("tcontent"));
		bean.setTfreeage(Integer.parseInt(mr.getParameter("tfreeage")));
		
		if(image01after==null) {
			bean.setTimage01(image01before);
		} else {
			bean.setTimage01(image01after);
		}
		if(image02after==null) {
			bean.setTimage02(image02before);
		} else {
			bean.setTimage02(image02after);
		}
		if(image03after==null) {
			bean.setTimage03(image03before);
		} else {
			bean.setTimage03(image03after);
		}
		
		TourDao dao = new TourDao();
		int cnt = -1;
		
		try {
			cnt = dao.UpdateData(bean);
			
			if(cnt == -1)
				super.gotopage("tour/tourUpdate.jsp");
			else {
				super.setAlertMessage("수정이 완료 되었습니다.");
				new TourHomeController().doGet(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

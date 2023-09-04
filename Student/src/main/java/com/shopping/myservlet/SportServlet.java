package com.shopping.myservlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.Utility.MyUtility;
import com.shopping.sport.Sportcontroller;


@WebServlet(urlPatterns = {"/Sport"}, initParams = {
		@WebInitParam(name = "txtSport", value = "/WEB-INF/sport.txt"),
		@WebInitParam(name = "txtSetting", value = "/WEB-INF/setting2.txt")
})
public class SportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private String txtSport = null;
	private String txtSetting = null;
	private ServletContext application = null;
	private Map<String, Sportcontroller> sportMap = null;
	private Map<String, String> settingMap = null;

    public SportServlet() {}

    @Override
    public void init(ServletConfig config) throws ServletException {
    	this.txtSport = config.getInitParameter("txtSport");
    	this.txtSetting = config.getInitParameter("txtSetting");
    	
    	this.application = config.getServletContext();
    	
		String webFullPathName = application.getRealPath(txtSport);
		
		String webSettingName = application.getRealPath(txtSetting);

		
    	sportMap = MyUtility.getSportMap(webFullPathName);
    	settingMap = MyUtility.getSettingMap(webSettingName);
    	
    	application.setAttribute("map", settingMap);
    }


    private void doprocess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	
    	String command = request.getParameter("command");
    	
    	Sportcontroller controller = sportMap.get(command);
    	
    	if(controller != null) {
    		controller.play();
    	}else {
    		System.out.println("request command is not found");
    	}
    	
		String gotopage = "example/sportTo.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(gotopage);
		dispatcher.forward(request, response);
    	
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doprocess(request,response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doprocess(request,response);
	}


}

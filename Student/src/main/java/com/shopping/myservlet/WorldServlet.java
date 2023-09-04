package com.shopping.myservlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shopping.model.bean.World;


@WebServlet(
		urlPatterns = { "/World" }, 
		initParams = { 
				@WebInitParam(name = "tel", value = "0212345678"), 
				@WebInitParam(name = "fax", value = "0211112222")
		})
public class WorldServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String tel;
	private String fax;

    public WorldServlet() {}


	public void init(ServletConfig config) throws ServletException {
		tel = config.getInitParameter("tel");
		fax = config.getInitParameter("fax");
		
		ServletContext application = config.getServletContext();
		String description = "콜라는 코카콜라죠";
		application.setAttribute("description", description);
		
	}


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String method = request.getMethod();
		if(method.equalsIgnoreCase("get")) {
			this.doGet(request, response);
		}else {
			this.doPost(request, response);
		}
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pnum = request.getParameter("pnum");
		String name = request.getParameter("name");
		String company = request.getParameter("company");
		Integer price = Integer.parseInt(request.getParameter("price"));
		
		request.setAttribute("pnum", pnum);
		request.setAttribute("name", name);
		request.setAttribute("company", company);
		request.setAttribute("price", price);
		
		World bean = new World();
		bean.setPnum(pnum);
		bean.setName(name);
		bean.setCompany(company);
		bean.setPrice(price);
		
		request.setAttribute("bean", bean);

		HttpSession session = request.getSession();
		session.setAttribute("tel", tel);
		session.setAttribute("fax", fax);
		
		String gotopage = "example/servletTo02.jsp";

		RequestDispatcher dispatcher = request.getRequestDispatcher(gotopage);
		dispatcher.forward(request, response);
		
	}

}

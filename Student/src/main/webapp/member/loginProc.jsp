<%@page import="com.shopping.model.bean.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/bootstrap5.jsp" %>
<%@ include file="./../common/common.jsp" %>
<%
	Map<String, String> memberList = new HashMap<String, String>();
	memberList.put("admin", "1234"); //관리자
	memberList.put("hong", "1234"); //일반 사용자
%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	boolean isLogin = false;//false면 로그인 실패(기본값)
	
	boolean isIdExist = memberList.containsKey(id); //id 존재 여부
	
	if(isIdExist){ //아이디 존재하는 경우
		String dbpassword = memberList.get(id);
		if(password.equals(dbpassword)){
			isLogin = true;
		}else{
			
		}
	}else{
		
	}
	
	String message = "";
	if(isLogin){
		Member mem = new Member();
		mem.getMeid(id);
		mem.setPassword(password);
		
		session.setAttribute("loginfo",mem);
		message = "로그인 성공(" + id + ")";
		
		// sandRedirect():리다이렉션 방식으로 페이지 전환
		response.sendRedirect("./../product/prList02.jsp");
	}else{
		message = "로그인 실패";
		session.setAttribute("alertMessage","아이디/비밀번호 정보를 잘못 입력했습니다.");
		response.sendRedirect("meLoginForm02.jsp");		
	}
	out.print(message);
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	로그인 처리 페이지
</body>
</html>
<%@page import="com.shopping.utility.Paging"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<%@ include file="./../common/bootstrap5.jsp" %>
<%
	String _pageNumber = "28" ;
	String _pageSize = "10" ;
	int totalCount = 281 ;
	String url = "boList" ;
	String mode = "" ;
	String keyword = "" ;
	boolean isGrid = false ;
	
	Paging pageInfo = new Paging(_pageNumber, _pageSize, totalCount, url, mode, keyword, isGrid);
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%=pageInfo.toString()%>
	<hr/>
	<%=pageInfo.getPagingHtml()%>
	
</body>
</html>
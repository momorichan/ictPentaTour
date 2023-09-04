<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	구단이름 : ${applicationScope.map['company']}<br>
	감독 : ${applicationScope.map['name']}<br>
	지역 : ${applicationScope.map['state']}<br>
</body>
</html>
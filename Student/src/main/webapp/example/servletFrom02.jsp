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
	<form action="<%=appName%>/World" method="post">
		상품번호 : <input type="text" name="pnum" value="1"><br>
		상품명 : <input type="text" name="name" value="콜라"><br>
		제조회사 : <input type="text" name="company" value="코카콜라"><br>
		가격 : <input type="text" name="price" value="3800"><br>
		<input type="submit" value="전송">
	</form>
</body>
</html>
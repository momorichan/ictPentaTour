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
	<form action="<%=appName%>/Traffic" method="post">
		운송 수단 : 
		<select name="command">
			<option value="-">-- 항목을 선택해주세요 --
			<option value="airplane">비행기
			<option value="car" selected="selected">자동차
			<option value="horse">마차
		</select>
		<input type="submit" value="전송">
	</form>
</body>
</html>
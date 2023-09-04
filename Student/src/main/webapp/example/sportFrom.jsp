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
	<form action="<%=appName%>/Sport" method="post">
		운동 경기 선택 : 
			<select name="command">
				<option value="-">-- 항목을 선택해주세요 --
				<option value="baseball">야구
				<option value="football" selected="selected">축구
			</select>
			<input type="submit" value="전송">
	</form>
</body>
</html>
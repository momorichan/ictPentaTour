<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<style type="text/css">

</style>
</head>
<body>
	<strong class="tit mid">숙소후기</strong><br>
	<span style="color : red"> ★</span><strong>${sessionScope.averageRating}</strong> <span>/ 5</span>
	<span>&nbsp;&nbsp;&nbsp;     ${sessionScope.commentAdd}개의 여행후기</span>
</body>
</html>
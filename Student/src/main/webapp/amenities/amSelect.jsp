<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<style type="text/css">
.form-check-label{display:inline-block; width:150px; line-height:20px; }
</style>
</head>
<body>
<div>
	<c:forEach items="${requestScope.lists}" var="bean" varStatus="loop">
		<div class="form-check form-check-inline">
			<input type="checkbox" class="form-check-input" id="check${loop.index}" name="amenities" value="${bean.amid}">
      		<label class="form-check-label" for="check${loop.index}">${bean.name}</label>
		</div>
	</c:forEach>
</div>
</body>
</html>

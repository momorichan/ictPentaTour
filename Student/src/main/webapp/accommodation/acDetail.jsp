<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="./../common/common.jsp"%>
<%@ include file="./../common/bootstrap5.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.rounded-pill {
	opacity: 0.9;
}

.mode, .keyword, .col {
	margin: auto;
}
</style>

</head>
<body>
	<div class="container">
		<h2 align="center">숙소 이름</h2>
		<p align="center">숙소 설명</p>
		<table class="table table-hover">
			<thead>
			<tr align="center">편의시설</tr>
			</thead>
			<tbody>
				<c:forEach var="bean" items="${requestScope.lists}">
					<tr>
						<td><a href="<%=notWithFormTag%>roDetail&roid=${bean.roid}">
								${bean.room} </a></td>
						<td>${bean.roominfo}</td>
						<td>${bean.price}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>
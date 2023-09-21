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
		<h2>게시물 목록</h2>
		<p>사용자들이 게시한 목록을 보여 주는 페이지</p>
		<table class="table table-hover">
			<thead>
			</thead>
			<tbody>
				<tr>
					<td>${requestScope.room.roominfo}</td>
					<td>${requestScope.room.room}</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>
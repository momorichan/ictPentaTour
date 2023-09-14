<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<%@ include file="./../common/bootstrap5.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		#backButton{margin: auto;}
		.container{margin: 10px;}
	</style>
</head>
<body>
	<div class="container">
		<h2>${requestScope.bean.name}님의 회원 정보</h2>
		<table class="table">
			<thead>
			</thead>
			<tbody>
				<tr>
					<td align="center">아이디</td>
					<td>${requestScope.bean.id}</td>
				</tr>
				<tr>
					<td align="center">이름</td>
					<td>${requestScope.bean.name}</td>
				</tr>
				<tr>
					<td align="center">성별</td>
					<td>
						<c:if test="${requestScope.bean.gender eq 'male'}">
							남자
						</c:if>
						<c:if test="${requestScope.bean.gender eq 'female'}">
							여자
						</c:if>
					</td>
				</tr>
				<tr>
					<td align="center">생일</td>
					<td>${requestScope.bean.birth}</td>
				</tr>
				<tr>
					<td align="center">주소</td>
					<td>${requestScope.bean.address}</td>
				</tr>
			</tbody>
		</table>
		<div id="backButton">
			<button type="button" class="btn btn-primary" onclick="history.back();">
				돌아가기
			</button>
		</div>
	</div>
</body>
</html>
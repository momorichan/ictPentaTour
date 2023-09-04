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
		.rounded-pill{opacity: 0.9;}
	</style>
</head>
<body>
	<div class="container">
		<h2>게시물 목록</h2>
		<p>사용자들이 게시한 목록을 보여 주는 페이지</p>	
		<table class="table table-striped">
			<thead>
				<tr>
					<th>글번호</th>
					<th>작성자</th>
					<th>비밀 번호</th>
					<th>글제목</th>
					<th>글내용</th>
					<th>작성 일자</th>
					<th>조회수</th>					
				</tr>
			</thead>
			<tbody>
				<c:forEach var="bean" items="${requestScope.datalist}">
					<tr>
					<td>${bean.no}</td>
					<td>${bean.id}</td>
					<td>${bean.password}</td>
					<td>
						<c:forEach var="i" begin="1" end="${bean.depth}" step="1">
							<span class="badge rounded-pill bg-secondary">re</span>	
						</c:forEach>
						${bean.subject}
					</td>
					<td>${bean.content}</td>
					<td>${bean.regdate}</td>
					<td>
						<c:if test="${bean.readhit < 50}">
							<span class="badge rounded-pill bg-success">${bean.readhit}</span>	
						</c:if>
						<c:if test="${bean.readhit >=50}">
							<span class="badge rounded-pill bg-danger">${bean.readhit}</span>	
						</c:if>						
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- 
			ol : ordered list
			ul : unordered list
			li : list
		 -->		 
		<ul class="pagination">
			<li class="page-item">
				<a class="page-link" href="#">이전</a>				
			</li>
			<li class="page-item">
				<a class="page-link" href="#">1</a>				
			</li>
			<li class="page-item active">
				<a class="page-link" href="#">2</a>				
			</li>
			<li class="page-item">
				<a class="page-link" href="#">3</a>				
			</li>
			<li class="page-item disabled">
				<a class="page-link" href="#">4</a>				
			</li>
			<li class="page-item">
				<a class="page-link" href="#">5</a>				
			</li>
			<li class="page-item">
				<a class="page-link" href="#">다음</a>				
			</li>			
		</ul>	
	</div>	 
</body>
</html>
<%@page import="com.shopping.model.bean.Member"%>
<%@page import="com.shopping.model.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./../common/bootstrap5.jsp" %>
<%@ include file="./../common/common.jsp" %>
    
<%
	MemberDao dao = new MemberDao();
	List<Member> lists = dao.getDataList();
	
	request.setAttribute("dataList", lists);

%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h2>회원 목록</h2>
		<p>회원 목록을 보여 주는 페이지입니다.</p>		
		<table class="table table-hover">
			<!-- table-hover, table-striped, table-condensed  -->
			<thead>
				<tr class="table-primary">
					<th>아이디</th>
					<th>이름</th>
					<th>비밀 번호</th>
					<th>성별</th>
					<th>생일</th>
					<th>결혼 여부</th>
					<th>급여</th>
					<th>주소</th>
					<th>매니저</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="bean" items="${dataList}">
					<tr >
						<th>${bean.id}</th>
						<th>${bean.name}</th>
						<th>${bean.password}</th>
						<th>${bean.gender}</th>
						<th>${bean.birth}</th>
						<th>${bean.marriage}</th>
						<th>${bean.salary}</th>
						<th>${bean.address}</th>
						<th>${bean.manager}</th>
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
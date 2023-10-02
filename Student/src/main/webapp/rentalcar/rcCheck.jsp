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
	예약자 검색 페이지 
	<div class="container">
		<h2>게시물 목록</h2>
		<p>사용자들이 게시한 게시물 목록을 보여 주는 페이지입니다.</p>	
		<table class="table table-striped">
			<thead>
				<tr>
					<th>차량 번호</th>
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
						<a href="<%=notWithFormTag%>rcDetail&rcid=${bean.rcid}">
							${bean.subject}
						</a>
					</td>
					<td>
					<!-- 관리자일 경우 -->
						<c:if test="${sessionScope.loginfo.id==bean.id}">
							<a href="<%=notWithFormTag%>rcUpdate&rcid=${bean.rcid}${requestScope.pageInfo.flowParameter}">
								수정 
							</a>
						</c:if>
					</td>
				</tr>
				</c:forEach>				 
			</tbody>
		</table>
		${requestScope.pageInfo.pagingHtml} 
	</div>
</body>
</html>
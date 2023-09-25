<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./../common/bootstrap5.jsp" %>
<%@ include file="./../common/common.jsp" %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>




<div class="container">
		<h2>예약조회</h2>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>항공편</th>
					<th>항공사</th>
					<th>출발지</th>
					<th>도착지</th>					
					<th>출발시간</th>
					<th>도착시간</th>
					<th>지불금액</th>
					<th>예약취소</th>	
				</tr>
			</thead>
			<tbody>
					<tr>
					<td>${requestScope.bean.reid}</td>
					<td>${requestScope.bean.meid}</td>
					<td>${requestScope.bean.acid}</td>
					<td>${requestScope.bean.rcid}</td>
					<td>${requestScope.bean.toid}</td>
					<td>${requestScope.bean.regid}</td>
			</tbody>
		</table>
	</div>	 





</body>
</html>
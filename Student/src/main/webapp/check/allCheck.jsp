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
					<th>예약 번호</th>
					<th>아이디</th>
					<th>렌터카 번호</th>
					<th>티켓 번호</th>					
					<th>숙박 번호</th>
					<th>예매 번호</th>
					<th>출발일</th>
					<th>도착일</th>	
				</tr>
			</thead>
			<tbody>
					<tr>
					<td align="left">${requestScope.bean.reid}</td>
					<td align="left">${requestScope.bean.meid}</td>
					<td align="left"><a href="">${requestScope.bean.rcid}</a></td>
					<td align="left"><a href="">${requestScope.bean.toid}</a></td>
					<td align="left"><a href="">${requestScope.bean.mid}</a></td>
					<td align="left"><a href="<%=notWithFormTag%>airCheck&regid=${requestScope.bean.regid}">${requestScope.bean.regid}</a></td>
					<td align="left">${requestScope.bean.startdate}</td>
					<td align="left">${requestScope.bean.enddate}</td>
			</tbody>
		</table>
	</div>	 





</body>
</html>
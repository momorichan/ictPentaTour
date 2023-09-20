<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%@ include file="./../common/bootstrap5.jsp" %>
<%@ include file="./../common/common.jsp" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style type="text/css">
	</style>
	
	<script type="text/javascript">
	$(document).ready(function(){
		var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
		var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
		  return new bootstrap.Popover(popoverTriggerEl)
	});
		
	function moveList()
	{
		location.href = '<%=notWithFormTag%>airList&mode=all&keyword=';
	}
	
	
	</script>

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
					<td>${requestScope.bean.regid}</td>
					<td>${requestScope.air.fname}</td>
					<td>${requestScope.air.depart}</td>
					<td>${requestScope.air.arrive}</td>
					<td>${requestScope.air.detime}</td>
					<td>${requestScope.air.artime}</td>
					<td>${requestScope.bean.price}</td>
					<td><button type="button" class="btn cancel_btn btn-primary">예약취소</button></td>
					</tr>
			</tbody>
		</table>
	</div>	 
    
    



</body>
</html>
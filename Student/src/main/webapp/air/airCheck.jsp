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
					<th>예약취소</th>	
				</tr>
			</thead>
			<tbody>
				
				<tr>
				</tr>

				<c:forEach var="bean" items="${requestScope.datalist}"> 
					<tr>
						<td>${bean.flid}</td>
						<td>${bean.fname}</td>
						<td>${bean.depart}</td>
						<td>${bean.arrive}</td>
						<td>${bean.detime}</td>
						<td>${bean.artime}</td>						
					</tr>
					<div class="cancel">
							<button type="button" class="btn cancel_btn btn-primary">예약취소</button>
					</div>
				</c:forEach>			 
			</tbody>
		</table>
	</div>	 
    
    



</body>
</html>
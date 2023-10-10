<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

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
	
	function cancel()
	{
		location.href='<%=notWithFormTag%>airCancel';
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
					<td><fmt:formatNumber value="${requestScope.bean.price}" pattern="###,###원"> </fmt:formatNumber></td>
					

					<td align="center" valign="middle">
   					 <a href="<%=notWithFormTag%>airCancel&regid=${requestScope.bean.regid}&meid=${requestScope.bean.meid}">예약취소</a>
					</td>
			</tbody>
		</table>
	</div>	 
    
    



</body>
</html>
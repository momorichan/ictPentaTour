<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		.container{margin: 10px;}
		#backButton{margin: auto;
		position: center;}
		.emoticon{text-decoration: none;}
	</style>		
</head>
<body>
	<div class="container">
		<h2>[${requestScope.bean.rcid}]번 렌터카 정보 </h2>
		<table class="table">
			<thead></thead>
			<tbody>
				<tr>
					<td align="center">렌터카 번호</td>
					<td>						
						${requestScope.bean.rcid}						
					</td>				
				</tr>
				<tr>
					<td align="center">차 종류</td>
					<td>${requestScope.bean.carType}</td>
				</tr>
				<tr>
					<td align="center">대여 장소</td>
					<td>${requestScope.bean.startLocation}</td>
				</tr>
				<tr>
					<td align="center">반납 장소</td>
					<td>${requestScope.bean.endLocation}</td>
				</tr>
				<tr>
					<td align="center">대여료</td>
					<td>${requestScope.bean.price}</td>
				</tr>
				<tr>
					<td align="center">탑승인원</td>
					<td>${requestScope.bean.passengers}</td>
				</tr>
			</tbody>
		</table>	
	</div>
</body>
</html>
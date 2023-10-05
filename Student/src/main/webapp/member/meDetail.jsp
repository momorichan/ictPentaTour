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
.container {
	width: 1224px;
	height: 100%;
	display: block;
	margin-left: auto;
	margin-right: auto;
}
.row {
	width: 100%;
	height:40px;
	display: flex;
	margin:auto;
}
.left, .right {
	font-size: 18px;
	display: flex;
}
.left {
	width:20%;
	justify-content: left;
}
.right {
	width:80%;
}
#backButton {
	margin: auto;
}

</style>
</head>
<body>
	<div class="container">
		<h2>${requestScope.bean.name}님의 회원 정보</h2>
		<div class="row">
			<span class="left">회원 아이디</span>
			<span class="right">${requestScope.bean.meid}</span>
		</div>
		<div class="row">
			<span class="left">회원 이름</span>
			<span class="right">${requestScope.bean.name}</span>
		</div>
		<div class="row">
			<span class="left">성별</span>
			<span class="right">${requestScope.bean.gender}</span>
		</div>
		<div class="row">
			<span class="left">생년월일</span>
			<span class="right">${requestScope.bean.birth}</span>
		</div>
		<div class="row">
			<span class="left">휴대폰번호</span>
			<span class="right">${requestScope.bean.phone}</span>
		</div>
		<div class="row">
			<span class="left">주소</span>
			<span class="right">${requestScope.bean.address}</span>
		</div>
		<div class="row">
			<span class="left"></span>
			<span class="right"></span>
		</div>
		<div class="row">
			<span class="left"></span>
			<span class="right"></span>
		</div>
		<div id="backButton">
			<button type="button" class="btn btn-primary" onclick="history.back();">
				돌아 가기 
			</button>
		</div>
	</div>
</body>
</html>
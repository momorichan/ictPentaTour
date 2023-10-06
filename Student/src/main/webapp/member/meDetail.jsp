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
	width:48%;
	margin-right:2%;
	justify-content: right;
}
.left-text {
	width:100px;
	text-align: left;
}
.right {
	width:48%;
	margin-left:2%;
}
#backButton {
	margin: auto;
	display: flex;
	justify-content: center;
}
h2 {
	text-align: center;
}

</style>
</head>
<body>
	<div class="container">
	<h2>${requestScope.bean.name}님의 회원 정보</h2>
		<br>
		<div class="row">
			<div class="left">
				<span class="left-text">회원 아이디</span>
			</div>
			<span class="right">${requestScope.bean.meid}</span>
		</div>
		<div class="row">
			<div class="left">
				<span class="left-text">회원 이름</span>
			</div>
			<span class="right">${requestScope.bean.name}</span>
		</div>
		<div class="row">
			<div class="left">
				<span class="left-text">성별</span>
			</div>
			<span class="right">${requestScope.bean.gender}</span>
		</div>
		<div class="row">
			<div class="left">
				<span class="left-text">생년월일</span>
			</div>
			<span class="right">${requestScope.bean.birth}</span>
		</div>
		<div class="row">
			<div class="left">
				<span class="left-text">휴대폰번호</span>
			</div>
			<span class="right">${requestScope.bean.phone}</span>
		</div>
		<div class="row">
			<div class="left">
				<span class="left-text">주소</span>
			</div>
			<span class="right">${requestScope.bean.address}</span>
		</div>
		<div class="row">
			<div class="left">
				<span class="left-text">회원 유형</span>
			</div>
			<span class="right">${requestScope.role}</span>
		</div>
		<br>
		<div id="backButton">
			<button type="button" class="btn btn-primary" onclick="history.back();">
				돌아 가기 
			</button>
		</div>
	</div>
</body>
</html>
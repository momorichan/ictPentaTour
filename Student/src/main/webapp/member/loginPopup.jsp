<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/bootstrap5.jsp"%>
<%
	String appName = request.getContextPath();
	String mappingName = "/Shopping"; //in FrontController.java file
	
	//form 태그에서 사용할 변수
	String withFormTag = appName + mappingName;
	
	//form 태그가 아닌 영역에서 사용할 변수
	String notWithFormTag = appName + mappingName + "?command=";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {	
		var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
		var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
			return new bootstrap.Tooltip(tooltipTriggerEl)
		});
		
//	 	var meid = document.getElementById('meid').value
		var id = document.getElementById('id').value
		var password = document.getElementById('password').value
		
	});

	
</script>
<style type="text/css">
html, body {
	width:600px !important;
	height:640px !important;
}
.btn-div {
	margin-top:30px;
}
.login-btn {
	padding: 7px 12px;
	background-color:#7fb1bf;
	border-radius: 10px 10px 10px 10px;
	color:white;
	border: 1px solid rgba(0,0,0,0.21);
	border-bottom-color: rgba(0,0,0,0.34);
	text-shadow:0 1px 0 rgba(0,0,0,0.15);
	box-shadow: 0 1px 0 rgba(255,255,255,0.34) inset, 
	            0 2px 0 -1px rgba(0,0,0,0.13), 
	            0 3px 0 -1px rgba(0,0,0,0.08), 
	            0 3px 13px -1px rgba(0,0,0,0.21);
}
.login-btn:hover {
	padding: 7px 12px;
	background-color:#7fb1bf;
	border-radius: 10px 10px 10px 10px;
	color:white;
	border: 1px solid rgba(0,0,0,0.21);
	border-bottom-color: rgba(0,0,0,0.34);
	text-shadow:0 1px 0 rgba(0,0,0,0.15);
	box-shadow: 0 1px 0 rgba(255,255,255,0.34) inset, 
	            0 2px 0 -1px rgba(0,0,0,0.13), 
	            0 3px 0 -1px rgba(0,0,0,0.08), 
	            0 3px 13px -1px rgba(0,0,0,0.21);
	filter:brightness(1.1);
}
.create-btn {
	padding: 7px 12px;
	background-color:#7fccde;
	border-radius: 10px 10px 10px 10px;
	text-decoration: none;
	color:white;
	border: 1px solid rgba(0,0,0,0.21);
	border-bottom-color: rgba(0,0,0,0.34);
	text-shadow:0 1px 0 rgba(0,0,0,0.15);
	box-shadow: 0 1px 0 rgba(255,255,255,0.34) inset, 
	            0 2px 0 -1px rgba(0,0,0,0.13), 
	            0 3px 0 -1px rgba(0,0,0,0.08), 
	            0 3px 13px -1px rgba(0,0,0,0.21);
}
.create-btn:hover {
	padding: 7px 12px;
	background-color:#7fccde;
	border-radius: 10px 10px 10px 10px;
	text-decoration: none;
	color:white;
	border: 1px solid rgba(0,0,0,0.21);
	border-bottom-color: rgba(0,0,0,0.34);
	text-shadow:0 1px 0 rgba(0,0,0,0.15);
	box-shadow: 0 1px 0 rgba(255,255,255,0.34) inset, 
	            0 2px 0 -1px rgba(0,0,0,0.13), 
	            0 3px 0 -1px rgba(0,0,0,0.08), 
	            0 3px 13px -1px rgba(0,0,0,0.21);
	filter:brightness(1.1);
}
</style>
</head>
<body>
	<br/>
	<div class="container">
		<h2>로그인 페이지</h2>
		<p>로그인을 위한 페이지입니다.</p>
		<form action="<%=withFormTag%>" method="post" id="form">
			<input type="hidden" name="command" value="mePopup">
			<div>
				<label for="meid" class="form-label">아이디 :</label> 
				<input type="text" class="form-control" id="id" name="id" value="admin"				
					placeholder="아이디를 입력해 주세요."
					data-bs-toggle="tooltip" title="아이디는 3글자 이상 10글자 이하이어야 합니다."
					data-bs-placement="top">
			</div>
			<div>
				<label for="password" class="form-label">비밀 번호 :</label> 
				<input class="form-control" type="password" id="password" name="password" value="1234">
			</div>
			<div class="btn-div">
				<button type="submit" class="login-btn">로그인</button> 
				<a type="button" href="" class="create-btn" onclick="create()">회원 가입</a>
			</div>					
		</form>
	</div>
</body>
</html>
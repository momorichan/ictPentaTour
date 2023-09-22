<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./../common/bootstrap5.jsp" %>
<%@ include file="./../common/common.jsp" %>
    
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
		});
	</script>
	<style type="text/css">
		.bottom_button{margin-top: 5px;} /* 버튼과 입력 양식 약간 간격 띄우기 */
	</style>	
</head>
<body>
	<br/>
	<div class="container">
		<h2>로그인 페이지</h2>
		<p>로그인을 위한 페이지입니다.</p>
		<form action="loginProc.jsp" method="post"> 
			<div> 
				<label for="id" class="form-label">아이디 :</label> 
				<input type="text" class="form-control" id="id" name="id" 
					placeholder="아이디를 입력해 주세요."
					data-bs-toggle="tooltip" title="아이디는 3글자 이상 10글자 이하이어야 합니다."
					data-bs-placement="top">
			</div>
			<div>
				<label for="password" class="form-label">비밀 번호 :</label> 
				<input class="form-control" type="password" id="password" name="password">
			</div>			
			<div class="bottom_button">
				<!-- contextual class : btn-primary, btn-info, btn-danger -->
				<button type="submit" class="btn btn-primary">로그인</button> 
				<a type="button" href="meInsertForm.jsp" class="btn btn-info">회원 가입</a>
			</div>								
		</form>
	</div>
</body>
</html>
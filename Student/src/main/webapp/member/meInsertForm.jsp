<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./../common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript">
  		$(document).ready(function(){
  	  		/* $('#birth').datepicker(); */
  	  		$('#birth').datepicker({dateFormat: "yy/mm/dd"});   	
  		});
  		
  		function validChack(){/* form validation chack */
  			var regex ;/* 정규 표현식 */
  			var result;
  			

  			
  			var id = $('#id').val();
  			if(id.length<4||id.length>10){
  				swal('아이디는 4자리 이상 10자리 이하입니다.');
  				$('#id').focus();
  				return false; /* false면 이벤트 전파 방지 */
  			}
  		
  			var name = $('#name').val();
  			if(name.length<2||name.length>15){
  				swal('이름은 2자리 이상 15자리 이하입니다.');
  				$('#name').focus();
  				return false; 
  			}  			
  			
  			var password = $('#password').val();
  			if(password.length<5||password.length>12){
  				swal('비밀번호는 5자리 이상 12자리 이하입니다.');
  				$('#password').focus();
  				return false; 
  			}    	

  			regex = /^[a-z]\S{4,11}$/;/* 정규 표현식 */
  			result = regex.test(password);
  			if(result == false){
  				swal('비밀번호의 첫 글자는 반드시 소문자여야만 합니다.');
  				$('#password').focus();
  				return false; 
 			}
  			
			if(password.indexOf('@') <= 0 && password.indexOf('#') <= 0 && password.indexOf('$') <= 0 ){
				swal('특수 문자 @#$ 중에 최소 1개가 포함이 되어야 합니다.')
				$('#password').focus();
  				return false; 
			}
			
			var radioList = $('input[type="radio"]:checked');
			if(radioList.length == 0){
				swal('성별은 반드시 선택이 되어야 합니다.');
				return false;
			}
			
			var birth = $('#birth').val();
			regex = /^\d{4}\/[01]\d{1}\/[0123]\d{1}$/;
			result = regex.test(birth);
  			if(result==false){
  				swal('생일은 반드시 yyyy/mm/dd 형식으로 입력해주세요.');
  				return false;
  			}
  		}
  		
  	</script>
  	<style type="text/css">
  		/* box model에 대한 공부가 필요합니다. */
  		.container{
  			width: 1200px;
  			margin-top: 10px;
  		}
  		.input-group{
  			margin: 7px;
  		}
  		.input-group-text{
  			width:96px;
  			display: block;
  			margin-left: auto;
  			margin-right: auto;
  		}
  		#buttonset{
  			margin-top: 15px;
  		}
  		
  	</style>
</head>
<body>
	<div class="container">
		<h2>회원 가입</h2>
		<p>회원 가입하는 페이지 입니다.</p>
		<form action="<%=withFormTag%>" method="post">
			<input type="hidden" name = "command" value="meInsert">
			<div class="input-group">
				<span class="input-group-text">아이디</span>
				<input class="form-control" type="text" id="meid" name="meid" >				
			</div>
			<div class="input-group">
				<span class="input-group-text">이름</span>
				<input class="form-control" type="text" id="name" name="name" >				
			</div>
			<div class="input-group">
				<span class="input-group-text">비밀 번호</span>
				<input class="form-control" type="password" id="password" name="password">				
			</div>
			
			<div class="input-group">
				<span class="input-group-text">성별</span>
				<div class="form-control">
					<label class="radio-inline radio_gender"> 
						&nbsp;<input type="radio" id="gender1" name="gender" value="male">남자
					</label>
					<label class="radio-inline radio_gender"> 
						&nbsp;<input type="radio" id="gender2" name="gender" value="female">여자
					</label>
				</div>
			</div>
			
			<div class="input-group">
				<span class="input-group-text">생일</span>
				<input class="form-control" type="datetime" id="birth" name="birth">				
			</div>
			<div class="input-group">
				<span class="input-group-text">결혼 여부</span>
				<input class="form-control" type="text" id="marriage" name="marriage">				
			</div>				
			<div class="input-group">
				<span class="input-group-text">급여</span>
				<input class="form-control" type="number" id="salary" name="salary">				
			</div>
			<div class="input-group">
				<span class="input-group-text">주소</span>
				<input class="form-control" type="text" id="address" name="address">				
			</div>
			<div class="input-group">
				<span class="input-group-text">매니저</span>
				<input class="form-control" type="text" id="manager" name="manager">				
			</div>			
			<div id="buttonset" class="input-group">
				<button type="submit" class="btn btn-primary rounded" onclick="return validChack();">
				등록
				</button>
				&nbsp;&nbsp;&nbsp;
				<button type="reset" class="btn btn-primary rounded">초기화</button>				
			</div>
		</form>
	</div>
</body>
</html>
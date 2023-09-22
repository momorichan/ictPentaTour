<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.input-group-text{
		width:150px;
		text-align: center;
	}
	.side-bar-div {
		display: none;
	}
</style>
<script type="text/javascript">
	function validationcheck(){
		var location = $('#location').val();
		if(location.length < 1){
			alert('지역은 필수 입력 사항입니다.')
			$('#location').focus();
			return false;
		};
		
		var location = $('#tname').val();
		if(location.length < 1){
			alert('티켓 이름은 필수 입력 사항입니다.')
			$('#tname').focus();
			return false;
		};
		
		var location = $('#tprice').val();
		if(location.length < 1){
			alert('티켓 가격은 필수 입력 사항입니다.')
			$('#tprice').focus();
			return false;
		};
		
		var location = $('#tname').val();
		if(location.length < 1){
			alert('티켓 이름은 필수 입력 사항입니다.')
			$('#tname').focus();
			return false;
		};
		
		var location = $('#tname').val();
		if(location.length < 1){
			alert('티켓 이름은 필수 입력 사항입니다.')
			$('#tname').focus();
			return false;
		};
		
		var location = $('#tname').val();
		if(location.length < 1){
			alert('티켓 이름은 필수 입력 사항입니다.')
			$('#tname').focus();
			return false;
		};
		
		
	};
</script>
</head>
<body>
	<div class="container">
		<form action="<%=withFormTag%>" method="post" enctype="multipart/form-data">
		<input type="hidden" name="command" value="tourInsert">
			<div class="input-group">
				<span class="input-group-text">지역</span>
				<input class="form-control" type="text" id="location" name="location">
			</div>
			<div class="input-group">
				<span class="input-group-text">티켓 이름</span>
				<input class="form-control" type="text" id="tname" name="tname">
			</div>
			<div class="input-group">
				<span class="input-group-text">티켓 가격</span>
				<input class="form-control" type="text" id="tprice" name="tprice">
			</div>
			<div class="input-group">
				<span class="input-group-text">사용 가능 일자</span>
				<input class="form-control" type="date" id="tusedate" name="tusedate">
			</div>
			<div class="input-group">
				<span class="input-group-text">티켓 유효 기간(일)</span>
				<input class="form-control" type="number" id="texdate" name="texdate" value="0">
			</div>
			<div class="input-group">
				<span class="input-group-text">사용가능 연령</span>
				<input class="form-control" type="number" id="tage" name="tage" value="0">
			</div>
			<div class="input-group">
				<span class="input-group-text">티켓 설명</span>
				<textarea class="form-control" id="tcontent" name="tcontent" rows="15" cols="80" style="resize:none;"></textarea>
			</div>
			<div class="input-group">
				<span class="input-group-text">무료 연령</span>
				<input class="form-control" type="number" id="tfreeage" name="tfreeage" value="0">
			</div>
			<div class="input-group">
				<span class="input-group-text">이미지1</span>
				<input class="form-control" type="file" id="timage01" name="timage01">
			</div>
			<div class="input-group">
				<span class="input-group-text">이미지2</span>
				<input class="form-control" type="file" id="timage02" name="timage02">
			</div>
			<div class="input-group">
				<span class="input-group-text">이미지3</span>
				<input class="form-control" type="file" id="timage03" name="timage03">
			</div>
			<button type="submit" class="btn btn-outline-primary" onclick="return validationcheck();">등록</button>
		</form>
	</div>
</body>
</html>
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
	.preview-image {
		width:100%;
		height:100%;
	}
	.preview {
		width:215px;
		height:200px;
		position:relative;
	}
	.preview-div {
		display: flex;
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
	
	$(document).ready(function(){
		var timage01 = "";
		var timage02 = "";
		var timage03 = "";
		
		$('#timage01').on('change', function(){
			target = document.getElementById('timage01');
			
			if(window.FileReader){
				timage01 = target.files[0].name;
				$('.timage01-preview').html('<img class="preview-image" src="/Student/upload/' + timage01 + '">');
			}
		});
		$('#timage02').on('change', function(){
			target = document.getElementById('timage02');
			
			if(window.FileReader){
				timage02 = target.files[0].name;
				$('.timage02-preview').html('<img class="preview-image" src="/Student/upload/' + timage02 + '">');
			}
		});
		$('#timage03').on('change', function(){
			target = document.getElementById('timage03');
			
			if(window.FileReader){
				timage03 = target.files[0].name;
				$('.timage03-preview').html('<img class="preview-image" src="/Student/upload/' + timage03 + '">');
			}
		});
	});
</script>
</head>
<body>
	<div class="container">
		<form action="<%=withFormTag%>" method="post" enctype="multipart/form-data">
		<input type="hidden" name="command" value="tourUpdate">
		<input type="hidden" name="toid" value=${sessionScope.bean.toid }>
			<div class="input-group">
				<span class="input-group-text">지역</span>
				<input class="form-control" type="text" id="location" name="location" value=${sessionScope.bean.location }>
			</div>
			<div class="input-group">
				<span class="input-group-text">티켓 이름</span>
				<input class="form-control" type="text" id="tname" name="tname" value=${sessionScope.bean.tname }>
			</div>
			<div class="input-group">
				<span class="input-group-text">티켓 가격</span>
				<input class="form-control" type="text" id="tprice" name="tprice" value=${sessionScope.bean.tprice }>
			</div>
			<div class="input-group">
				<span class="input-group-text">사용 가능 일자</span>
				<input class="form-control" type="date" id="tusedate" name="tusedate" value=${sessionScope.bean.tusedate }>
			</div>
			<div class="input-group">
				<span class="input-group-text">티켓 유효 기간(일)</span>
				<input class="form-control" type="number" id="texdate" name="texdate" value=${sessionScope.bean.texdate }>
			</div>
			<div class="input-group">
				<span class="input-group-text">사용가능 연령</span>
				<input class="form-control" type="number" id="tage" name="tage" value=${sessionScope.bean.tage }>
			</div>
			<div class="input-group">
				<span class="input-group-text">티켓 설명</span>
				<textarea class="form-control" id="tcontent" name="tcontent" rows="15" cols="80" style="resize:none;">${sessionScope.bean.tcontent }</textarea>
			</div>
			<div class="input-group">
				<span class="input-group-text">무료 연령</span>
				<input class="form-control" type="number" id="tfreeage" name="tfreeage" value=${sessionScope.bean.tfreeage }>
			</div>
			<div class="input-group">
				<span class="input-group-text">이미지1</span>
				<input class="form-control" type="file" id="timage01" name="timage01">
				<input type="hidden" name="timage01before"  value=${sessionScope.bean.timage01 }>
			</div>
			<div class="input-group">
				<span class="input-group-text">이미지2</span>
				<input class="form-control" type="file" id="timage02" name="timage02">
				<input type="hidden" name="timage02before" value=${sessionScope.bean.timage02 }>
			</div>
			<div class="input-group">
				<span class="input-group-text">이미지3</span>
				<input class="form-control" type="file" id="timage03" name="timage03">
				<input type="hidden" name="timage03before" value=${sessionScope.bean.timage03 }>
			</div>
			<div class="preview-div">
				<span class="timage01-preview preview"></span>
				<span class="timage02-preview preview"></span>
				<span class="timage03-preview preview"></span>
			</div>
			<button type="submit" class="btn btn-outline-primary" onclick="return validationcheck();">등록</button>
		</form>
	</div>
</body>
</html>
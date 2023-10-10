<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./../common/bootstrap5.jsp" %>
<%@ include file="./../common/common.jsp" %>
        
<!DOCTYPE html>
<html>
<head>
<link href="./../css/starscore.css" rel="stylesheet"/>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	  	<style type="text/css">
  		/* box model에 대한 공부가 필요합니다. */
  		#trid{display: none; visibility: hidden;}
  		.container{margin-top: 10px;}
  		.input-group{margin: 7px;}
  		.input-group-text{
  			display: block;
  			margin-left: auto;
  			margin-right: auto;
  		}
  		#buttonset{margin-top: 15px;}
  		#boardNo{display: none; visibility: hidden;}
  	</style>
  	<script type="text/javascript">
		$(document).ready(function(){
  	  		$('#regdate').datepicker({dateFormat: "yy/mm/dd"});   	
  		});
  	
  	function validCheck(){

		var content = $('#content').val();
		if(content.length<5||content.length>30){
			swal('글 내용은 5글자 이상 30글자 이하이어야 합니다.');
			return false;
		}
  	}
  	</script>
</head>
<body>
	<div class="container">
		<h2>리뷰 등록</h2>
		<form action="<%=withFormTag%>" method="post" name="myform" id="myform"  enctype="multipart/form-data">
		<input type="hidden" name="command" value="rvInsert">
		<input type="hidden" name="acid" value="${requestScope.acid }">
		<input type="hidden" name="toid" value="${requestScope.toid }">
			<div id = "trid" class="input-group">
				<span class="input-group-text col-md-2">리뷰 번호</span> 
				<input id="trid" name="trid" type="number" class="form-control" placeholder="">
			</div> 
			<div class="input-group">
				<span class="input-group-text col-md-2">작성자</span> 
				<input type="hidden" name="meid" value="${sessionScope.loginfo.meid}">
				<c:set var="userInfo" value="${sessionScope.loginfo.name}(${sessionScope.loginfo.meid})"/>	
				<input id="fakeid" name="fakeid" disabled="disabled" 
					type="text" class="form-control" placeholder="" value="${userInfo}">
			</div>
	<fieldset>
		<span class="text-bold">별점을 선택해주세요</span>
		<input type="radio" name="rating" value="5" id="rate1" checked="checked"><label
			for="rate1">★</label>
		<input type="radio" name="rating" value="4" id="rate2"><label
			for="rate2">★</label>
		<input type="radio" name="rating" value="3" id="rate3"><label
			for="rate3">★</label>
		<input type="radio" name="rating" value="2" id="rate4"><label
			for="rate4">★</label>
		<input type="radio" name="rating" value="1" id="rate5"><label
			for="rate5">★</label>
	</fieldset>
	<div>
		<textarea class="col-auto form-control" type="text" name="content"
				  placeholder=""></textarea>
	</div>
			<div id="buttonset" class="input-group">
				<button type="submit" class="btn btn-primary btn-lg" onclick="return validCheck();">등록</button>
				&nbsp;&nbsp;&nbsp;
				<button type="reset" class="btn btn-secondary btn-lg">초기화</button>
			</div>
		</form>
	</div>

</body>
</html>
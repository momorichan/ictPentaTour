<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="./../common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script type="text/javascript">
function amenitiesForm(){ 
	location.href = '<%=notWithFormTag%>amInsert';
	}

function selectAmenities(){
	$('#amenities').empty();
	//$.ajax() 함수를 이용하여 데이터 보여주기 
	$.ajax({
		url:'<%=notWithFormTag%>amSelect',
			type : 'get',
			//dataType:'json', 
			dataType : 'html',
			success : function(result) {
				$('#amenities').html(result);
			}
		});
	}
$(document).ready(function() {
		selectAmenities();
});
</script>
<style type="text/css">
.container {
	margin-top: 10px;
}

.input-group {
	margin: 7px;
}

.input-group-text {
	display: block;
	margin-left: auto;
	margin-right: auto;
}

.input-group-right {
	display: block;
	margin-left: auto;
	margin-right: auto;
	float: right;
}

#invisible {
	display: none;
	visibility: hidden;
}
img{
	max-width: 100%;
	width: 300px;
    height: auto;
}
</style>

</head>
<body>
	<div class="container">
		<h2>숙소 등록</h2>
		<p>숙소를 등록하는 페이지입니다.</p>

		<form action="<%=withFormTag%>" method="post">
			<input type="hidden" name="command" value="acInsert">
			<div id="invisible" class="input-group">
				<span class="input-group-text col-md-2">예약 번호</span> <input
					id="acid" name="acid" type="number" class="form-control">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">숙소 이름</span> <input
					id="name" name="name" type="text" class="form-control"
					>
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">숙소 주소</span> <input
					id="address" name="address" type="text" class="form-control"
					placeholder="">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">도시</span> <input
					id="city" name="city" type="text" class="form-control"
					placeholder="">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">국제</span> 
				<input class="form-check-input" type="radio" name="global" id="국내">
			    <label class="form-check-label" for="국내">
			      국내
			    </label>
			    <input class="form-check-input" type="radio" name="global" id="해외" checked>
			    <label class="form-check-label" for="해외">
			      해외
			  </label>
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">설명</span> <input
					id="description" name="description" type="text"
					class="form-control" placeholder="">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">이미지01</span> <input
					id="image01" name="image01" type="file" class="form-control"
					placeholder="">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">이미지02</span> <input
					id="image02" name="image02" type="file" class="form-control"
					placeholder="">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">이미지03</span> <input
					id="image03" name="image03" type="file" class="form-control"
					placeholder="">
			</div>		
			<div class="input-group">
					<span class="input-group-text col-md-2 " >편의시설 선택</span>
					<span type="button" class="btn btn-info form-control-sm" onclick="amenitiesForm();">편의시설 추가하기</span>
			</div>
			<div class="input-group">
					<span id="amenities"></span>
			</div>							
			<div id="buttonset" class="input-group">
				<button type="submit" class="btn btn-primary btn-lg">등록</button>
				&nbsp;&nbsp;&nbsp;
				<button type="reset" class="btn btn-secondary btn-lg">초기화</button>
			</div>
		</form>
	</div>
	
	
	
	
	

	
	
	
	
	
	
	
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="./../common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script type="text/javascript">
	
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

#acNo {
	display: none;
	visibility: hidden;
}
#roomNo {
	display: none;
	visibility: hidden;
}

</style>
<script type="text/javascript">
/* 이전에 선택했던 카테고리 정보가 자동으로 선택되어 있도록 합니다. */
var breakfast = '${requestScope.bean.breakfast}';
/* alert(category); */

var optionList = $('#breakfast option');
optionList.each(function(){
	if($(this).val() == breakfast){
		$('option[value="' + breakfast + '"').attr('selected', true);
	}
});
</script>
</head>
<body>
	<div class="container">
		<h2>방 등록</h2>
		<p>방을 등록하는 페이지입니다.</p>

		<form action="<%=withFormTag%>" method="post">
			<input type="hidden" name="command" value="roUpdate">
			<div id="roomNo" class="input-group">
				<span class="input-group-text col-md-2">숙소 번호</span> <input
					id="acid" name="acid" type="number" class="form-control"
					value="${requestScope.bean.acid}">
			</div>
			<div id="roomNo" class="input-group">
				<span class="input-group-text col-md-2">방 번호</span> <input
					id="roid" name="roid" type="number" class="form-control"
					value="${requestScope.bean.roid}">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">객실 이름</span> <input
					id="room" name="room" type="text" class="form-control"
					value="${requestScope.bean.room}">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">객실 정보</span> <input
					id="roominfo" name="roominfo" type="text" class="form-control"
					value="${requestScope.bean.roominfo}">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">1박 가격</span> <input
					id="price" name="price" type="text" class="form-control"
					value="${requestScope.bean.price}">
			</div>
			<div class="input-group">
					<span class="input-group-text">조식 포함 여부</span>
					<select class="form-select form-select-lg" id="breakfast" name="breakfast">
						  <option value="-">--선택--</option>
						  <option value="포함">포함</option>
						  <option value="미포함">미포함</option>
					</select>
				</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">수용 인원</span> <input
					id="guests" name="guests" type="text" class="form-control"
					value="${requestScope.bean.guests}">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">이미지01</span> 
				<input id="image01" name="newimage01" type="file" class="form-control">
				<input type="hidden" name="preimage01"  value=${requestScope.bean.image01 }>
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">이미지02</span> 
				<input id="image02" name="newimage02" type="file" class="form-control">
				<input type="hidden" name="preimage02"  value=${requestScope.bean.image02 }>				
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">이미지03</span> 
				<input id="image03" name="newimage03" type="file" class="form-control">
				<input type="hidden" name="preimage03"  value=${requestScope.bean.image03 }>				
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
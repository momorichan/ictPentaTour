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
img{
	max-width: 100%;
	width: 300px;
    height: auto;
}
</style>
<script type="text/javascript">
	/* 이전에 선택했던 카테고리 정보가 자동으로 선택되어 있도록 합니다. */
	var breakfast = '${requestScope.bean.breakfast}';
	/* alert(category); */

	var optionList = $('#breakfast option');
	optionList.each(function() {
		if ($(this).val() == breakfast) {
			$('option[value="' + breakfast + '"').attr('selected', true);
		}
	});
</script>
</head>
<body>
	<div class="container">
		<h2>방 삭제</h2>
		<h1>정말로 방을 삭제하시겠습니까?</h1>

		<form action="<%=withFormTag%>" method="post">
			<input type="hidden" name="command" value="roDelete">
			<div id="roomNo" class="input-group">
				<span class="input-group-text col-md-2">숙소 번호</span> <input
					id="acid" name="acid" type="number" class="form-control"
					value="${requestScope.bean.acid}">
			</div>
			<div id="roomNo" class="input-group">
				<span class="input-group-text col-md-2">방 번호</span> <input id="roid"
					name="roid" type="number" class="form-control"
					value="${requestScope.bean.roid}">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">객실 이름</span> <input
					id="room" name="room" type="text" class="form-control"
					value="${requestScope.bean.room}" disabled="disabled">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">객실 정보</span> <input
					id="roominfo" name="roominfo" type="text" class="form-control"
					value="${requestScope.bean.roominfo}" disabled="disabled">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">1박 가격</span> <input
					id="price" name="price" type="text" class="form-control"
					value="${requestScope.bean.price}" disabled="disabled">
			</div>
			<div class="input-group">
				<span class="input-group-text">조식 포함 여부</span> <select
					class="form-select form-select-lg" id="breakfast" name="breakfast"
					disabled="disabled">
					<option value="-">--선택--</option>
					<option value="포함">포함</option>
					<option value="미포함">미포함</option>
				</select>
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">수용 인원</span> <input
					id="guests" name="guests" type="text" class="form-control"
					value="${requestScope.bean.guests}" disabled="disabled">
			</div>
			<table>
				<thead>
					<tr>
						<td><p>이미지 01</p></td>
						<td><p>이미지 02</p></td>
						<td><p>이미지 03</p></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><img
							src="${pageContext.request.contextPath}/upload/${requestScope.bean.image01}"
							data-src="" alt=""></td>
						<td><img
							src="${pageContext.request.contextPath}/upload/${requestScope.bean.image02}"
							data-src="" alt=""></td>
						<td><img
							src="${pageContext.request.contextPath}/upload/${requestScope.bean.image03}"
							data-src="" alt=""></td>
					</tr>
				</tbody>
			</table>
			<div id="buttonset" class="input-group">
				<button type="submit" class="btn btn-danger btn-lg">삭제</button>
			</div>
		</form>
	</div>
</body>
</html>
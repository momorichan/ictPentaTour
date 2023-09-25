<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="./../common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script type="text/javascript">
function writeForm(){ 
	location.href = '<%=notWithFormTag%>roInsert';
	}
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

#boardNo {
	display: none;
	visibility: hidden;
}
</style>

</head>
<body>
	<div class="container">
		<h2>숙소 등록</h2>
		<p>숙소를 등록하는 페이지입니다.</p>

		<form action="<%=withFormTag%>" method="post">
			<input type="hidden" name="command" value="acInsert">
			<div id="boardNo" class="input-group">
				<span class="input-group-text col-md-2">예약 번호</span> <input
					id="acid" name="acid" type="number" class="form-control">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">숙소 이름</span> <input
					id="name" name="name" type="text" class="form-control"
					value="${empty sessionScope.temp ? '' : sessionScope.temp.name}">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">숙소 주소</span> <input
					id="address" name="address" type="text" class="form-control"
					placeholder="">
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
			<c:if test="${not empty requestScope.temp}">
				<c:forEach items="${requestScope.roomlist}" var="temp">
					${temp.room}
				</c:forEach>
			</c:if>
			<div class="input-group">
				<span type="button" class="btn btn-info form-control-sm"
					onclick="writeForm();">방 등록</span>
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
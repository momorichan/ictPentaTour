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

</head>
<body>
	<div class="container">
		<h2>편의시설 등록</h2>
		<p>편의시설을 등록하는 페이지입니다.</p>

		<form action="<%=withFormTag%>" method="post">
			<input type="hidden" name="command" value="amInsert">
			<div class="input-group">
				<span class="input-group-text col-md-2">편의시설 이름</span> <input
					id="name" name="name" type="text" class="form-control"
					placeholder="">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">편의시설 설명</span> <input
					id="description" name="description" type="text" class="form-control"
					placeholder="">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">이미지</span> <input
					id="image" name="image" type="file" class="form-control"
					placeholder="">
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
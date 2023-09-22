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
</script>
</head>
<body>
	<div class="container">
		<form action="<%=withFormTag%>" method="post" enctype="multipart/form-data">
		<input type="hidden" name="command" value="tourImage">
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
			<div class="input-group">
				<span class="input-group-text">이미지4</span>
				<input class="form-control" type="file" id="timage04" name="timage04">
			</div>
			<div class="input-group">
				<span class="input-group-text">이미지5</span>
				<input class="form-control" type="file" id="timage05" name="timage05">
			</div>
			<div class="input-group">
				<span class="input-group-text">이미지6</span>
				<input class="form-control" type="file" id="timage06" name="timage06">
			</div>
			<div class="input-group">
				<span class="input-group-text">이미지7</span>
				<input class="form-control" type="file" id="timage07" name="timage07">
			</div>
			<button type="submit" class="btn btn-outline-primary" onclick="return validationcheck();">등록</button>
		</form>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<style type="text/css">
/* 이미지 컨테이너 스타일 */
.image-container {
	width: auto;
	height: 500px;
    background-color: black; /* 검은 배경 색상 */
    overflow: hidden; /* 오버플로우 숨김 */
}
</style>
</head>
<body>
	<!-- Modal Header -->
	<div class="modal-header">
		<h2>객실 정보</h2>
		<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	</div>

	<!-- Modal body -->
	<div class="modal-body">
		<div align="center">
		<h4> ${requestScope.room.room}</h4>
		</div>
		<div id="demo" class="carousel slide" data-bs-ride="carousel">

			<!-- Indicators/dots -->
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#demo" data-bs-slide-to="0"
					class="active"></button>
				<button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
				<button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
			</div>

			<!-- The slideshow/carousel -->
			<div class="carousel-inner image-container">
				<div class="carousel-item active">
					<img
						src="${pageContext.request.contextPath}/upload/${requestScope.room.image01}"
						alt="image01" class="d-block w-100">
				</div>
				<div class="carousel-item">
					<img
						src="${pageContext.request.contextPath}/upload/${requestScope.room.image02}"
						alt="image02" class="d-block w-100">
				</div>
				<div class="carousel-item">
					<img
						src="${pageContext.request.contextPath}/upload/${requestScope.room.image03}"
						alt="image03" class="d-block w-100">
				</div>
			</div>

			<!-- Left and right controls/icons -->
			<button class="carousel-control-prev" type="button"
				data-bs-target="#demo" data-bs-slide="prev">
				<span class="carousel-control-prev-icon"></span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#demo" data-bs-slide="next">
				<span class="carousel-control-next-icon"></span>
			</button>
		</div>
		<div align="center">
		${requestScope.room.roominfo}
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		</div>
	</div>

	<!-- Modal footer -->
	<div class="modal-footer">
		각종 세부 정보
	</div>
</body>
</html>
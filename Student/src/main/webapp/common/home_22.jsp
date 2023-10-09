<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
.active{
	width:100%;
	max-height: 806px;
	max-width:1224px;
	position: relative;
}
.carousel {
	margin-left:auto;
	margin-right:auto;
	width:100%;
	max-height:806px;
	max-width:1224px;
	position: relative;
	display: block;
}
.carousel-inner {
	width:100%;
	max-width:1224px;
	max-height:806px;
	position: relative;
	display: block;
}
.d-block {
	max-height:806px;
}
body {
	background-color: white;
	justify-content: center;
	padding-top: 60px !important;
    padding-bottom: 86px !important;
}
</style>
</head>

<body>

	<!-- Carousel -->
	<div id="demo" class="carousel slide" data-bs-ride="carousel">

		<!-- Indicators/dots -->
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#demo" data-bs-slide-to="0"
				class="active"></button>
			<button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
			<button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
		</div>

		<!-- The slideshow/carousel -->
		<div class="carousel-inner">
			<div class="carousel-item active ">
				<img src="<%=appName%>/image/la.jpg" alt="Los Angeles"class="d-block" style="width: 100%">
				<div class="carousel-caption">
					<h3>Los Angeles</h3>
					<p>We had such a great time in LA!</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="<%=appName%>/image/chicago.jpg" alt="Chicago"class="d-block" style="width: 100%">
				<div class="carousel-caption">
					<h3>Chicago</h3>
					<p>Thank you, Chicago!</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="<%=appName%>/image/ny.jpg" alt="New York" class="d-block"style="width: 100%">
				<div class="carousel-caption">
					<h3>New York</h3>
					<p>We love the Big Apple!</p>
				</div>
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
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>홈 - ICTPentaTour</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript">
	$(document).ready(function() {
	    $(window).scroll( function(){
	        $('.content-fadein-img').each( function(i){
	            
	            var bottom_of_element = $(this).offset().top + $(this).outerHeight() - 200;
	            var bottom_of_window = $(window).scrollTop() + $(window).height();
	            var top_of_window = $(window).scrollTop();
	            
	            if( bottom_of_window > bottom_of_element ){
	                $(this).addClass("show");
	            } 
	            if(bottom_of_window < bottom_of_element || top_of_window > bottom_of_element) {
	            	$(this).removeClass("show");
	            }
	            
	        }); 
	    });
	    if(window.innerWidth < 501) {
			$(".content-div, .content-text-div, .content-text, .content-img-div, .content-background-img, .air-img, .accommodation-img, .carousel").addClass("mobile");
		}
		if(window.innerWidth >= 501) {
			$(".content-div, .content-text-div, .content-text, .content-img-div, .content-background-img, .air-img, .accommodation-img, .carousel").removeClass("mobile");
		}
	});
	window.addEventListener('resize', () => {
		if(window.innerWidth < 501) {
			$(".content-div, .content-text-div, .content-text, .content-img-div, .content-background-img, .air-img, .accommodation-img, .carousel").addClass("mobile");
		}
		if(window.innerWidth >= 501) {
			$(".content-div, .content-text-div, .content-text, .content-img-div, .content-background-img, .air-img, .accommodation-img, .carousel").removeClass("mobile");
		}
	})
</script>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Noto+Sans+KR&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap');
.active{
	width:100%;
	max-height: 806px;
	max-width:1224px;
	position: relative;
}
.carousel {
	margin-left:auto;
	margin-right:auto;
	width:1224px;
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
.content-div {
	width:1224px;
	height:500px;
	background-color: black;
	display: flex;
	max-width:1224px;
	margin-right:auto;
	margin-left:auto;
	box-shadow: 0px 0px 5px 2px black;
	margin-top:10px;
	margin-bottom:10px;
	border-radius: 10px 10px 10px 10px;
}
.content-text-div {
	height:100%;
	width:55%;
	background-color: black;
	display: flex;
	flex-wrap:wrap;
	align-content: center;
	justify-content: center;
	border-radius: 10px 10px 10px 10px;
}
.content-text {
	width:80%;
	height:auto;
	font-family: 'Nanum Pen Script', cursive;
	font-size:24px;
	color:white;
}
.content-img-div {
	height:100%;
	width:45%;
	background-color:gray;
	display: flex;
	flex-wrap: nowrap;
	position: relative;
	border-radius: 10px 10px 10px 10px;
	overflow: hidden;
}
.content-background-img {
	width:100%;
	height:100%;
	position:relative;
	border-radius: 10px 10px 10px 10px;
}
.air-img {
	width:70%;
	height:auto;
	position:absolute;
	right:-40px;
	bottom:80px;
	transition: 700ms;
	opacity: 0%;
	filter: drop-shadow(6px 6px 5px black) saturate(2.5);
}
.air-img.show{
	width:70%;
	height:auto;
	position:absolute;
	right:20px;
	bottom:120px;
	transition: 700ms;
	opacity: 100%;
}
.accommodation-img {
	width:55%;
	height:auto;
	position:absolute;
	right:-7px;
	bottom:-120px;
	transition: 500ms;
	opacity: 0%;
	transform:rotateY(-45deg);
}
.accommodation-img.show{
	width: 55%;
    height: auto;
    position: absolute;
    right: -7px;
    bottom: -40px;
    transition: 500ms;
    opacity: 100%;
    transform: rotateY(-45deg);
    filter: saturate(3) sepia(0.7);
}
.button-div {
	width:100%;
	display: flex;
	justify-content: center;
}
.air-btn, .accommodation-btn, .tour-btn {
	width:80px;
	height:50px;
	margin-left:30px;
	margin-right:30px;
	border-radius: 10px 10px 10px 10px;
}
.air-btn {
	background-color: white;
	border-color: aqua;
	
}
body {
	background-color: white;
	justify-content: center;
	padding-top: 60px !important;
    padding-bottom: 86px !important;
}

/* mobile */
.carousel.mobile {
	margin-left:auto;
	margin-right:auto;
	width:100%;
	max-height:806px;
	max-width:1224px;
	position: relative;
	display: block;
}
.content-div.mobile {
	width:100%;
	height:500px;
	background-color: black;
	display: flex;
	flex-direction:column;
	max-width:1224px;
	margin-right:auto;
	margin-left:auto;
	box-shadow: 0px 0px 5px 2px black;
	margin-top:10px;
	margin-bottom:10px;
	border-radius: 10px 10px 10px 10px;
}
.content-text-div.mobile {
	height:100%;
	width:100%;
	background-color: black;
	display: flex;
	flex-wrap:wrap;
	align-content: center;
	justify-content: center;
	border-radius: 10px 10px 10px 10px;
}
.content-text.mobile {
	width:80%;
	height:auto;
	font-family: 'Nanum Pen Script', cursive;
	font-size:18px;
	color:white;
}
.content-img-div.mobile {
	height:100%;
	width:100%;
	background-color:gray;
	display: flex;
	flex-wrap: nowrap;
	position: relative;
	border-radius: 10px 10px 10px 10px;
	overflow: hidden;
}
.content-background-img.mobile {
	width:100%;
	height:100%;
	position:relative;
	border-radius: 10px 10px 10px 10px;
}
.air-img.mobile {
	width:60%;
	height:auto;
	position:absolute;
	right:-35px;
	bottom:20px;
	transition: 700ms;
	opacity: 0%;
	filter: drop-shadow(6px 6px 5px black) saturate(2.5);
}
.air-img.show.mobile {
	width:60%;
	height:auto;
	position:absolute;
	right:15px;
	bottom:60px;
	transition: 700ms;
	opacity: 100%;
}
.accommodation-img.mobile {
	width:40%;
	height:auto;
	position:absolute;
	right: 20px;
	bottom:-60px;
	transition:all 500ms transform 0ms;
	opacity: 0%;
	transform:rotateY(-45deg);
}
.accommodation-img.show.mobile {
	width: 40%;
    height: auto;
    position: absolute;
    right: 20px;
    bottom: -35px;
    transition: 500ms;
    opacity: 100%;
    transform: rotateY(-45deg);
    filter: saturate(3) sepia(0.7);
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
		<button class="carousel-control-prev" type="button"
			data-bs-target="#demo" data-bs-slide="prev">
			<span class="carousel-control-prev-icon"></span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#demo" data-bs-slide="next">
			<span class="carousel-control-next-icon"></span>
		</button>
	</div>
	<div class="content-div air-content">
		<div class="content-text-div air-text">
			<span class="content-text">
				매주 화요일은 휴궁일입니다.
				<br>
				※ 휴궁일이 공휴일(대체공휴일 포함)과 겹칠 경우 개방하며, 이 경우 개방한 공휴일 다음의 첫 번째 비공휴일을 휴궁일로 합니다.
			</span>
		</div>
		<div class="content-img-div air-img-div">
			<img class="content-background-img" src="/Student/upload/sky.png">
			<img class="content-fadein-img air-img" src="/Student/upload/airplane.png">
		</div>
	</div>
	<br>
	<div class="content-div accommodation-content">
		<div class="content-img-div accommodation-img-div">
			<img class="content-background-img" src="/Student/upload/night.jpg">
			<img class="content-fadein-img accommodation-img" src="/Student/upload/hotel.png">
		</div>
		<div class="content-text-div accommodation-text">
			<span class="content-text">
				매주 화요일은 휴궁일입니다.
				<br>
				※ 휴궁일이 공휴일(대체공휴일 포함)과 겹칠 경우 개방하며, 이 경우 개방한 공휴일 다음의 첫 번째 비공휴일을 휴궁일로 합니다.
			</span>
		</div>
	</div>
	<br>
	<div class="content-div tour-content">
		<div class="content-text-div tour-text">
			<span class="content-text">
				매주 화요일은 휴궁일입니다.
				<br>
				※ 휴궁일이 공휴일(대체공휴일 포함)과 겹칠 경우 개방하며, 이 경우 개방한 공휴일 다음의 첫 번째 비공휴일을 휴궁일로 합니다.
			</span>
		</div>
		<div class="content-img-div tour-img-div">
			
		</div>
	</div>
	<div class="button-div">
		<button type="button" class="air-btn ">항공</button>
		<button type="button" class="accommodation-btn">숙박</button>
		<button type="button" class="tour-btn">투어</button>
	</div>
</body>
</html>
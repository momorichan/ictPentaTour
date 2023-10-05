<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${bean.tname } - 투어 상세보기</title>
<script type="text/javascript">
	var prevScrollTop = 0;
	
	var nowScrollTop = 0;
	
	function wheelDelta(){
	    return prevScrollTop - nowScrollTop > 0 ? 'up' : 'down';
	};
	$(window).scroll(function(){
		var bottom_of_window = $(window).scrollTop() + $(window).height();
		if(bottom_of_window > $('html').outerHeight() - 90) {
			$(".floating, .side-pannel.mobile").addClass("bottom");
		} else {
			$(".floating, .side-pannel.mobile").removeClass("bottom");
		}
	});
	$(window).on('scroll', function(){
		nowScrollTop = $(this).scrollTop();
		if(wheelDelta() == 'down'){
			$(".side-pannel").removeClass("hide");
		}
		if(wheelDelta() == 'up'){
			$(".side-pannel").addClass("hide");
		}
		prevScrollTop = nowScrollTop;
	});
	window.onload=function(){
		
	}
	window.addEventListener('resize', () => {
		if(window.innerWidth < 501) {
			$(".main-info-div, .main-image-div, .main-div, .detail-info, .detail-info-div, .inner-image, .floating, .floating-btn").addClass("mobile");
			$(".bottom-info-div, .purchasebtn, .side-pannel, #title, .info-div, .main-location, .price, .purchasebtn, #side-title").addClass("mobile");
		}
		if(window.innerWidth >= 501) {
			$(".main-info-div, .main-image-div, .main-div, .detail-info, .detail-info-div, .inner-image, .floating, .floating-btn").removeClass("mobile");
			$(".bottom-info-div, .purchasebtn, .side-pannel, #title, .info-div, .main-location, .price, .purchasebtn, #side-title").removeClass("mobile");
		}
	})
	$(document).ready(function(){
		var price = ${bean.tprice};
		price = '가격 : ' +  price.toLocaleString() + '원';
		$('.price').html(price);
		
		if(window.innerWidth < 501) {
			$(".main-info-div, .main-image-div, .main-div, .detail-info, .detail-info-div, .inner-image, .floating, .floating-btn").addClass("mobile");
			$(".bottom-info-div, .purchasebtn, .side-pannel, #title, .info-div, .main-location, .price, .purchasebtn, #side-title").addClass("mobile");
		}else{
			$(".slide-div, .card-title, .card, .card-img-top, .serchcon, .tablecon, .tablecon-2, .navbar-toggle-btn").removeClass("mobile");
		}
	})
	
	function showPopup(toid, meid) {
		if(${empty sessionScope.loginfo}) {
			alert("로그인이 필요한 서비스 입니다.");
			window.open("<%=notWithFormTag %>mePopup" , "a", "width=600, height=640, left=100, top=50");
			return false;
		} else {
			window.open("<%=notWithFormTag %>tourPopup&toid=" + toid + "&meid=" + meid , "a", "width=600, height=640, left=100, top=50");
		}
	}
	$(document).on("pageload",function(){
		  window.location.reload(true);
	});
	
	function tourdeleteclick(toid) {
		if (confirm("정말 삭제하시겠습니까?") == true){
		    location.href = '<%=notWithFormTag%>tourDelete&toid=' + toid;
		}else{
		    return;
		}
		
	}
</script>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Noto+Sans+KR&display=swap');
@font-face {
    font-family: 'SUITE-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2') format('woff2');
    font-weight: 400;
    font-style: normal;
}
@font-face {
    font-family: 'TheJamsil5Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/TheJamsil2Light.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}
.main-div{
	justify-content: center;
	display: flex;
	min-height:600px;
}
.main-image-div{
	min-width:50%;
	width: 50%;
	height: auto;
	margin:0 0;
	overflow:auto;
	display: block;
	background-color: black;
}
.main-info-div{
	width: 50%;
	height:auto;
	margin:0 0;
	overflow:hidden;
	position: relative;
	padding: 50px;
	justify-content: left;
	display: flex;
}
.bottom-info-div{
	display: flex;
	width: 1200px;
/* 		white-space: normal; */
/* 		overflow: hidden; */
}
.detail-info-div{
	width: 1227px;
	height: auto;
	margin:0 auto;
	overflow:hidden;
	display: inline;
	white-space: normal;
}
.side-pannel{
	width: 450px;
	height: 960px;
	position: sticky;
	top:-1px;
	background-color: white;
	border: 1px solid;
}
.side-pannel-inner{
	width:100%;
	height:100%;
	display:flex;
	flex-direction:column;
	align-content: center;
	justify-content: center;
	flex-wrap: wrap;
}
.main-image{
	width:100%;
	height:auto;
}
.main-info{
	width:100%;
	height:100%;
}
.detail-info{
	width:1226.7px;
	height:auto;
	font-size: 18px;
	margin-bottom:5px;
	display: grid;
	
}
.detail-info-big{
	width:1226.7px;
	height:auto;
}
.floating{
	position:fixed;
	z-index: 1;
	bottom:5px;
	right:65px;
	display: flex;
	flex-direction: column;
	transition: transform 100ms;
}
.floating.bottom{
	position:fixed;
	z-index: 1;
	bottom:85px;
	right:65px;
	display: flex;
	flex-direction: column;
}
.floating-btn {
	margin-bottom:5px;
	background: none;
	color: #0d6efd;
	border:none;
}
.floating-btn:hover {
	margin-bottom:5px;
	background: none;
	border:none;
	filter:brightness(1.2);
}
.delete-btn {
	color:red !important;
}
.container{
	max-width:1226.7px;
	display: block;
	justify-content: center;
	margin-left:auto;
	margin-right:auto;
}
.title{
	margin: 10px auto;
}
.info-div{
	width:570px;
	display: flex;
  	 	flex-direction: column;
   	margin-left: 25px;
   	justify-content: flex-start;
   	align-items: center;
}
.title-box{
	margin-bottom: 0;
}
.purchasebtn{
	margin-top:20px;
	width:90px;
	margin-left:auto;
	margin-right:auto;
}
.borderdiv{
	display: flex;
	justify-content: center
}
body{
	width:100%;
	min-width:100%;
	margin: 0px;
	padding-top: 60px !important;
	font-family: 'TheJamsil5Bold';
	-webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}
h4{
	font-size: 24px;
}
h3{
	font-size: 28px;
}
h2{
	font-size: 32px;
}
.side-bar-div {
	display: none;
}
	/* ----------------------- tour Detail mobile ----------------------- */
	
.main-info-div.mobile {
   width: 100% !important;
   height: 300px !important;
   margin: 0 0 !important;
   overflow: hidden !important;
   position: relative !important;
   padding: 10px !important;
   justify-content: center !important;
   display: flex !important;
}

.main-image-div.mobile {
   min-width: 100% !important;
   width: 100% !important;
   height: auto !important;
   margin: 0 0 !important;
   overflow: auto !important;
   display: block !important;
   background-color: black !important;
}

.main-div.mobile {
   justify-content: center !important;
   display: flex !important;
   min-height: 500px !important;
   flex-direction: column !important;
}

.detail-info.mobile {
   width: 470px !important;
   height: auto !important;
   font-size: 15px !important;
   margin-bottom: 5px !important;
   display: grid;
}

.detail-info-div.mobile {
   width: 465px !important;
   height: auto !important;
   margin: 0 0 !important;
   overflow: hidden !important;
   display: inline !important;
   white-space: normal !important;
   margin-bottom:50px !important;
}

.bottom-info-div.mobile {
   display: flex !important;
   width: 465px !important;
   /* white-space: normal; */
   /* overflow: hidden; */
   flex-direction: column !important;
}

.purchasebtn.mobile {
   margin-top: 0px !important;
   width: 90px !important;
   margin-left: auto !important;
   margin-right: auto !important;
}

.side-pannel.mobile {
   width: 454px !important;
   height: 105px !important;
   position: fixed !important;
   top: 89% !important;
   margin-bottom: 85px !important;
   background-color: white !important;
   border: 1px solid !important;
   transition: margin 300ms;
}
.side-pannel.mobile.bottom {
   width: 454px !important;
   height: 105px !important;
   position: fixed !important;
   top: 80% !important;
   margin-bottom: 85px !important;
   background-color: white !important;
   border: 1px solid !important;
}
.side-pannel.mobile.hide {
   width: 454px !important;
   height: 105px !important;
   position: fixed !important;
   top: 89% !important;
   margin-top: 30% !important;
   background-color: white !important;
   border: 1px solid !important;
}

#title.mobile {
   width: 312px !important;
   margin-bottom: 10px !important;
   text-align: center !important;
}
#side-title.mobile {
   width: 233px !important;
   margin-bottom: 10px !important;
   text-align: center !important;
}

.info-div.mobile {
   width: 307px !important;
   display: flex !important;
   flex-direction: column !important;
   margin-left: 0px !important;
   justify-content: center !important;
   align-items: center !important;
}

.main-location.mobile {
   width: 230px !important;
   height: 10px !important;
   margin-bottom: 0px !important;
   margin-top: 10px !important;
   text-align: center !important;
}

.price.mobile {
   font-size: 22px !important;
}

.purchasebtn.mobile {
   margin-top: 0px !important;
   width: 69px !important;
   height: 40px !important;
   margin-left: auto !important;
   font-size: 16px !important;
   margin-right: auto !important;
}
.inner-image.mobile {
	margin-right:auto;
	margin-left:auto;
}
.floating.mobile{
	position:fixed;
	z-index: 1;
	bottom:25%;
	right:-40px;
	display: flex;
	flex-direction: column;
	transition: transform 100ms;
	justify-content: left;
	text-align: left;
}
.floating.bottom.mobile{
	position:fixed;
	z-index: 1;
	bottom:25%;
	right:-40px;
	display: flex;
	flex-direction: column;
	justify-content: left;
	text-align: left;
}
.floating-btn.mobile {
	margin-bottom:5px;
	background: none;
	color: #0d6efd;
	border:1px solid;
	text-align: left;
	justify-content: left;
	padding:2px;
	transition: transform 100ms;
}
.floating-btn.mobile:hover {
	margin-bottom:5px;
	background: none;
	border:1px solid;
	filter:brightness(1.2);
	text-align: left;
	justify-content: left;
	transform:translateX(-40px);
	padding:2px;
}
</style>
</head>
<body>
	<div class="floating">
		<button class="btn btn-primary floating-btn delete-btn" type="button" onclick="tourdeleteclick(${requestScope.bean.toid})">Delete</button>
		<button class="btn btn-primary floating-btn" type="button" onclick="location.href='<%=notWithFormTag %>tourUpdate&toid=${requestScope.bean.toid }'">Modify</button>
		<button class="btn btn-primary floating-btn" type="button" onclick="history.back()">Back</button>
	</div>
	<div class="container">
		<div class="main-div">
			<div class="main-image-div">
				<div id="demo" class="carousel slide" data-bs-interval="false">

					<!-- Indicators/dots -->
					<div class="carousel-indicators">
						<button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
						<button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
						<button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
					</div>

					<!-- The slideshow/carousel -->
					<div class="carousel-inner">
						<div class="carousel-item active">
							<c:if test="${bean.timage01 == null }">
								<img src="/Student/upload/empty.jpg" alt="timage01" class="d-block" style="width: 100%">
							</c:if>
							<c:if test="${bean.timage01 != null }">
								<img src="/Student/upload/${bean.timage01 }" alt="timage01" class="d-block" style="width: 100%">
							</c:if>
						</div>
						<div class="carousel-item">
							<c:if test="${bean.timage02 == null }">
								<img src="/Student/upload/empty.jpg" alt="timage02" class="d-block" style="width: 100%">
							</c:if>
							<c:if test="${bean.timage02 != null }">
								<img src="/Student/upload/${bean.timage02 }" alt="timage02" class="d-block" style="width: 100%">
							</c:if>
						</div>
						<div class="carousel-item">
							<c:if test="${bean.timage03 == null }">
								<img src="/Student/upload/empty.jpg" alt="timage03" class="d-block" style="width: 100%">
							</c:if>
							<c:if test="${bean.timage03 != null }">
								<img src="/Student/upload/${bean.timage03 }" alt="timage03" class="d-block" style="width: 100%">
							</c:if>
						</div>
					</div>

					<!-- Left and right controls/icons -->
					<button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
						<span class="carousel-control-prev-icon"></span>
					</button>
					<button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
						<span class="carousel-control-next-icon"></span>
					</button>
				</div>
			</div>
			<div class="main-info-div">
				<div class="info-div">
					<p id="trlocation" class="main-location" style="width:530px;height:10px;margin-bottom:0;margin-top: 50px;text-align:center;">${bean.location }
					<div class="title" style="width:530px; height:auto; margin-bottom: 0;">
						<h2 align="left" style="width:530px; margin-bottom: 50px; text-align: center;"id="title">${bean.tname }</h2>
					</div>
					<div>
						<h3 class="price">　</h3>
					</div>
					<button type="button" class="btn btn-lg btn-danger purchasebtn" onclick="showPopup('${requestScope.bean.toid}','${sessionScope.loginfo.meid}')">구매</button>
				</div>
			</div>
		</div>
		<div class="bottom-info-div">
			<div class="detail-info-div">
				<hr style="margin:0px;">
				<br>
				<h4 class="detail-info">사용 가능 일자 : ${bean.tusedate }</h4>
				<br>
				<h4 class="detail-info">제한 연령 : ${bean.tage }</h4>
				<br>
				<br>
				<p class="detail-info">${bean.tcontent }</p>
				<br>
				<br>
			</div>
			<div class="side-pannel">
				<div class="side-pannel-inner">
					<p id="trlocation" class="main-location" style="width:250px; height:10px; margin-bottom: 0; margin-top: 50px; text-align: center;">${bean.location }
					<div class="title" style="width:250px; height:auto; margin-bottom: 0;">
						<h2 align="left" style="width:250px; margin-bottom: 50px; font-size:26px; text-align: center;"id="side-title">${bean.tname }</h2>
					</div>
					<div>
						<h3 style="font-size: 22px; text-align: center;"class="price">　</h3>
					</div>
					<button type="button" class="btn btn-danger purchasebtn" onclick="showPopup(${requestScope.bean.toid },${sessionScope.loginfo.meid })">구매</button>
				</div>
			</div>
		</div>
		<div>
			
		</div>
	</div>
<%@ include file="./../review/rvList.jsp"%>
</body>
</html>
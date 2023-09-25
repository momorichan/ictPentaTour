<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function(){
		var price = ${bean.tprice};
		price = '가격 : ' +  price.toLocaleString() + '원';
		console.log(price);
		$('.price').html(price);
	})
</script>
<style type="text/css">
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
		height: 924px;
		position: sticky;
		top:0px;
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
	}
	.detail-info-big{
		width:1226.7px;
		height:auto;
	}
	.floating{
		position:fixed;
		z-index: 1;
		margin-left:90%;
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
</style>
</head>
<body>
	<div class="floating">
		<button class="btn btn-primary" type="button" onclick="history.back()">back</button>
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
					<p id="trlocation" style="width:530px;height:10px;margin-bottom:0;margin-top: 50px;text-align:center;">${bean.location }
					<div class="title" style="width:530px; height:auto; margin-bottom: 0;">
						<h2 align="left" style="width:530px; margin-bottom: 50px; text-align: center;"id="title">${bean.tname }</h2>
					</div>
					<div>
						<h3 class="price"></h3>
					</div>
					<button type="button" class="btn btn-lg btn-danger purchasebtn">구매</button>
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
					<p id="trlocation" style="width:250px; height:10px; margin-bottom: 0; margin-top: 50px; text-align: center;">${bean.location }
					<div class="title" style="width:250px; height:auto; margin-bottom: 0;">
						<h2 align="left" style="width:250px; margin-bottom: 50px; font-size:26px; text-align: center;"id="title">${bean.tname }</h2>
					</div>
					<div>
						<h3 style="font-size: 22px; text-align: center;" class="price"></h3>
					</div>
					<button type="button" class="btn btn-danger purchasebtn">구매</button>
				</div>
			</div>
		</div>
		<div>
			
		</div>
	</div>
</body>
</html>
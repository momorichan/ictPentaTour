<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="./../common/common.jsp"%>
<%@ include file="./../common/bootstrap5.jsp"%>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.head {
	width: 100%;
	height: 300px;
	text-align : center;
}

.wrap {
	width: 100%;
	height: 300px;
	text-align : center;
}

.review-section {
	width: 100%;
	height: 300px;
}

.shape {
	height: 30px;
	background-color : #bbb;
	border-top : 1px;
}
.text_reviewtype{
	position : relative ;
	left : 70px ;
}
.point_box{
	display: flex;
}
.rating_main{
	display: flex;
}
</style>
</head>
<body>


	<div class="head">헤드</div>
	<div class="wrap">중간</div>
	<hr class="shape"></hr>

	<div data-v-bc3b5154="" class="review-section">
		<div data-v-bc3b5154="" class="text_reviewtype">
			<strong data-v-bc3b5154="" class="tit mid">숙소후기</strong>
		</div>
		<div class="rating_main">
			<div class="point_box">
				<div class="point_txt">
					<strong>3.8</strong> <span>/ 5</span>
				</div>
			</div>
			<div class="rating_box">
				<ul>
					<li class="best"><span>3.9</span>
						<div class="progress">
							<div class="progress_bar" style="height: 78%;"></div>
						</div>
						<p>청결</p></li>
					<li class=""><span>3.8</span>
						<div class="progress">
							<div class="progress_bar" style="height: 76%;"></div>
						</div>
						<p>서비스</p></li>
					<li class=""><span>3.7</span>
						<div class="progress">
							<div class="progress_bar" style="height: 74%;"></div>
						</div>
						<p>편의</p></li>
					<li class="best"><span>3.9</span>
						<div class="progress">
							<div class="progress_bar" style="height: 78%;"></div>
						</div>
						<p>시설</p></li>
				</ul>
			</div>
		</div>
		<div data-v-bc3b5154="" class="best_review partner">
			<div data-v-bc3b5154="" class="rating_info">
				<strong data-v-bc3b5154="" class="point">5</strong> <span
					data-v-bc3b5154="" class="logo hotels-com"></span>
			</div>
			<div data-v-bc3b5154="" class="review_cont con">
				<p data-v-bc3b5154="">바닷가도 가깝고 객실크기도 여유있고 쾌적했어요! 침대도 크고 수압이나
					청결상태도 좋았어요 :) 다만 체크인할때 투숙객 대비 직원이 턱없이 부족한 느낌이었네요.. 셀프체크인 줄만 3...</p>
			</div>
			<span data-v-bc3b5154="" class="date">2023.06.09</span>
		</div>
		<div data-v-bc3b5154="" class="btn_wrap">
			<a data-v-bc3b5154="" href="#none" class="btn"> 제휴사 후기 1578건 보기 </a>
			<a data-v-bc3b5154="" href="#none" class="btn"> 하나투어 후기 4건 보기 </a>
		</div>
	</div>

</body>
</html>
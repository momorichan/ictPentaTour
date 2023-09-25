<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="./../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.rounded-pill {
	opacity: 0.9;
}

.mode, .keyword, .col {
	margin: auto;
}

/* 좌측 div 설정 */
.left-div {
	float: left; /* 왼쪽으로 부유(floating) */
	width: 58.4%; /* 가로 공간의 58.4% 차지 */
	padding: 0px;
	justify-content: center;
}

/* 우측 div 설정 */
.right-div {
	float: left; /* 왼쪽으로 부유(floating) */
	width: 41.6%; /* 가로 공간의 41.6% 차지 */
	padding: 0px;
}

.p1 {
	float: left;
	width: 48%;
	height: 225px;
	display: block;
	margin-bottom: 3px;
	margin-left: 1px;
	margin-right: 3px;
}

.p2 {
	float: left;
	width: 32%;
	height: 174px;
	margin-left: 1px;
	margin-right: 1px;
}

img {
	width: 100%;
	height: 100%;
}
</style>
<script type="text/javascript">

$(function() {

	$('#datepicker').daterangepicker({
		autoUpdateInput : false,
		locale : {
			cancelLabel : 'Clear'
		}
	});

	$('#datepicker').on(
			'apply.daterangepicker',
			function(ev, picker) {
				$(this).val(
						picker.startDate.format('YYYY/MM/DD') + ' - '
								+ picker.endDate.format('YYYY/MM/DD'));
			});

	$('#datepicker').on('cancel.daterangepicker',
			function(ev, picker) {
				$(this).val('');
			});
});

function getRoomDetail(roid){
	$('#roomDetail').empty();
	//$.ajax() 함수를 이용하여 데이터 보여주기 
	$.ajax({
		url:'<%=notWithFormTag%>roDetail',
			data : 'roid=' + roid,
			type : 'get',
			//dataType:'json', 
			dataType : 'html',
			success : function(result) {
				$('#roomDetail').html(result);
			}
		});
	}
	
function getAmenities(){
	$('#amList').empty();
	//$.ajax() 함수를 이용하여 데이터 보여주기 
	$.ajax({
		url:'<%=notWithFormTag%>amList',
			data : 'acid=' + '${requestScope.acbean.acid}',
			type : 'get',
			//dataType:'json', 
			dataType : 'html',
			success : function(result) {
				$('#amList').html(result);
			}
		});
	}

	$(document).ready(function() {

		getAmenities();
		$('td[data-bs-toggle="modal"]').on('click', function() {
			var roid = $(this).data('roid'); // 클릭된 td의 data-roid 속성 가져오기
			getRoomDetail(roid); // 가져온 roid 값을 사용하여 함수 호출
		});

	});
</script>
</head>
<body>
	<div class="container">
		<div class="left-div">
			<span class="p1"><img
				src="${pageContext.request.contextPath}/upload/${requestScope.randomimage.get(1)}"
				style="width: 100%;" " data-src="" alt=""></span> <span class="p1"><img
				src="${pageContext.request.contextPath}/upload/${requestScope.randomimage.get(2)}"
				style="width: 100%;" " data-src="" alt=""></span> <span class="p2"><img
				src="${pageContext.request.contextPath}/upload/${requestScope.randomimage.get(3)}"
				style="width: 100%;" " data-src="" alt=""></span> <span class="p2"><img
				src="${pageContext.request.contextPath}/upload/${requestScope.randomimage.get(4)}"
				style="width: 100%;" " data-src="" alt=""></span> <span class="p2"><img
				src="${pageContext.request.contextPath}/upload/${requestScope.randomimage.get(0)}"
				style="width: 100%;" title="" data-src="" alt=""></span>
		</div>
		<div class="right-div">
			<table class="table table-borderless">
				<thead>
					<tr>
						<td>
							<h2 align="right">${requestScope.acbean.name}</h2>
							<p align="right">${requestScope.acbean.description}</p>
						</td>
					</tr>
					<tr>
						<td>리뷰 정보</td>
					</tr>
					<tr>
						<td>최저가 정보</td>
					</tr>
				</thead>
			</table>
		</div>
		<div>
			<table class="table">
				<tbody>
					<tr>
						<td>숙소 정보</td>
						<td align="right"><input class="form-control-sm" type="text"
							name="keyword" id="datepicker" placeholder="날짜를 선택하세요.">
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<table class="table">

			<tbody>
				<c:forEach var="bean" items="${requestScope.roomlists}">
					<tr>
						<td class="col-6" data-bs-toggle="modal" data-bs-target="#myModal"
							data-roid="${bean.roid}" data-zxc="zxc">${bean.room}</td>
						<td class="col-3">조식 ${bean.breakfast}</td>
						<td class="col-1">1박<br> <fmt:formatNumber
								value="${bean.price}"></fmt:formatNumber>원
						</td>
						<td class="col-2"><a href="<%=notWithFormTag%>roReservation"
							class="btn btn-primary">예약하기</a></td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
		<table class="table table-borderless" id="amList">
		</table>

		<!-- The Modal -->
		<div class="modal fade" id="myModal">
			<div class="modal-dialog modal-dialog-centered modal-lg">
				<div class="modal-content" id="roomDetail"></div>
			</div>
		</div>
		<div class="head">
	<div class = "rvList_image">
	 	<img alt="사진이 어디갔더라" src="https://cdn.pixabay.com/photo/2021/09/07/11/53/car-6603726_640.jpg" style="height:300px; width:100%;">
	 		 <h1 class="rvList_image_text" style="font-size:50px">여행 후기</h1>
	 </div>
	</div>
	<div class="wrap">
		<a type="button" class="btn btn-primary" href="<%=notWithFormTag%>rvInsert&acid=${requestScope.acbean.acid}&category=ac&meid=${sessionScope.loginfo.meid}">리뷰 입력</a>
	</div>
	<hr class="shape"></hr>

	<div class="review-section">
		<div class="rating_main">
			<div class="rating_main_left">
				<div class="point_txt">
				<strong class="tit mid">숙소후기</strong><br>
					<strong>3.8</strong> <span>/ 5</span><br>
					<span>1564명의 여행후기</span>
				</div>
			</div>
			<div class="rating_main_right">
				<ul>
					<li class="best"><span>3.9</span>
						<div class="progress-bar">
							<div class="progress" style="width: 78%;"></div>
						</div>
						<p>청결</p></li>
					<li class=""><span>3.8</span>
						<div class="progress-bar">
							<div class="progress" style="width: 76%;"></div>
						</div>
						<p>서비스</p></li>
					<li class=""><span>3.7</span>
						<div class="progress-bar">
							<div class="progress" style="width: 74%;"></div>
						</div>
						<p>편의</p></li>
					<li class="best"><span>3.9</span>
						<div class="progress-bar">
							<div class="progress" style="width: 78%;"></div>
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
			<br><br><br><br><br><br><br><br><br>
			<a data-v-bc3b5154="" href="#none" class="btn"> 제휴사 후기 1578건 보기 </a>
		</div>
	</div>
</body>
</html>

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

.price {
	font-size: 32px;
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

		
		$('.reserve-button').click(function(e) {
	        e.preventDefault(); // 기본 동작 방지

	        var datepickerId = $(this).data('datepicker'); // datepicker 필드의 ID 가져오기
	        var dateRange = $(datepickerId).val(); // 선택한 날짜 범위 가져오기
	        var roid = $(this).data('roid'); // 선택한 방의 roid 가져오기
	        var acid = ${requestScope.acbean.acid};

	        // 날짜 범위를 시작 날짜와 끝 날짜로 분리
	        var dateParts = dateRange.split(' - ');
	        var startDate = dateParts[0].trim(); // 시작 날짜
	        var endDate = dateParts[1].trim();   // 끝 날짜

	        // 예약 페이지 URL 생성 및 이동
	        var reservationUrl = '<%=notWithFormTag%>
	roReservation';
											reservationUrl += '&startDate='
													+ startDate + '&endDate='
													+ endDate + '&acid=' + acid
													+ '&roid=' + roid;

											// 생성된 URL로 페이지 이동
											window.location.href = reservationUrl;
										});
					});
</script>
</head>
<body>
	<div class="container">
		<div class="left-div">

			<c:forEach items="${requestScope.randomimage}" var="image"
				varStatus="loop" begin="0" end="4">
				<span class="p${loop.index < 2 ? '1' : '2'}"> <img
					src="${pageContext.request.contextPath}/upload/${image}"
					style="width: 100%;" data-src="" alt="">
				</span>
			</c:forEach>

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
						<td class="col-6"><p class="tit">1박 요금 최저가</p></td>
						<td class="col-6" align="right"><strong class="price">
								<fmt:formatNumber>
						${requestScope.minprice}
						</fmt:formatNumber>
						</strong> 원~</td>
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
							name="date" id="datepicker" placeholder="날짜를 선택하세요."> <a
							href="#select_person_htl2" class="btn btn-primary"> 객실 </a>
							<button class="btn btn-primary">객실 검색</button></td>
					</tr>
				</tbody>
			</table>
		</div>

		<div id="select_person_htl2"
			class="js_show_wrap lypop_selectPerson on">
			<div class="member_count">
				<ul>
					<li><div class="text_wrap mid line top">
							<strong class="tit">객실 선택</strong>
						</div>
						<div class="num_count_holder">
							<p class="tit">
								<span class="txt">객실</span>
							</p>
							<span class="num_count_group cir"><button
									class="btn_decrement down"></button> <span data-min="3"
								data-max="1000" class="inpt_counter">1</span>
								<button class="btn_increment up"></button></span>
						</div></li>
					<li class=""><div class="text_wrap mid line top">
							<strong class="tit">객실별 인원 설정</strong>
						</div>
						<div class="text_wrap sml top">
							<p class="txt em">
								<span class="icn car"></span> 객실 1
							</p>
							<!---->
						</div>
						<div class="num_count_holder">
							<p class="tit">
								<span class="txt">성인</span>
							</p>
							<span class="num_count_group cir"><button
									class="btn_decrement down"></button> <span data-min="3"
								data-max="1000" class="inpt_counter">1</span>
								<button class="btn_increment up"></button></span>
						</div>
						<div class="num_count_holder">
							<p class="tit">
								<span class="txt">아동</span>
							</p>
							<span class="num_count_group cir"><button
									class="btn_decrement down"></button> <span data-min="3"
								data-max="1000" class="inpt_counter">0</span>
								<button class="btn_increment up"></button></span>
						</div>
						<div class="form_wrap mt5"></div>
						<p class="stxt mt10" style="display: none;">
							<em>아동 나이를 선택해 주세요.</em>
						</p>
						<p class="txt2 exclam em mt15">
							아동: 0세 ~ 만 17세 이하<br>※숙소 형태에 따라 아동 나이. 투숙 가능 인원의 기준이 상이합니다.
						</p></li>
				</ul>
			</div>
			<br>
			<div class="option_wrap">
				<span class="txt em">객실1</span> <span class="divider_dot"><span
					class="txt">성인1 <!----></span></span> <span class="right_cont"><button
						class="btn pink">선택완료</button></span>
			</div>
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
						<td class="col-2"><a href="#"
							class="btn btn-primary reserve-button"
							data-datepicker="#datepicker" data-roid="${bean.roid}"> 예약하기
						</a></td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
		<table class="table table-borderless" id="amList">
		</table>
	</div>
	<!-- The Modal -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content" id="roomDetail"></div>
		</div>
	</div>
</body>
</html>
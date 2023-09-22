<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="./../common/bootstrap5.jsp"%>
<%@ include file="./../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.search {
	display: flex;
	padding: 80px;
}

/* .from, .to, .depart, .arrive, .btn, .people {
	margin: auto;
}

.froms, .tos, .departs, .arrives, .btn2, .peoples {
	margin: auto;
}
 */
#qty {
	margin: -10px;
	border: 0px;
	font-size: 1rem;
}

.plus, .minus {
	font-size: 1rem;
}

#cqty {
	margin: -10px;
	border: 0px;
	font-size: 1rem;
}

.cplus, .cminus {
	font-size: 1rem;
}

img {
	height: 150px;
	width: 100%;
}

div [class^="col-"] {
	padding-left: 5px;
	padding-right: 5px;
}

.card {
	transition: 0.5s;
	cursor: pointer;
}

.card-title {
	font-size: 15px;
	transition: 1s;
	cursor: pointer;
}

.card-title i {
	font-size: 15px;
	transition: 1s;
	cursor: pointer;
	color: #ffa710
}

.card-title i:hover {
	transform: scale(1.25) rotate(100deg);
	color: #18d4ca;
}

.card:hover {
	transform: scale(1.05);
	box-shadow: 10px 10px 15px rgba(0, 0, 0, 0.3);
}

.card-text {
	height: 80px;
}

.card::before, .card::after {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	transform: scale3d(0, 0, 1);
	transition: transform .3s ease-out 0s;
	background: rgba(255, 255, 255, 0.1);
	content: '';
	pointer-events: none;
}

.card::before {
	transform-origin: left top;
}

.card::after {
	transform-origin: right bottom;
}

.card:hover::before, .card:hover::after, .card:focus::before, .card:focus::after
	{
	transform: scale3d(1, 1, 1);
}
</style>

<script type="text/javascript">
	$(document).ready(function() {
		$('.tripB').hide();	
	});

	function setDisplay() {
		if ($('input:radio[id=oneway]').is(':checked')) {
			$('.arriveday').hide();
		} else {
			$('.arriveday').show();
		}

		if ($('input:radio[id=checkinfo]').is(':checked')) {
			$('.tripA').hide();
			$('.tripB').show();
		} else {
			$('.tripA').show();
			$('.tripB').hide();
		}
	}
	
	
</script>

</head>
<body>


	<div class="main" align="center">
		<input type="radio" id="roundway" name="show" value="1"
			checked="checked" onchange="setDisplay()" /> <input type="radio"
			id="oneway" name="show" value="2" onchange="setDisplay()" /> <input
			type="radio" id="checkinfo" name="show" value="3"
			onchange="setDisplay()" />

		<div class="tab" align="center">
			<label for="roundway">왕복</label> <label for="oneway">편도</label> <label
				for="checkinfo">체크인</label>
		</div>
		

		<div class="tripA">
			<div class="container">
				<div>
					<form name="" action="<%=withFormTag%>" method="get">
						<input type="hidden" name="command" value="airList">
						<div class="search justify-content-center">
							<div class="from">
								<h3>From</h3>
								<input class="form-control" type="hidden" id="mode" name="mode"
									value="depart"> <select id="keyword" name="keyword">
									<option value="all" selected="selected">출발지
									<option value="김포">김포
									<option value="일본">일본
									<option value="중국">중국
									<option value="대만">대만</option>
								</select>
							</div>


							<div class="to">
								<h3>To</h3>
								<input class="form-control" type="hidden" id="mode2"
									name="mode2" value="arrive"> <select class="city2"
									id="keyword2" name="keyword2">
									<option value="all" selected="selected">도착지
									<option value="일본">일본
									<option value="대만">대만
									<option value="중국">중국
									<option value="괌">괌</option>
								</select>
							</div>

							<div class="departday">
								<h3>가는 날</h3>
								<input type="hidden" id="mode3" name="mode3" value="detime">
								<input class="departdate" type="date" id="keyword3"
									name="keyword3">
							</div>

							<div class="arriveday">
								<h3>오는 날</h3>
								<input type="hidden" id="mode4" name="mode4" value="artime">
								<input class="arrivedate" type="date" id="keyword4"
									name="keyword4">
							</div>


						</div>
						<div class="find">
							<button type="submit" class="search_btn btn-primary">검색</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		

		<div class="tripB">
			<div class="container">
				<div>
					<form name="" action="<%=withFormTag%>" method="get">
						<input type="hidden" name="command" value="airCheck">
						<div class="search justify-content-center">
							<div class="from">
								<h3>예약번호</h3>
								<input class="form-control" type="number" id="regid" name="regid"
									placeholder="예약번호">
							</div>
						</div>
						<div class="find_checkin">
								<button type="submit" class="search_btn btn-primary">조회</button>
							</div>
					</form>
				</div>
			</div>


		</div>


		<div class="container mt-2">
			<div class="row">
				<div class="col-md-3 col-sm-6">
					<div class="card card-block">
						<h4 class="card-title text-right">
							<i class="material-icons"></i>
						</h4>
						<a
							href="<%=notWithFormTag%>airList&mode=depart&keyword=all&mode2=arrive&keyword2=일본">
							<img
							src="https://image.hanatour.com/usr/cms/resize/400_0/2022/09/05/10000/4d34420c-7d47-4835-becf-f04454a99d20.jpeg"
							alt="Photo of sunset">
						</a>
						<h5 class="card-title mt-3 mb-3">일본</h5>
						<p class="card-text">오사카</p>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="card card-block">
						<h4 class="card-title text-right">
							<i class="material-icons"></i>
						</h4>
						<a
							href="<%=notWithFormTag%>airList&mode=depart&keyword=all&mode2=arrive&keyword2=중국">
							<img
							src="https://image.hanatour.com/usr/cms/resize/400_0/2023/04/06/10000/49738def-cc04-494b-a597-d86128ef9a38.jpg"
							alt="Photo of sunset">
						</a>
						<h5 class="card-title  mt-3 mb-3">중국</h5>
						<p class="card-text">할인</p>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="card card-block">
						<h4 class="card-title text-right">
							<i class="material-icons"></i>
						</h4>
						<a
							href="<%=notWithFormTag%>airList&mode=depart&keyword=all&mode2=arrive&keyword2=대만">
							<img
							src="https://image.hanatour.com/usr/cms/resize/400_0/2019/07/04/10000/a895c128-729e-448b-a9f2-ba66e6ce3503.jpg"
							alt="Photo of sunset">
						</a>
						<h5 class="card-title  mt-3 mb-3">대만</h5>
						<p class="card-text">많이</p>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="card card-block">
						<h4 class="card-title text-right">
							<i class="material-icons"></i>
						</h4>
						<a
							href="<%=notWithFormTag%>airList&mode=depart&keyword=all&mode2=arrive&keyword2=괌">
							<img
							src="https://image.hanatour.com/usr/cms/resize/400_0/2022/10/12/10000/2a3c5702-2f0e-4438-934e-0ce5e696deb7.jpg"
							alt="Photo of sunset">
						</a>
						<h5 class="card-title  mt-3 mb-3">괌</h5>
						<p class="card-text">해줌</p>
					</div>
				</div>
			</div>

			</div>
		</div>
</body>
</html>
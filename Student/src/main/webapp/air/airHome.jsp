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

.form_radio_btn {
			width: 47%;
			height : 45px;
    		border: 1px solid #EAE7E7;
    		border-radius: 10px;
		}
		.form_radio_btn input[type=radio] {
			display: none;
		}
		.form_radio_btn label {
			display: block;
    		border-radius: 10px;
   			margin: 0 auto;
    		text-align: center;
    		height: -webkit-fill-available;
    		line-height: 45px;
		}
		.form_radio_btn input[type=radio]:checked + label {
			background: #184DA0;
			color: #fff;
		}
		 
		/* Hover */
		.form_radio_btn label:hover {
			color: #666;
		}
		 
		/* Disabled */
		.form_radio_btn input[type=radio] + label {
			background: #F9FAFC;
			color: #666;
		}
		
		
button
{
	border : none;		
	background: #184DA0;
	color: white;
}
		
body
{	
	font-family: 'Dongle';	
}
		
		
input[type='date'] {
color : white;
  border: none; 
  position: relative; 
  width: 100%;
  padding: 10px;
  background: url(../../../assets/Calendar.svg) no-repeat right 10px center /
  35px auto;
  background-color: #184DA0;
  box-shadow: 2px 2px 7px rgba(0, 0, 0, 0.2);
  border-radius: 8px;
  text-align: center;
  font-size: 100%;
  margin-bottom: 20px;
}

input[type='number'] {
  color : #184DA0;
  border: none; 
  position: relative; 
  width: 100%;
  padding: 10px;
  background: url(../../../assets/Calendar.svg) no-repeat right 10px center /
  35px auto;
  background-color: white;
  box-shadow: 2px 2px 7px rgba(0, 0, 0, 0.2);
  border-radius: 8px;
  text-align: center;
  font-size: 100%;
  margin-bottom: 20px;
}


select {
 color : white;
  border: none; 
  position: relative; 
  width: 100%;
  padding: 10px;
  background: url(../../../assets/Calendar.svg) no-repeat right 10px center /
  35px auto;
  background-color: #184DA0;
  box-shadow: 2px 2px 7px rgba(0, 0, 0, 0.2);
  border-radius: 8px;
  text-align: center;
  font-size: 100%;
  margin-bottom: 20px;
}

input[placeholder='예약번호']
{
	color:white;
}

input[type='date']::-webkit-calendar-picker-indicator {
  position: absolute; 
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  background: transparent; 
  color: transparent;
  cursor: pointer;
}

// type이 date인 input의 placeholder를 커스텀하기 위한 선택자
// 기본적으로 type date인 input은 placeholder가 먹히지 않기 때문이다!
input[type='date']::before 
{
  content: attr(placeholder);
  width: 100%;
  height: 100%;
}

from::before 
{
  content: attr(placeholder);
  width: 100%;
  height: 100%;
}

// input에 어떠한 유효값이 입력된 상태인지 확인하는 선택자
// 날짜를 선택하면 유효값이 입력된다.
// 이 속성을 활용하고자 한다면 반드시 태그에 required 속성을 달아줘야한다.
input[type='date']:valid::before {
  display: none; }
  
  from:valid::before {
  display: none; }
		
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
	
	
	$(function(){
	    $('[type="date"]').prop('min', function(){
	        return new Date().toJSON().split('T')[0];
	    });
	});

</script>

</head>
<body>


	<div class="main" align="center">
		<div class="form_radio_btn row-vh d-flex flex-row justify-content-center">
		<input type="radio" id="roundway" name="show" value="1" checked="checked" onchange="setDisplay()"/>
		<label class="form_radio_btn label" for="roundway">왕복</label>
		
		<input type="radio" id="oneway" name="show" value="2" onchange="setDisplay()"/>
		<label class="form_radio_btn label" for="oneway">편도</label>
		
		<input type="radio" id="checkinfo" name="show" value="3" onchange="setDisplay()"/>
		<label class="form_radio_btn label" for="checkinfo">체크인</label>
		</div>
		
		<div class="tripA">
			<div class="container">
				<div>
					<form action="<%=withFormTag%>" method="get">
						<input type="hidden" name="command" value="airList">
						<div class="search justify-content-center">
							<div class="from">
								<h3>From</h3>
								<input class="form-control " type="hidden" id="mode" name="mode"
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
									name="keyword3" placeholder="날짜를 선택해주세요">
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
									placeholder="번호를 입력해주세요">
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
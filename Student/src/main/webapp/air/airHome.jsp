<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
		
input[type='text'] {
  
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
  color : white;
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

.check_btn {
  color : #184DA0;
  border: none; 
  position: relative; 
  width: 10%;
  height : 5%;
  padding: 10px;
  background: url(../../../assets/Calendar.svg) no-repeat right 10px center /
  35px auto;
  background-color: white;
  box-shadow: 2px 2px 7px rgba(0, 0, 0, 0.2);
  border-radius: 8px;
  text-align: center;
  font-size: 100%;
  margin-left: 10px;
}


.search_btn {
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
}

.reset_btn {
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
  
  input::placeholder
  {
  color: white;}
  
		
</style>

<script type="text/javascript">
	$(document).ready(function() {
		$('.tripB').hide();
		$('.tripC').hide();

/* 		$('[type="date"]').prop('min', function(){
	        return new Date().toJSON().split('T')[0];
	    }); */
		
	});

	function setDisplay() 
	{
		if ($('input:radio[id=roundway]').is(':checked')) 
		{
			$('.tripA').show();
			$('.tripB').hide();
			$('.tripC').hide();
		} 
		else if($('input:radio[id=oneway]').is(':checked'))
		{
			$('.tripA').hide();
			$('.tripB').show();
			$('.tripC').hide();
		}
		else
		{
			$('.tripA').hide();
			$('.tripB').hide();
			$('.tripC').show();
		}
	}
	
	
 	$(function(){
	    $('[type="date"]').prop('min', function(){
	        return new Date().toJSON().split('T')[0];
	    });
	});

</script>

<script type="text/javascript">
	$(function() {

		$('.datepicker').daterangepicker({
			autoUpdateInput : false,
			"minDate" : new Date(),
			locale : {
				cancelLabel : 'Clear'
			}
		});
		
		//$( '.datepicker' ).datepicker({ minDate: 0 });
		
		// $('.datepicker').datepicker('setDate', 'today');
		//$('.datepicker').datepicker('minDate','-1D');
		 
		$('.datepicker').on( 'apply.daterangepicker', function(ev, picker) {	
					var startDate = picker.startDate;
					var endDate = picker.endDate;
					
					$('#keyword3').val(startDate.format('YYYY-MM-DD'));
					$('#keyword4').val(endDate.format('YYYY-MM-DD'));			
				});
		
		$('.datepicker').on('cancel.daterangepicker', function(ev, picker) {
			$(this).val('');
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
								<input class="form-control " type="hidden" id="mode" name="mode"
									value="depart"> <select id="keyword" name="keyword">
									<option value="all" selected="selected">출발지
									<option value="김포">김포
									<option value="인천">인천
									</option>
								</select>
							</div>


							<div class="to">
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
								<input type="hidden" id="mode3" name="mode3" value="detime">
								
								<input class="departdate datepicker" type="text" id="keyword3" 
									name="keyword3" placeholder="가는날">

							</div>

							<div class="arriveday">
								<input type="hidden" id="mode4" name="mode4" value="artime">
								<input class="arrivedate datepicker" type="text" id="keyword4"
									name="keyword4" placeholder="오는날">
							</div>
							
							
							<div class="find">
								<button type="submit" class="search_btn btn-primary"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
  								<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
								</svg></button>
							</div>
							
							
							<div class="reset">
							<button type="reset" class="reset_btn btn-primary"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-repeat" viewBox="0 0 16 16">
  							<path d="M11.534 7h3.932a.25.25 0 0 1 .192.41l-1.966 2.36a.25.25 0 0 1-.384 0l-1.966-2.36a.25.25 0 0 1 .192-.41zm-11 2h3.932a.25.25 0 0 0 .192-.41L2.692 6.23a.25.25 0 0 0-.384 0L.342 8.59A.25.25 0 0 0 .534 9z"/>
  							<path fill-rule="evenodd" d="M8 3c-1.552 0-2.94.707-3.857 1.818a.5.5 0 1 1-.771-.636A6.002 6.002 0 0 1 13.917 7H12.9A5.002 5.002 0 0 0 8 3zM3.1 9a5.002 5.002 0 0 0 8.757 2.182.5.5 0 1 1 .771.636A6.002 6.002 0 0 1 2.083 9H3.1z"/>
							</svg></button>
						</div>

						</div>
						
					</form>
				</div>
			</div>
		</div>
		
		<div class="tripB">
			<div class="container">
				<div>
					<form action="<%=withFormTag%>" method="get">
						<input type="hidden" name="command" value="airList">
						<div class="search justify-content-center">
							<div class="from">
								<input class="form-control " type="hidden" id="mode" name="mode"
									value="depart"> <select id="keyword" name="keyword">
									<option value="all" selected="selected">출발지
									<option value="김포">김포
									<option value="인천">인천
									</option>
								</select>
							</div>


							<div class="to">
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
								<input type="hidden" id="mode3" name="mode3" value="detime">
								
								<input class="departdate" type="date" id="keyword3" 
									name="keyword3" placeholder="가는날">
							</div>
							
							<input type="hidden" id="ones" name="ones" value="rest">
							
							<div class="find">
								<button type="submit" class="search_btn btn-primary"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
  								<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
								</svg></button>
							</div>
							
							
							<div class="reset">
							<button type="reset" class="reset_btn btn-primary"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-repeat" viewBox="0 0 16 16">
  							<path d="M11.534 7h3.932a.25.25 0 0 1 .192.41l-1.966 2.36a.25.25 0 0 1-.384 0l-1.966-2.36a.25.25 0 0 1 .192-.41zm-11 2h3.932a.25.25 0 0 0 .192-.41L2.692 6.23a.25.25 0 0 0-.384 0L.342 8.59A.25.25 0 0 0 .534 9z"/>
  							<path fill-rule="evenodd" d="M8 3c-1.552 0-2.94.707-3.857 1.818a.5.5 0 1 1-.771-.636A6.002 6.002 0 0 1 13.917 7H12.9A5.002 5.002 0 0 0 8 3zM3.1 9a5.002 5.002 0 0 0 8.757 2.182.5.5 0 1 1 .771.636A6.002 6.002 0 0 1 2.083 9H3.1z"/>
							</svg></button>
						</div>

						</div>
						
					</form>
				</div>
			</div>
		</div>

		
		
		

		<div class="tripC">
			<div class="container">
				<div>
					<form name="" action="<%=withFormTag%>" method="get">
						<input type="hidden" name="command" value="airCheck">
						<div class="search justify-content-center">
							<div class="from">
								<input class="form-control" type="number" id="regid" name="regid"
									placeholder="번호를 입력해주세요">
							</div>
							
							<button type="submit" class="check_btn btn-primary"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
  								<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
								</svg></button>
						</div>
					</form>
				</div>
			</div>
		</div>


		<div class="container mt-2">
			<div class="row">
			<h2 align="left">추천 여행지</h2>
				<div class="col-md-3 col-sm-6">
					<div class="card card-block">
						<h4 class="card-title text-right">
							<i class="material-icons"></i>
						</h4>
						<a
							href="<%=notWithFormTag%>airList&mode=depart&keyword=all&mode2=arrive&keyword2=일본&ones=rest">
							<img
							src="https://image.hanatour.com/usr/cms/resize/400_0/2022/09/05/10000/4d34420c-7d47-4835-becf-f04454a99d20.jpeg"
							alt="Photo of sunset">
						</a>
						<h5 class="card-title mt-3 mb-3">일본</h5>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="card card-block">
						<h4 class="card-title text-right">
							<i class="material-icons"></i>
						</h4>
						<a
							href="<%=notWithFormTag%>airList&mode=depart&keyword=all&mode2=arrive&keyword2=중국&ones=rest">
							<img
							src="https://image.hanatour.com/usr/cms/resize/400_0/2023/04/06/10000/49738def-cc04-494b-a597-d86128ef9a38.jpg"
							alt="Photo of sunset">
						</a>
						<h5 class="card-title  mt-3 mb-3">중국</h5>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="card card-block">
						<h4 class="card-title text-right">
							<i class="material-icons"></i>
						</h4>
						<a
							href="<%=notWithFormTag%>airList&mode=depart&keyword=all&mode2=arrive&keyword2=대만&ones=rest">
							<img
							src="https://image.hanatour.com/usr/cms/resize/400_0/2019/07/04/10000/a895c128-729e-448b-a9f2-ba66e6ce3503.jpg"
							alt="Photo of sunset">
						</a>
						<h5 class="card-title  mt-3 mb-3">대만</h5>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="card card-block">
						<h4 class="card-title text-right">
							<i class="material-icons"></i>
						</h4>
						<a
							href="<%=notWithFormTag%>airList&mode=depart&keyword=all&mode2=arrive&keyword2=괌&ones=rest">
							<img
							src="https://image.hanatour.com/usr/cms/resize/400_0/2022/10/12/10000/2a3c5702-2f0e-4438-934e-0ce5e696deb7.jpg"
							alt="Photo of sunset">
						</a>
						<h5 class="card-title  mt-3 mb-3">괌</h5>
					</div>
				</div>
			</div>

			</div>
			
			&nbsp;&nbsp;&nbsp;&nbsp;
			
	<div class="container mt-2">
			<h3 align="left">항공사 추천<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-airplane-engines" viewBox="0 0 16 16">
  <path d="M8 0c-.787 0-1.292.592-1.572 1.151A4.347 4.347 0 0 0 6 3v3.691l-2 1V7.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.191l-1.17.585A1.5 1.5 0 0 0 0 10.618V12a.5.5 0 0 0 .582.493l1.631-.272.313.937a.5.5 0 0 0 .948 0l.405-1.214 2.21-.369.375 2.253-1.318 1.318A.5.5 0 0 0 5.5 16h5a.5.5 0 0 0 .354-.854l-1.318-1.318.375-2.253 2.21.369.405 1.214a.5.5 0 0 0 .948 0l.313-.937 1.63.272A.5.5 0 0 0 16 12v-1.382a1.5 1.5 0 0 0-.83-1.342L14 8.691V7.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v.191l-2-1V3c0-.568-.14-1.271-.428-1.849C9.292.591 8.787 0 8 0ZM7 3c0-.432.11-.979.322-1.401C7.542 1.159 7.787 1 8 1c.213 0 .458.158.678.599C8.889 2.02 9 2.569 9 3v4a.5.5 0 0 0 .276.447l5.448 2.724a.5.5 0 0 1 .276.447v.792l-5.418-.903a.5.5 0 0 0-.575.41l-.5 3a.5.5 0 0 0 .14.437l.646.646H6.707l.647-.646a.5.5 0 0 0 .14-.436l-.5-3a.5.5 0 0 0-.576-.411L1 11.41v-.792a.5.5 0 0 1 .276-.447l5.448-2.724A.5.5 0 0 0 7 7V3Z"/>
</svg></h3>
			<div class="row">
				<div class="col-md-3 col-sm-6">
					<div class="card card-block">
						<h4 class="card-title text-right">
							<i class="material-icons"></i>
						</h4>
						<a
							href="<%=notWithFormTag%>airList&mode=fname&keyword=대한항공&ones=rest">
							<img
							src="data:image/jpeg;base64,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"
							alt="Photo of sunset">
						</a>
						<h5 class="card-title mt-3 mb-3">대한항공</h5>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="card card-block">
						<h4 class="card-title text-right">
							<i class="material-icons"></i>
						</h4>
						<a
							href="<%=notWithFormTag%>airList&mode=fname&keyword=아시아나&ones=rest">
							<img
							src="https://image.hanatour.com/usr/manual/img/air/OZ.jpg"
							alt="Photo of sunset">
						</a>
						<h5 class="card-title  mt-3 mb-3">아시아나</h5>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="card card-block">
						<h4 class="card-title text-right">
							<i class="material-icons"></i>
						</h4>
						<a
							href="<%=notWithFormTag%>airList&mode=fname&keyword=티웨이&ones=rest">
							<img
							src="https://image.hanatour.com/usr/manual/img/air/TW.jpg"
							alt="Photo of sunset">
						</a>
						<h5 class="card-title  mt-3 mb-3">티웨이</h5>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="card card-block">
						<h4 class="card-title text-right">
							<i class="material-icons"></i>
						</h4>
						<a
							href="<%=notWithFormTag%>airList&mode=fname&keyword=제주&ones=rest">
							<img
							src="https://image.hanatour.com/usr/manual/img/air/7C.jpg"
							alt="Photo of sunset">
						</a>
						<h5 class="card-title  mt-3 mb-3">제주항공</h5>
					</div>
				</div>
			</div>

			</div>
		</div>
</body>
</html>
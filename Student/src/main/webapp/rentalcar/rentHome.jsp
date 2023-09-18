<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<%@ include file="./../common/bootstrap5.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>Insert title here</title>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />


	<!-- kakao map api -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=72eb84a62edf4d4ab7f08e47e8ca4b6d"></script>
	
	<script>
	/* kakaoMap */
		$(function() {	
			/* kakao map */
			var container = document.getElementById('map');
			var options = {
				center: new kakao.maps.LatLng(33.450701, 126.570667),
				level: 3
			};
			var map = new kakao.maps.Map(container, options);
		});	
	</script>
	
	<script type="text/javascript">
		/* datepicker */
		$(function() {
			$('input[name="datefilter"]').daterangepicker({
				timePicker : true,
				autoUpdateInput : false,
				locale : {
					cancelLabel : 'Clear'
				}
			});
	
			$('input[name="datefilter"]').on(
					'apply.daterangepicker',
					function(ev, picker) {
						$(this).val(
								picker.startDate.format('MM/DD/YYYY') + ' - '
										+ picker.endDate.format('MM/DD/YYYY'));
					});
	
			$('input[name="datefilter"]').on('cancel.daterangepicker',
					function(ev, picker) {
						$(this).val('');
					});
			$('#fullpage').fullpage({
				slideNavigation: true,
				responsiveWidth: 1024;
			autoScrolling: true
			});
			
			
			
		});	
	</script>

	<style>
	#search-box{
	  border: 2px solid yellow;  
	  padding: 10px;
	  margin-left: 10%;
	  margin-right: 10%;
	  background: orange;
	   
	  border-radius: 30px;  
	}
	.title{
		color: green;
		
	}

	
	
	/* <div id="map" style="width: 300px; height: 300px; position: center;"></div> */
	</style>
</head>
<body>	
	<div>
		<div class="section">
		<h1 class="container mt-3">렌터카</h1>
		<p>대충 렌터카 설명</p>
		<main>
			<form action="" method="post">
				<!-- 추후 도착 url 설정 -->

				<div class="row" id="search-box">
					<div class="col">
						<input class="form-control" type="text" value="" placeholder="픽업장소" />
					</div>
					<div class="col">
						<input class="form-control" type="text" value="" placeholder="반납장소" />
					</div>
					<div class="col">
						<input class="form-control" type="text" name="datefilter" value="" placeholder="📅픽업일" />
					</div>
					<div class="col">
						<input class="form-control" type="text" name="datefilter" value="" placeholder="📅반납일" />
					</div>
					<span class="col" >
						<button type="submit" class="btn btn-primary">검색</button>
					</span>					
				</div>
			</form>
		</main>
		</div>
		
		<div class="section" id="section">
		
		</div>

	</div>
</body>

</html>
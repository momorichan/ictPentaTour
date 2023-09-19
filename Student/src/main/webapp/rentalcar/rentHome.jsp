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
	<!-- kakao map -->
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
	
	<!--  datepicker 날짜선택 -->
	<script type="text/javascript">
		
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
	
	
	<script type="text/javascript">
		$(document).ready(function() {	
			var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
			var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
				return new bootstrap.Tooltip(tooltipTriggerEl)
			});		
		});
	</script>
	<script type="text/javascript">
	$(function() {
		  $("#name").keyup(function() {

		    const recommendBox = document.querySelector("#suggestion_box");
		    
		    // invisible을 지워준다.
		    recommendBox.classList.remove('invisible');
		    const input_name = document.getElementById("#name");
		    
		    // 기존 검색 추천 데이터 지우고, 새로 넣어주기 안 그러면 계속 추가됨
		    recommendBox.innerHTML = "";

		    const suggestedItems = document.createElement('div')
		    suggestedItems.id = "suggested_items"

		    recommendBox.appendChild(suggestedItems);

		    // item별 리스트
		    var items = ['서울', '강남', '인천', '강원', '충북', '제주']; // db연동해야함
		    
		    // for문 돌면서 item 추가
		    for (var i in items) {

		      var player_content = document.createTextNode(items[i]);
		      var suggestedItem = document.createElement('div')
		      suggestedItem.className = "item"

		      suggestedItem.addEventListener('click', function(e){
		        document.getElementById("name").value = this.textContent.split(' ')[0];
		      });

		      suggestedItem.appendChild(player_content);
		      suggestedItems.appendChild(suggestedItem);
		    }
		  })
		  
		  function closeKeywords() {
			   /* keywords.style.display = "none" */
			   name.style.display = "none" 
			   keywords.innerHTML = ""
			}
	      if(e.key === "Escape") {
	        	closeKeywords()
   		  }
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
	
	/* 장소 검색 */
	#suggested_items{
	    height:100px;
	    width: 250px;
	    overflow: auto; /* 스크롤바 추가 */
    }
	/* 마우스 올리면 색 변화 */
		.item:hover{
	    color: #fff;
	    background-color: lightgreen;
	}
	#name{
		.invisible{
	    display: none;
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
						<input type="text" id="name" autocomplete="off" 						 
						class="form-control"  value="" placeholder="픽업장소"
						data-bs-toggle="tooltip" title="" data-bs-placement="bottom"/>				
					</div>
					<div id="suggestion_box" class="invisible">
						<div id="suggested_items"></div> 
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
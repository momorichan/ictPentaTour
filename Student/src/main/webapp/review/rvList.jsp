<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="./../common/common.jsp"%>
<%@ include file="./../common/bootstrap5.jsp"%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
		$(document).ready(function(){
			var optionList = $('#mode option');
			for(var i=0 ; i<optionList.length ; i++){
				if(optionList[i].value == '${requestScope.pageInfo.mode}'){
					optionList[i].selected = true ;
				}	
			}
			
			$('#keyword').val('${requestScope.pageInfo.keyword}');
			
			$("#mode").change(function(){				 
				  if($(this).val() != 'all'){
					  $('#keyword').attr('disabled', false);
				  }else{
					  $('#keyword').val('');
					  $('#keyword').attr('disabled', true);
				  }
			});			
		});
		
		function searchAll(){ /* 전체 검색 */
			location.href = '<%=notWithFormTag%>rvList';
		}
		
		function writeForm(){ /* 글쓰기 */
			location.href = '<%=notWithFormTag%>rvInsert';
		}
		
	</script>
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
.rvList_image {
	position: relative;
	
}

.rvList_image_text {
	position: absolute;
	top: 50%;
	left: 50%;
	color: white;
	transform: translate(-50%, -50%);
}

.progress-bar {
    width: 100%;
    height: 30px;
    background-color: #dedede;
    font-weight: 600;
    font-size: .8rem;
}

.progress {
    height: 30px;
    padding: 0;
    text-align: center;
    background-color: #4F98FF;
    color: #111;
}
.rating_box{
	float : right;
}
.rating_main_left {
    width: 50%;
    float: left;
    box-sizing: border-box;  
    }
.rating_main_right {
     width: 50%;
     float: right;
     box-sizing: border-box;
    }
.point_txt{
 	width: 600px;height: 400px;
	line-height: 100px; /* 세로 가운데 정렬 : line-height와 height값을 동일하게 처리합니다.*/
	text-align: center /* 텍스트 가운데 정렬 */
}
</style>
</head>
<body>
	<div class="head">
	<div class = "rvList_image">
	 	<img alt="사진이 어디갔더라" src="https://cdn.pixabay.com/photo/2021/09/07/11/53/car-6603726_640.jpg" height="300px;" width="100%;">
	 		 <h1 class="rvList_image_text" style="font-size:50px">여행 후기</h1>
	 </div>
	</div>
	<div class="wrap">중간
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
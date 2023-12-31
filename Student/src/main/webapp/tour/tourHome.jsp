<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="./../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<!-- http-equiv=Refresh content=1 -->
<meta charset="UTF-8" >
<title>투어 홈 - ICTPentaTour</title>
<script type="text/javascript">
$(document).ready(function(){
   // Initialize popoveer
   var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
   var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
        return new bootstrap.Popover(popoverTriggerEl);
   });
   if(window.innerWidth < 501) {
		$(".slide-div, .card-title, .card, .card-img-top, .serchcon, .tablecon, .tablecon-2").addClass("mobile");
	}else{
		$(".slide-div, .card-title, .card, .card-img-top, .serchcon, .tablecon, .tablecon-2").removeClass("mobile");
	}
});
function searchAll(){ /* 전체 검색 */
	location.href = '<%=notWithFormTag%>tourHome';
	}

function deleteCheck(toid){
	if(confirm("정말 삭제하시겠습니까?") == true){
		location.href = "<%=notWithFormTag%>tourDelete&toid=" + toid;
		alert('삭제되었습니다.');
	}else{
		return false;
	}
}

window.addEventListener('resize', () => {
	if(window.innerWidth < 501) {
		$(".slide-div, .card-title, .card, .card-img-top, .serchcon, .tablecon, .tablecon-2").addClass("mobile");
	}
	if(window.innerWidth >= 501) {
		$(".slide-div, .card-title, .card, .card-img-top, .serchcon, .tablecon, .tablecon-2").removeClass("mobile");
	}
});
</script>
<link href="../css/jquery-picZoomer.css">

<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Noto+Sans+KR&display=swap');
	.card-img-top{
		width: 300px;
		height: 250px;	
	}
	.card-img-top:hover{
		width: 300px;
		height: 250px;	
		filter: brightness(1.1);
	}
	.container-main{
		
	}
    .card{
    	width: 302px;
		height: 430px;
    	margin-left:auto;
    	margin-right:auto;
    }
    .price {
    	text-align: right;
    	margin:0px;
    }
    button-div{
    	margin-left:10px;
    }
    
    #modify{
    	margin-left: 16px;
    }
    #modify{
    	content: 수정;
    }
    .search{
	margin-bottom: 10px;
	}
	.serchcon{
		width: 555px;
	}
	.categorycon{
		margin-right: 0px;
		width: 250px;
	}
	#search{
		border-radius: 0px, 10px, 10px, 0px;
	}
	.floating{
		position:fixed;
		right: 50%;
		top:180px;
		margin-right: -720px;
		text-align: center;
		width: 120px;
		z-index: 3;
	}
	.tablecon{
		
	}
	.floatingcon{
		position: absolute;
		left: 0%;
	}
	.pur-btn-div{
		margin-top:0px;
		margin-bottom:auto;
		display:flex;
		justify-content: center;
	}
    .slide-div{
		justify-content: center;
 		display: block;
 		width:1106px;
 		height:220px;
		margin-left:auto;
		margin-right:auto;
		margin-top:20px;
		margin-bottom:20px;
		border-radius: 10px;
	}
	.slide-image-div{
		width: 100%;
		height: 220px;
		margin:0 0;
		overflow:hidden;
		display: block;
		border-radius: 10px;
	}
	.d-block{
 		height:220px; 
 		border-radius: 10px; 
	}
	body{
		padding-top:70px;
		width:100%;
		min-width:100%;
		margin: 0px;
		font-family: 'Noto Sans KR', sans-serif;
		-webkit-font-smoothing: antialiased;
   		-moz-osx-font-smoothing: grayscale;
	}
	.container{
		max-width:1226.7px;
		display: block;
		justify-content: center;
		margin-left:auto;
		margin-right:auto;
	}
	.btn-insert {
		position:relative;
		z-index: 1;
	}
	.card.mobile {
    width: 215px;
    height: 322px;
    margin-left: auto;
    margin-right: auto;
	}
	.card-title.mobile {
	    font-size: 1.0rem;
	}
	.card-img-top.mobile {
	    width: 213px;
	    height: 150px;
	}
	.card-img-top:hover.mobile{
		width: 213px;
		height: 150px;	
		filter: brightness(1.1);
	}
</style>
</head>
<body>
	<div class="container container-main">
		<h2 style="text-align:center;">투어</h2>
		<div class="slide-div">
			<div class="slide-image-div">
				<div id="demo" class="carousel slide" data-bs-ride="carousel">
					<div class="carousel-indicators">
						<button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
						<button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
						<button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
					</div>
					<div class="carousel-inner">
<%-- 						<c:forEach var="bean" items="${requestScope.eventlists }"> --%>
						<div class="carousel-item active">
							<img src="/Student/upload/상단배너01.png" alt="상단배너01.png" class="d-block" style="width:100%">
						</div>
						<div class="carousel-item">
							<img src="/Student/upload/상단배너02.jpg" alt="상단배너02.jpg" class="d-block" style="width:100%">
						</div>
						<div class="carousel-item">
							<img src="/Student/upload/상단배너03.jpg" alt="상단배너03.jpg" class="d-block" style="width:100%">
						</div>
<%-- 						</c:forEach> --%>
					</div>
					<button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
						<span class="carousel-control-prev-icon"></span>
					</button>
					<button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
						<span class="carousel-control-next-icon"></span>
					</button>
				</div>
			</div>
		</div>
		<form action="<%=withFormTag %>">
			<input type="hidden" name="command" value="tourHome">
			<div class="container serchcon">
				<div class="justify-content-center input-group search">
					<select class="form-select" id="mode" name="mode" >
						<option value="tname" ${selecttname}>티켓 이름
						<option value="location" ${selectlocation}>지역
					</select>
					<input type="text" class="input-group-text" id="keyword" name="keyword" style="width:250px;" value="${pageInfo.getKeyword()}">
					<button type="submit" class="btn btn-secondary rounded" value="search">검색</button>
					<button type="button" class="btn btn-dark rounded" onclick="searchAll();" style="margin-left:5px;">전체 검색</button>
				</div>
			</div>
		</form>
		<div class="tablecon">
			<table class="table table-borderless">
				<thead>
					<div class="input-group" style="margin-left:8px;">
						<span class="label label-info">${pageInfo.pagingStatus }</span>
					</div>
				</thead>
				<tbody>
					<c:set var="colsu" value="3"/>
					<c:forEach var="bean" items="${sessionScope.datalist }" varStatus="asdf">
						<c:if test="${asdf.index % colsu == 0}">
							<tr></tr>
						</c:if>
							<td>
								<div class = "card">
									<div class="removeUnderLine">
										<img class = "card-img-top" alt="${bean.timage01 }" src="/Student/upload/${bean.timage01 }">
										<div class = "card-body">
											<p>${bean.location }
											<h5 class = "card-title">${bean.tname}</h5>
											<p class = "price" id="price1"><fmt:formatNumber value="${bean.tprice}" pattern="#,###" />원</p>
										</div>
										<div class="pur-btn-div">
											<a href="<%=notWithFormTag%>tourDetail&toid=${bean.toid}" class="purchasebtn btn btn-outline-secondary">예매하기</a>
										</div>
									</div>
								</div>
							</td>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="tablecon-2">
			<table class="table table-borderless">
				<thead>
					<div class="input-group" style="margin-left:8px;">
						<span class="label label-info">${pageInfo.pagingStatus }</span>
					</div>
				</thead>
				<tbody>
					<c:set var="colsu" value="2"/>
					<c:forEach var="bean" items="${sessionScope.datalist }" varStatus="asdf">
						<c:if test="${asdf.index % colsu == 0}">
							<tr></tr>
						</c:if>
							<td>
								<div class = "card">
									<div class="removeUnderLine">
										<img class = "card-img-top" alt="${bean.timage01 }" src="/Student/upload/${bean.timage01 }">
										<div class = "card-body">
											<p>${bean.location }</p>
											<h5 class = "card-title">${bean.tname}</h5>
											<p class = "price"><fmt:formatNumber value="${bean.tprice}" pattern="#,###" />원</p>
										</div>
										<div class="pur-btn-div">
											<a href="<%=notWithFormTag%>tourDetail&toid=${bean.toid}" class="purchasebtn btn btn-outline-secondary">예매하기</a>
										</div>
									</div>
								</div>
							</td>
					</c:forEach>
				</tbody>
			</table>
		</div>
		${pageInfo.pagingHtml}
		<button type="button" class="btn-insert btn btn-outline-primary" onclick="location.href='<%=notWithFormTag %>tourInsert'">등록</button>
	</div>
</body>
</html>
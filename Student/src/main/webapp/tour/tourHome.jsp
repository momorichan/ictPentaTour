<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="./../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<!-- http-equiv=Refresh content=1 -->
<meta charset="UTF-8" >
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
   // Initialize popoveer
   var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
   var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
        return new bootstrap.Popover(popoverTriggerEl);
   });
});
function searchAll(){ /* 전체 검색 */
	location.href = '<%=notWithFormTag%>tourList';
	}

function deleteCheck(toid){
	if(confirm("정말 삭제하시겠습니까?") == true){
		location.href = "<%=notWithFormTag%>tourDelete&toid=" + toid;
		alert('삭제되었습니다.');
	}else{
		return false;
	}
}
</script>
<link href="../css/jquery-picZoomer.css">
<style type="text/css">
	.card-img-top{
		width: 300px;
		height: 250px;	
	}
	/* table 셀의 수평 가운데 정렬 */
	.container-main{
		
	}
    .card{
    	width: 302px;
		height: 420px;
    	margin-left:auto;
    	margin-right:auto;
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
		width:100%;
		min-width:100%;
		margin: 0px;
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
</style>
</head>
<body>
	<div class="container container-main">
		<h2>투어</h2>
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
			<input type="hidden" name="command" value="tourList">
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
					<c:forEach var="bean" items="${requestScope.datalist }" varStatus="asdf">
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
											<p class = "card-text">										
											</p>
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
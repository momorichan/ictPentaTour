<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="./../common/bootstrap5.jsp"%>
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
<c:if test="${whologin == '2'}">
	<style type="text/css">
	.card{
		width: 200px;
		height: 430px;
	}
	</style>
</c:if>
<c:if test="${whologin != '2'}">
	<style type="text/css">
	.card{
		width: 200px;
		height: 370px;
	}
</style>
</c:if>
<style type="text/css">
	.card-img-top{
		width: 302px;
		height: 250px;	
	}
	/* table 셀의 수평 가운데 정렬 */
	.container-main{
		
	}
    .card{
    	margin-left:auto;
    	margin-right:auto;
    }
    .removeUnderLine{
   		 text-decoration-line: none;
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
		width: 645px;
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
		z-index: 1;
	}
	.tablecon{
		
	}
	.floatingcon{
		position: absolute;
		left: 0%;
	}
</style>
<c:if test="${whologin != '2'}">
	<style type="text/css">
	.serchcon{
		width: 555px;
	}
	</style>
</c:if>
</head>
<body>
	<div class="container container-main">
		<h2>티켓 목록</h2>
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
					<c:if test="${whologin == '2'}">
						<button type="button" class="btn btn-primary rounded" onclick="writeForm();" style="margin-left:5px;">상품 등록</button>
					</c:if>
				</div>
			</div>
		</form>
		<%-- <form action="<%=withFormTag %>">
			<input type="hidden" name="command" value="tourList">
			<div class="floatingcon">
				<div class="floating">
					<div class = "container categorycon">
						<div class = "justify-content-end input-group categorydiv">
							<select class = "form-select" id = "category" name  = "category">
								<option selected="selected" value="none">카테고리
								<c:forEach var="category" items="${requestScope.categories }">
									<c:if test="${category.ordering != 1 }">
										<c:if test="${category.engname != selectcategory }">
											<option value = "${category.engname }">${category.korname }
										</c:if>
										<c:if test="${category.engname == selectcategory }">
											<option value = "${category.engname }" selected="selected">${category.korname }
										</c:if>
									</c:if>
								</c:forEach>
							</select>
							<button type="submit" class="btn btn-info" style="color:white;">변경</button>
						</div>
					</div>
				</div>
			</div>
		</form> --%>
		<div class="tablecon">
			<table class="table table-borderless">
				<thead>
					<div class="input-group" style="margin-left:8px;">
						<span class="label label-info">${pageInfo.pagingStatus }</span>
					</div>
				</thead>
				<tbody>
					<c:set var="colsu" value="${applicationScope.map['product_list_column_size']}"/>
					<c:forEach var="bean" items="${requestScope.datalist }" varStatus="asdf">
						<c:if test="${asdf.index % colsu == 0}">
							<tr></tr>
						</c:if>
							<td>
								<div class = "card" style = "width : 19rem" >
									<a href="<%=notWithFormTag%>tourDetail&toid=${bean.toid}" class="removeUnderLine">
										<img class = "card-img-top" alt="${bean.timage01 }" src="/Student/upload/${bean.timage01 }">
										<div class = "card-body">
											<p>${bean.location }
											<h5 class = "card-title">${bean.tname}</h5>
											<p class = "card-text">										
												<span
												data-bs-toggle="popover"
												data-bs-content="${bean.tcontent}"
												data-bs-trigger="hover">
												<c:if test="${fn:length(bean.tcontent) >= 18}">
													${fn:substring(bean.tcontent, 0, 18)}...
												</c:if>
												</span>
											</p>
												<c:if test="${fn:length(bean.tcontent) < 18}">
													${bean.tcontent}
												</c:if>
										</div>
									</a>
									<c:if test="${whologin == '2'}">
										<div class="button-div">
											<button type="button" class = "btn btn-sm btn-outline-primary" type="button" id = "modify" name = "modify" 
													value="수정${bean.tnum }" onclick="location.href='<%=notWithFormTag%>prUpdate&pnum=${bean.tnum}'" >수정</button>
											<button type="button" class = "btn btn-sm btn-outline-danger" type="button" id = "delete" name = "delete" 
													value="삭제${bean.tnum }" onclick="deleteCheck(${bean.tnum})">삭제</button>
										</div>
									</c:if>	
								</div>
							</td>
					</c:forEach>
				</tbody>
			</table>
		</div>
		${pageInfo.pagingHtml}
		<button type="button" class="btn btn-outline-primary" onclick="location.href='<%=notWithFormTag %>tourInsert'">등록</button>
	</div>
</body>
</html>
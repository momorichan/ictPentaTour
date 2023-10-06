<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<<<<<<< HEAD

<meta charset="UTF-8">
<title>rcList</title>



<!-- datepicker  -->
<script type="text/javascript">
	$(function() {

		$('.datepicker').daterangepicker({
			autoUpdateInput : false,
			locale : {
				cancelLabel : 'Clear'
			}
		});
		$('.datepicker').on(
				'apply.daterangepicker',
				function(ev, picker) {
					var startDate = picker.startDate;
					var endDate = picker.endDate;
					
					
					$('#startDate').val(startDate.format('YYYY/MM/DD'));
					$('#endDate').val(endDate.format('YYYY/MM/DD'));
					
					console.log($('#startDate').val(startDate.format('YYYY/MM/DD')));					
					
				});
		
		$('.datepicker').on('cancel.daterangepicker', function(ev, picker) {
			$(this).val('');
		});	
	});
</script>
<!-- mod, keyword -> startLocation, endLocation, startDate, endDate 교체 예정 -->
<script type="text/javascript">
	$(document).ready(function() {	
		/* 새로고침 select 고정 */
// 		var optionListSL = $('#startLocation option');
// 		for (var i = 0; i < optionListSL.length; i++) {
// 			if (optionListSL[i].value == '${requestScope.pageInfo.startLocation}') {
// 				optionListSL[i].selected = true;
// 			}
// 		}
// 		var optionListEL = $('#endLocation option');
// 		for (var i = 0; i < optionListSL.length; i++) {
// 			if (optionListEL[i].value == '${requestScope.pageInfo.endLocation}') {
// 				optionListEL[i].selected = true;
// 			}
// 		}	
		$('#startLocation').change(function() {
			if ($(this).val() == 'all') {
				swal('대여 장소를 선택해주세요.');
			} else {
				console.log("대여 장소: " + $(this).val());
				$('#keyword').attr('disabled', false);
			}
		});
	
		
		$('#endLocation').change(function() {
			if ($(this).val() == 'all') {
				swal('반납 장소를 선택해주세요.');
			} else {
				console.log("반납 장소: " + $(this).val());
				$('#keyword').attr('disabled', false);
			}
		});
		
		
		function searchAll(){ /* 전체 검색 */
			location.href = '<%=notWithFormTag%>rcList';
		}	
	});
</script>
<style type="text/css">
	.col{
		align-content: center;
	}
</style>


</head>
<body>
<!-- search -->
	<div class="container">
		<h2>렌트카</h2>
		<p>렌트카 예약 페이지 입니다.</p>
		<div class="row">
			<div class="col">
				<form name="myform" action="<%=withFormTag%>" method="get">
					<input type="hidden" name="command" value="rcList">
					<div class="row">
						<div class="col">
							<select class="form-control-sm" id="startLocation"
								name="startLocation">
								<option value="all" selected="selected">--대여 장소---
								<option value="seoul">서울
								<option value="daejeon">대전
								<option value="daegu">대구
								<option value="busan">부산
								<option value="jeju">제주
							</select> 
							<select class="form-control-sm" id="endLocation"
								name="endLocation" >
								<option value="all" selected="selected">--반납 장소--
								<option value="seoul">서울
								<option value="daejeon">대전
								<option value="daegu">대구
								<option value="busan">부산
								<option value="jeju">제주
							</select>
							<!-- <input class="form-control-sm" type="text" name="keyword"
												id="keyword" placeholder="키워드 입력"> -->
							<input class="form-control-sm datepicker" type="text" 
							name="startDate" id="startDate" autocomplete="off" 
								 placeholder="📅대여일" />
						 <input class="form-control-sm datepicker" type="text" 
						name="endDate" id="endDate" autocomplete="off"
							 placeholder="📅반납일" />


							<button type="submit" class="btn btn-warning form-control-sm"
								onclick="">검색</button>							
							<span class="label label-default">${requestScope.pageInfo.pagingStatus}</span>
						</div>
					</div>
				</form>
			</div>
			<div class="col-sm-1"></div>
		</div>

		<table class="table table-borderless">
				<thead>
				</thead>
				<tbody>				
				<c:set var="colsu" value="${applicationScope.map['rentalcar_list_column_size']}"/>
								
				<c:forEach var="bean" items="${requestScope.datalist}" varStatus="status">
					<c:if test="${status.index mod colsu == 0}">
											
					</c:if>				 
					<td> 
						<div class="card" style="width:19rem;">
							<a class="removeUnderLine"  href="<%=notWithFormTag%>rcDetail&rcid=${bean.rcid}${requestScope.pageInfo.flowParameter}">
								<!-- carName 작업 ing -->
								<img class="card-img-top" alt="${bean.carName}" src="/Student/upload/${bean.carImage01}">
								<div class="card-body"> 
									<h5 class="card-title">${bean.carName}</h5> 
									<p class="card-text">
										<span data-bs-toggle="popover" 
											title="${bean.carName}" 
											data-bs-trigger="hover"
											data-bs-content="${bean.carName}">											
										</span>				
									</p>
									<!-- 관리자 로그인 시... -->
	    							<c:if test="${whologin == 2}">	    							
	    								<div id="buttonList">
	    									<a id="updateAnchor" class="btn btn-info"
	    									href="<%=notWithFormTag%>rcUpdate&rcid=${bean.rcid}${requestScope.pageInfo.flowParameter}">
		    									수정
		    								</a>		    								
	    									<a id="deleteAnchor" class="btn btn-info"
	    									href="<%=notWithFormTag%>rcDelete&rcid=${bean.rcid}${requestScope.pageInfo.flowParameter}">
		    									삭제
		    								</a>		    								
	    								</div>		    							
	    							</c:if>
								</div>
							</a>
						</div>
					</td>
					<c:if test="${status.index mod colsu == (colsu-1)}">						
					</c:if>
				</c:forEach>			
			</tbody>
		</table>		
		${requestScope.pageInfo.pagingHtml}
=======
	
	<meta charset="UTF-8">
	<title>rcList</title>
	<style type="text/css">
	.col{
		align-content: center;
	}
	.container2 {
		display: grid;
		grid-template-columns: repeat(3, 1fr);
		grid-template-rows: repeat(3, minmax(100px, auto));
		align-item: stretch;
		
		row-gap: 20px;
		column-gap: 20px;
	}
	.container_Detail {
		display: grid;
		grid-template-columns: 24px 48px 24px 48px 24px 100px;
/*    		grid-template-rows: 24px 48px 24px 48px ;    */
		align-item: stretch;
		
		row-gap: 10px;
		column-gap: 0px;
	}
	.removeUnderLine{
		color: black;
		text-decoration-line: none;
	}
	.item {
		border: 2px;
		border-radius: 5%;
		box-shadow: 1px 1px 3px 1px #dadce0;
		background-color: #ffffff;
        border-radius: 5%;	
	}	
	.item:hover {
		background-color: #eeeeee;
        border-color: #bbb;
        border-radius: 5%;
        cursor: pointer;
	}
	
	</style>
	<!-- datepicker  -->
	<script type="text/javascript">
		$(function() {
	
			$('.datepicker').daterangepicker({
				autoUpdateInput : false,
				locale : {
					cancelLabel : 'Clear'
				}
			});
			$('.datepicker').on(
					'apply.daterangepicker',
					function(ev, picker) {
						var startDate = picker.startDate;
						var endDate = picker.endDate;
						
						
						$('#startDate').val(startDate.format('YYYY/MM/DD'));
						$('#endDate').val(endDate.format('YYYY/MM/DD'));
						
						console.log($('#startDate').val(startDate.format('YYYY/MM/DD')));					
						
					});
			
			$('.datepicker').on('cancel.daterangepicker', function(ev, picker) {
				$(this).val('');
			});	
		});
	</script>
	<script type="text/javascript">
		$(document).ready(function() {	
			/* 새로고침 select 고정 */
	// 		var optionListSL = $('#startLocation option');
	// 		for (var i = 0; i < optionListSL.length; i++) {
	// 			if (optionListSL[i].value == '${requestScope.pageInfo.startLocation}') {
	// 				optionListSL[i].selected = true;
	// 			}
	// 		}
	// 		var optionListEL = $('#endLocation option');
	// 		for (var i = 0; i < optionListSL.length; i++) {
	// 			if (optionListEL[i].value == '${requestScope.pageInfo.endLocation}') {
	// 				optionListEL[i].selected = true;
	// 			}
	// 		}	
			$('#startLocation').change(function() {
				if ($(this).val() == 'all') {
					swal('대여 장소를 선택해주세요.');
				} else {
					console.log("대여 장소: " + $(this).val());
					$('#keyword').attr('disabled', false);
				}
			});
		
			
			$('#endLocation').change(function() {
				if ($(this).val() == 'all') {
					swal('반납 장소를 선택해주세요.');
				} else {
					console.log("반납 장소: " + $(this).val());
					$('#keyword').attr('disabled', false);
				}
			});
			
			
			function searchAll(){ /* 전체 검색 */
				location.href = '<%=notWithFormTag%>rcList';
			}	
		});
	</script>
</head>
<body>
<!-- search -->
	<div class="container">
		<h2>렌트카</h2>
		<p>렌트카 예약 페이지 입니다.</p>
		<div class="row ">
			<div class="col">
				<form name="myform" action="<%=withFormTag%>" method="get">
					<input type="hidden" name="command" value="rcList">
					<div class="row">
						<div class="col">
							<select class="form-control-sm" id="startLocation"
								name="startLocation">
								<option value="all" selected="selected">--대여 장소---
								<option value="seoul">서울
								<option value="daejeon">대전
								<option value="daegu">대구
								<option value="busan">부산
								<option value="jeju">제주
							</select> 
							<select class="form-control-sm" id="endLocation"
								name="endLocation" >
								<option value="all" selected="selected">--반납 장소--
								<option value="seoul">서울
								<option value="daejeon">대전
								<option value="daegu">대구
								<option value="busan">부산
								<option value="jeju">제주
							</select>
							<!-- <input class="form-control-sm" type="text" name="keyword"
												id="keyword" placeholder="키워드 입력"> -->
							<input class="form-control-sm datepicker" type="text" 
							name="startDate" id="startDate" autocomplete="off" 
								 placeholder="📅대여일" />
						 <input class="form-control-sm datepicker" type="text" 
						name="endDate" id="endDate" autocomplete="off"
							 placeholder="📅반납일" />
							<button type="submit" class="btn btn-warning form-control-sm"
								onclick="">검색</button>							
							<span class="label label-default">${requestScope.pageInfo.pagingStatus}</span>
						</div>
					</div>
				</form>
			</div>
<!-- 			<div class="col-sm-1"></div> -->
		</div>
		
		<div class ="container23">
		<table class="table table-borderless " >
				<thead>
				</thead>
				<tbody>				
				<c:set var="colsu" value="${applicationScope.map['rentalcar_list_column_size']}"/>
								
				<c:forEach var="bean" items="${requestScope.datalist}" varStatus="status">
					<c:if test="${status.index mod colsu == 0}">
						<tr>													
					</c:if>				 
					<td> 
						<div class="card item" style="width:19rem;">
							<a class="removeUnderLine"  href="<%=notWithFormTag%>rcDetail&rcid=${bean.rcid}${requestScope.pageInfo.flowParameter}">
								<!-- carName 작업 ing -->
								<img class="card-img-top" alt="${bean.carName}" src="upload/${bean.carImage01}">
								<div class="card-body"> 
									<h5 class="card-title">${bean.carName}</h5> 
									<p class="card-text">
										<span data-bs-toggle="popover" 
											title="${bean.carName}" 
											data-bs-trigger="hover"
											data-bs-content="${bean.carName}">											
										</span>				
									</p>
									<div class="container_Detail">
											<img src="${pageContext.request.contextPath}/image/passengers.png">
											${bean.passengers}명
											<img src="${pageContext.request.contextPath}/image/car.png">
											${bean.carType}
											<img src="${pageContext.request.contextPath}/image/credit.png">
											<fmt:formatNumber type="number" value="${bean.price}" pattern="###,###"/>																				
									</div>
									<!-- 관리자 로그인 시... -->
	    							<c:if test="${whologin == 2}">	    							
	    								<div id="buttonList">
	    									<a id="updateAnchor" class="btn btn-info"
	    									href="<%=notWithFormTag%>rcUpdate&rcid=${bean.rcid}${requestScope.pageInfo.flowParameter}">
		    									수정
		    								</a>		    								
	    									<a id="deleteAnchor" class="btn btn-info"
	    									href="<%=notWithFormTag%>rcDelete&rcid=${bean.rcid}${requestScope.pageInfo.flowParameter}">
		    									삭제
		    								</a>		    								
	    								</div>		    							
	    							</c:if>
								</div>
							</a>
						</div>
					</td>
					<c:if test="${status.index mod colsu == (colsu-1)}">
						</tr>						
					</c:if>
				</c:forEach>			
			</tbody>
		</table>
		</div>		
<%-- 		${requestScope.pageInfo.pagingHtml} --%>
>>>>>>> refs/remotes/origin/rentalcar
	</div>
</body>
</html>
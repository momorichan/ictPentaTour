<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>rcList</title>


<!-- mod, keyword -> startLocation, endLocation, startDate, endDate 교체 예정 -->
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						const optionListSL = $('#startLocation option');
						for (var i = 0; i < optionListSL.length; i++) {
							if (optionListSL[i].value == '${requestScope.pageInfo.startLocation}') {
								optionListSL[i].selected = true;
							}
						}
						$('#startLocation').change(function() {
							if ($(this).val() == 'all') {
								swal('대여 장소를 선택해주세요.');
							} else {
								console.log("대여 장소: " + $(this).val());
								$('#keyword').attr('disabled', false);
							}
						});

						const optionListEL = $('#endLocation option');
						for (var i = 0; i < optionListSL.length; i++) {
							if (optionListEL[i].value == '${requestScope.pageInfo.endLocation}') {
								optionListEL[i].selected = true;
							}
						}
						$('#endLocation').change(function() {
							if ($(this).val() == 'all') {
								swal('반납 장소를 선택해주세요.');
							} else {
								console.log("반납 장소: " + $(this).val());
								$('#keyword').attr('disabled', false);
							}
						});

						/* 날짜는 일단 keyword로 */

						$('#keyword').val('${requestScope.pageInfo.startDate}');
					});
</script>

<!-- datetimepicker  -->
<script type="text/javascript">
	$(function() {

		$('.datepicker').daterangepicker({
			autoUpdateInput : false,
			locale : {
				cancelLabel : 'Clear'
			}
		});

		/* $('.datepicker').on(
				'apply.daterangepicker',
				function(ev, picker) {
					$(this).val(
							picker.startDate.format('YYYY/MM/DD') + ' - '
									+ picker.endDate.format('YYYY/MM/DD'));
				}); */
		$('.datepicker').on(
				'apply.daterangepicker',
				function(ev, picker) {
					var startDate = picker.startDate;
					var endDate = picker.endDate;
					
					$('#startDate').val(startDate.format('YYYY/MM/DD'));
					$('#endDate').val(endDate.format('YYYY/MM/DD'));									
				});

		$('.datepicker').on('cancel.daterangepicker', function(ev, picker) {
			$(this).val('');
		});

	});
</script>

</head>
<body>
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
								<option value="Seoul">서울
								<option value="Daejeon">대전
								<option value="Daegu">대구
								<option value="Busan">부산
								<option value="Jeju">제주
							</select> <select class="form-control-sm" id="endLocation"
								name="endLocation">
								<option value="all" selected="selected">--반납 장소--
								<option value="Seoul">서울
								<option value="Daejeon">대전
								<option value="Daegu">대구
								<option value="Busan">부산
								<option value="Jeju">제주
							</select>
							<!-- <input class="form-control-sm" type="text" name="keyword"
												id="keyword" placeholder="키워드 입력"> -->
							<input class="form-control-sm datepicker" type="text" 
							name="startDate" id="startDate" 
								 placeholder="📅대여일">
						 <input class="form-control-sm datepicker" type="text" 
						name="endDate" id="endDate" 
							 placeholder="📅반납일">


							<button type="submit" class="btn btn-warning form-control-sm"
								onclick="">검색</button>
							<!-- <button type="button" class="btn btn-warning form-control-sm"
												onclick="searchAll();">전체 검색</button> -->

							<span class="label label-default">${requestScope.pageInfo.pagingStatus}</span>
						</div>
					</div>
				</form>
			</div>
			<div class="col-sm-1"></div>
		</div>



		<table class="table table-striped">
			<thead>
				<tr>
					<th>렌터카 번호</th>
					<th>차 종류</th>
					<th>대여 장소</th>
					<th>반납 장소</th>
					<th>대여료</th>
					<th>탑승 인원</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="6" align="center"></td>
				</tr>
				<c:forEach var="bean" items="${requestScope.datalist}">
					<tr>
						<td>${bean.rcid}</td>
						<td>${bean.carType}</td>
						<td>${bean.startLocation}</td>
						<td>${bean.endLocation}</td>
						<td>${bean.price}</td>
						<td>${bean.passengers}</td>
						<!-- 수정기능 일시적 삭제 -->	
					</tr>
				</c:forEach>
			</tbody>
		</table>
		${requestScope.pageInfo.pagingHtml}
	</div>
</body>
</html>
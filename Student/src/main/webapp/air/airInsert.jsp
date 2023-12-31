<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script type="text/javascript">

	function rand()
	{
		
	}

</script>

<%-- <meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<script src="${pageContext.request.contextPath}/js/script.js"></script> --%>

<style type="text/css">

	#boardNo{display: none;visibility: hidden;}

</style>

</head>
<body>	
	<div class="container">
		<h2>예약</h2>
		<p>예약하는 사이트입니다.</p>

		<form action="<%=withFormTag%>" method="post">
			<input type="hidden" name="command" value="airInsert">
			<div id = "boardNo" class="input-group">
				<span class="input-group-text col-md-2">예약 번호</span> 
				<input id="regid" name="regid" type="number" class="form-control" placeholder="">
			</div>
	
			<div id="flyid" class="input-group">
				<span class="input-group-text col-md-2">항공편 번호</span>
				<input id="fakeflid" name="fakeflid" type="number" class="form-control"	
				placeholder="${requestScope.flids.flid}" disabled>
				<input type="hidden" id="flid" name="flid" value="${requestScope.flids.flid}">
			</div>
			
			<div id="departid" class="input-group">
				<span class="input-group-text col-md-2">출발지</span>
				<input id="fakedepart" name="fakedepart" type="text" class="form-control"	
				placeholder="${requestScope.flids.depart}" disabled>
				<input type="hidden" id="departid" name="departid" value="${requestScope.flids.depart}">
			</div>
			
			
			
			<div id="departid" class="input-group">
				<span class="input-group-text col-md-2">도착지</span>
				<input id="fakearrive" name="fakearrive" type="text" class="form-control"	
				placeholder="${requestScope.flids.arrive}" disabled>
				<input type="hidden" id="arriveid" name="arriveid" value="${requestScope.flids.arrive}">
			</div>
			
			
			
			<div class="input-group">
					<span class="input-group-text">좌석</span>
					<select class="form-select form-select-sm" id="seat" name="seat">
						  <option value="-">--좌석선택--</option>
						  <option value="first">프레스티지</option>
						  <option value="business">비즈니스</option>
						  <option value="economi">이코노미</option>
					</select>
				</div>
				
			<div class="input-group">
				<span class="input-group-text col-md-2">경유지</span> <input
					id="fstopover" name="fstopover" type="text" class="form-control"
				 placeholder="없음" disabled>
				 <input id="stopover" name="stopover" type="hidden" value="없음">
			</div>


			<div class="input-group">
				<span class="input-group-text col-md-2">인원수</span> <input
					id="passengers" name="passengers" type="number" class="form-control"
					>
			</div>
			
			<div class="input-group">
				<input
					id="meid" name="meid" type="hidden" class="form-control" value="${sessionScope.loginfo.meid}"
					>
			</div>
			
			<div class="input-group">
				<input
					id="price" name="price" type="hidden" class="form-control" value="150000"
					>
			</div>
			
			
			
			<div id="buttonset" class="input-group">
				<button type="submit" class="btn btn-primary btn-lg">예약</button>
				&nbsp;&nbsp;&nbsp;
				<button type="reset" class="btn btn-secondary btn-lg">초기화</button>
			</div>
		</form>
	</div>
</body>
</html>
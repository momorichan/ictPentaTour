<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script type="text/javascript">
	function rand() {

	}
</script>

<%-- <meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<script src="${pageContext.request.contextPath}/js/script.js"></script> --%>

<style type="text/css">
#boardNo {
	display: none;
	visibility: hidden;
}
</style>

</head>
<body>
	<div class="container">
		<h2>예약하기</h2>

		<form action="<%=withFormTag%>" method="post">
			<input type="hidden" name="command" value="roReservation">
			<div id="boardNo" class="input-group">
				<span class="input-group-text col-md-2">방 번호</span> 
				<input id="meid" name="meid"  value="${sessionScope.mebean.meid}">	
				<input id="roid" name="roid"  value="${sessionScope.robean.roid}">
				<input id="startDate" name="startDate"  value="${sessionScope.startDate}">
				<input id="endDate" name="endDate"  value="${sessionScope.endDate}">
			</div>

			숙소 이름
			<div>
				<table class="table">
					<tbody>
						<tr>
							<td class="col-2">도시</td>
							<td>${sessionScope.acbean.city}</td>
						</tr>
						<tr>
							<td>체크인/체크아웃</td>
							<td>${sessionScope.startDate} ~ ${sessionScope.endDate}</td>
						</tr>
						<c:forEach items="${sessionScope.roomList}" var="room" varStatus="index">
							<tr>
								<td>객실${index.count} 정보</td>
								<td>
									<div id="boardNo">
									<input id="guest${index.count}" name="guest${index.count}" value="${room}">
									</div>
									${sessionScope.robean.roominfo} * ${room}명
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
			<c:forEach items="${sessionScope.roomList}" var="room" varStatus="index">
			${index.count}번 객실
			<div id="boardNo" class="input-group">
				<span class="input-group-text col-md-2">방 번호</span> 
			</div>
			<div>
				<table class="table">
					<tbody class="personal">
						<tr>
							<td class="col-2">이름</td>
							<td class="col-4">
							<input id="membername${index.count}" name="membername${index.count}" type="text" class="form-control" 
							value="<c:choose><c:when test="${index.count == 1}">${sessionScope.mebean.name}</c:when></c:choose>">
							</td>
							<td>전화번호</td>
							<td><input id="phone${index.count}" name="phone${index.count}" type="text" class="form-control" 
							value="<c:choose><c:when test="${index.count == 1}">${sessionScope.mebean.phone}</c:when></c:choose>"></td>
						</tr>
						<tr>
							<td class="col-2">생년월일</td>
							<td class="col-4"><input id="birth${index.count}" name="birth${index.count}" type="text" class="form-control" 
							value="<c:choose><c:when test="${index.count == 1}">${sessionScope.mebean.birth}</c:when></c:choose>"></td>
							<td class="col-2">성별</td>
							<td class="col-4"><input id="gender${index.count}" name="gender${index.count}" type="text" class="form-control" 
							value="<c:choose><c:when test="${index.count == 1}">${sessionScope.mebean.gender}</c:when></c:choose>"></td>
						</tr>
					</tbody>
				</table>
			</div>
			</c:forEach>				

			결제 정보
			<div>
				<table class="table">
					<tbody>
						<tr>
							<td>인원수</td>
							<td>인원 정보</td>
						</tr>
						<tr>
							<td class="col-2">최종 결제 금액</td>
							<td>금액 정보</td>
						</tr>
					</tbody>
				</table>
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
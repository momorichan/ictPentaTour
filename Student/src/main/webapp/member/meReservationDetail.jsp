<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.accommodation {
	font-size: 13px;
}
.info-div {
	margin-left:auto;
	margin-right:auto;
	width:1400px !important;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<h2 style="text-align: center;">${sessionScope.loginfo.name}님의 예약 정보 입니다.</h2>
	<br>
	<div class="info-div air">
		<h3>항공 예매 정보</h3>
		<table class="table table-hover">
			<!-- table-hover, table-striped, table-condensed  -->
			<thead>
				<tr class="table-primary">
					<th>예매 번호</th>
					<th>항공 번호</th>
					<th>항공사</th>
					<th>출발지</th>
					<th>도착지</th>
					<th>출발시간</th>
					<th>도착시간</th>
					<th>좌석 정보</th>
					<th>경유지 여부</th>
					<th>인원</th>
					<th>가격</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="fbean" items="${requestScope.fbean}" varStatus="status">
				<c:forEach var="abean" items="${requestScope.airbean}" begin="${status.index}" end="${status.index}">
					<tr>
						<td>${fbean.regid}</td>
						<td>${abean.flid}</td>
						<td>${abean.fname}</td>
						<td>${abean.depart}</td>
						<td>${abean.arrive }</td>
						<td>${abean.detime}</td>
						<td>${abean.artime}</td>
						<td>${fbean.seat}</td>
						<td>${fbean.stopover}</td>
						<td>${fbean.passengers}</td>
						<td><fmt:formatNumber value="${fbean.price}" pattern="#,###" />원</td>
				</c:forEach>
				</c:forEach>
			</tbody>
		</table>
	</div>	 
	<br>
	<br>
	<br>
	<div class="info-div accommodation">
		<h3>숙박 예약 정보</h3>
		<table class="table table-hover">
			<!-- table-hover, table-striped, table-condensed  -->
			<thead>
				<tr class="table-primary">
					<th>숙박 예약 번호</th>
					<th>체크인 날짜</th>
					<th>체크 아웃 날짜</th>
					<th>숙소 번호</th>
					<th>국제</th>
					<th>도시</th>
					<th>숙소 이름</th>
					<th>상세 주소</th>
					<th>객실 번호</th>
					<th>객실 이름</th>
					<th>이름</th>
					<th>인원</th>
					<th>가격</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="rrbean" items="${requestScope.rrbean}" varStatus="status">
				<c:forEach var="rrdbean" items="${requestScope.rrdbean}" begin="${status.index}" end="${status.index}">
				<c:forEach var="rbean" items="${requestScope.rbean}" begin="${status.index}" end="${status.index}">
				<c:forEach var="abean" items="${requestScope.abean}" begin="${status.index}" end="${status.index}">
					<tr>
						<td>${rrbean.rrid}</td>
						<td>${rrbean.checkin}</td>
						<td>${rrbean.checkout}</td>
						<td>${abean.acid}</td>
						<td>${abean.global}</td>
						<td>${abean.city}</td>
						<td>${abean.name}</td>
						<td>${abean.address}</td>
						<td>${rbean.roid}</td>
						<td>${rbean.room}</td>
						<td>${rrdbean.name}</td>
						<td>${rrdbean.guests}</td>
						<td><fmt:formatNumber value="${rbean.price}" pattern="#,###" />원</td>
				</c:forEach>
				</c:forEach>
				</c:forEach>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<br>
	<br>
	<br>
	<div class="info-div tour">
		<h3>티켓 예매 정보</h3>
		<table class="table table-hover">
			<!-- table-hover, table-striped, table-condensed  -->
			<thead>
				<tr class="table-primary">
					<th>티켓 예매 번호</th>
					<th>티켓 번호</th>
					<th>지역</th>
					<th>티켓 이름</th>
					<th>사용 가능 일자</th>
					<th>티켓 유효 기간</th>
					<th>티켓 가격</th>
					<th>티켓 매수</th>
					<th>총 가격</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="trbean" items="${requestScope.trbean}" varStatus="status">
				<c:forEach var="tbean" items="${requestScope.tbean}" begin="${status.index}" end="${status.index}">
					<tr>
						<td>${trbean.torid}</td>
						<td>${trbean.toid}</td>
						<td>${tbean.location}</td>
						<td>${tbean.tname}</td>
						<td>${tbean.tusedate}</td>
						<td>${tbean.texdate}</td>
						<td><fmt:formatNumber value="${tbean.tprice}" pattern="#,###" />원</td>
						<td>${trbean.tqty}</td>
						<td><fmt:formatNumber value="${tbean.tprice * trbean.tqty}" pattern="#,###" />원</td>
				</c:forEach>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="info-div tour">
		<h3>렌트카 예약 정보</h3>
		<table class="table table-hover">
			<!-- table-hover, table-striped, table-condensed  -->
			<thead>
				<tr class="table-primary">
					<th>렌트카 예약 번호</th>
					<th>차량 번호</th>
					<th>차종</th>
					<th>차량 이름</th>
					<th>대여 장소</th>
					<th>반납 장소</th>
					<th>대여 날짜</th>
					<th>반납 일자</th>
					<th>탑승 인원</th>
					<th>대여료</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="ccbean" items="${requestScope.ccbean}" varStatus="status">
				<c:forEach var="cbean" items="${requestScope.cbean}" begin="${status.index}" end="${status.index}">
					<tr>
						<td>${ccbean.recid}</td>
						<td>${ccbean.rcid}</td>
						<td>${cbean.carType}</td>
						<td>${cbean.carName}</td>
						<td>${cbean.startLocation}</td>
						<td>${cbean.endLocation}</td>
						<td>${cbean.startDate}</td>
						<td>${cbean.endDate}</td>
						<td>${cbean.passengers}</td>
						<td><fmt:formatNumber value="${cbean.price}" pattern="#,###" />원</td>
				</c:forEach>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale = 1.0, maximum-scale=1.0, user-scalable=no">
	<title>Insert title here</title>
	<style type="text/css">
	.testbox{
		
	}
	</style>
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
	
			
</head>
<body>
	<div class="container">
		<h2>[${requestScope.bean.rcid}]번 렌터카 정보</h2>
		<table class="table">
			<thead>
			</thead>
			<tbody>
				<tr>
					<td align="center">렌터카 번호</td>
					<td>${requestScope.bean.rcid}</td>
				</tr>
				<tr>
					<td align="center">차 종류</td>
					<td>${requestScope.bean.carType}</td>
				</tr>
				<tr>
					<td align="center">대여 장소</td>
					<td><c:choose>
							<c:when test="${requestScope.bean.startLocation eq 'seoul'}">
								<c:out value="서울" />
							</c:when>
							<c:when test="${requestScope.bean.startLocation eq 'daejeon'}">
								<c:out value="대전" />
							</c:when>
							<c:when test="${requestScope.bean.startLocation eq 'daegu'}">
								<c:out value="대구" />
							</c:when>
							<c:when test="${requestScope.bean.startLocation eq 'busan'}">
								<c:out value="부산" />
							</c:when>
							<c:when test="${requestScope.bean.startLocation eq 'jeju'}">
								<c:out value="제주" />
							</c:when>
						</c:choose></td>
				</tr>
				<tr>
					<td align="center">반납 장소</td>
					<td><c:choose>
							<c:when test="${requestScope.bean.endLocation eq 'seoul'}">
								<c:out value="서울" />
							</c:when>
							<c:when test="${requestScope.bean.endLocation eq 'daejeon'}">
								<c:out value="대전" />
							</c:when>
							<c:when test="${requestScope.bean.endLocation eq 'daegu'}">
								<c:out value="대구" />
							</c:when>
							<c:when test="${requestScope.bean.endLocation eq 'busan'}">
								<c:out value="부산" />
							</c:when>
							<c:when test="${requestScope.bean.endLocation eq 'jeju'}">
								<c:out value="제주" />
							</c:when>
						</c:choose></td>
				</tr>
				<tr>
					<td align="center">대여료</td>
					<td>${requestScope.bean.price}</td>
				</tr>
				<tr>
					<td align="center">탑승 가능 인원</td>
					<td>${requestScope.bean.passengers}</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="offcanvas offcanvas-end" id="demo">
		<div class="offcanvas-header">
			<h1 class="offcanvas-title">Heading</h1>
			<button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button>
		</div>
		<div class="offcanvas-body">
			<p>Some text lorem ipsum.</p>
			<p>Some text lorem ipsum.</p>
			<p>Some text lorem ipsum.</p>
			<div id="map" style="width: 500px; height: 400px;"></div>
			<br/>
			<button class="btn btn-success" type="button">예약 하기</button>
		</div>
	</div>
	</div>


	<div class="container">
		<div class="container-fluid mt-3">
			<h3>예약 지점 확인</h3>
			<p>예약 가능한 지점을 확인해보세요.</p>
			<button class="btn btn-primary" type="button"
				data-bs-toggle="offcanvas" data-bs-target="#demo">위치 보기</button>
		</div>

	</div>



</body>
</html>
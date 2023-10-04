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
				<span class="input-group-text col-md-2">방 번호</span> <input id="roid"
					name="roid" type="number" class="form-control" placeholder="">
			</div>

			숙소 이름
			<div>
				<table class="table">
					<tbody>
						<tr>
							<td class="col-2">도시</td>
							<td>${requestScope.acbean.city}</td>
						</tr>
						<tr>
							<td>체크인/체크아웃</td>
							<td>${requestScope.startDate} ~ ${requestScope.endDate}</td>
						</tr>
						<tr>
							<td>객실 정보</td>
							<td>${requestScope.robean.roominfo}</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			
			투숙자 정보
			<div>
				<table class="table">
					<tbody>
						<tr>
							<td class="col-2">이름</td>
							<td class="col-4">
							<input id="membername" name="membername" type="text" class="form-control" value="${requestScope.mebean.name}">
							</td>
						</tr>
						<tr>
							<td class="col-2">생년월일</td>
							<td class="col-4"><input id="brith" name="brith" type="text" class="form-control" value="${requestScope.mebean.birth}"></td>
							<td class="col-2">성별</td>
							<td class="col-4"><input id="gender" name="gender" type="text" class="form-control" value="${requestScope.mebean.gender}"></td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td><input id="phone" name="phone" type="text" class="form-control" value="${requestScope.mebean.phone}"></td>
							<td>이메일</td>
							<td><input id="meid" name="meid" type="text" class="form-control" value="${requestScope.mebean.meid}"></td>
						</tr>
					</tbody>
				</table>
			</div>

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
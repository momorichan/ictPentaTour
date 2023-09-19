<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="./../common/bootstrap5.jsp"%>
<%@ include file="./../common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%-- <meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<script src="${pageContext.request.contextPath}/js/script.js"></script> --%>

</head>
<body>	
	<div class="container">
		<h2>예약</h2>
		<p>예약하는 사이트입니다.</p>

		<form action="<%=withFormTag%>" method="post">
			<input type="hidden" name="command" value="airInsert">
			<div id="flyid" class="input-group">
				<span class="input-group-text col-md-2">게시물 번호</span> <input
					id="flid" name="flid" type="number" class="form-control"
					value="">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">작성자</span>

				<c:set var="userInfo" value="" />

				<input id="fakeid" name="fakeid" disabled="disabled" type="text"
					class="form-control" placeholder="" value=""> <input
					id="id" name="id" type="text" value="">
			</div>



<!-- 			<ul class="showcase">
				<li>
					<div class="seat"></div> <small>N/A</small>
				</li>
				<li>
					<div class="seat selected"></div> <small>Selected</small>
				</li>
				<li>
					<div class="seat occupied"></div> <small>Occupied</small>
				</li>
			</ul> -->


	<!-- <div class="container">
      <div class="row">
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
      </div>
      <div class="row">
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat occupied"></div>
        <div class="seat occupied"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
      </div>
      <div class="row">
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat selected"></div>
        <div class="seat selected"></div>
        <div class="seat"></div>
        <div class="seat occupied"></div>
        <div class="seat occupied"></div>
      </div>
      <div class="row">
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat selected"></div>
        <div class="seat"></div>
        <div class="seat selected"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
      </div>
      <div class="row">
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat occupied"></div>
        <div class="seat occupied"></div>
        <div class="seat selected"></div>
        <div class="seat"></div>
        <div class="seat"></div>
      </div>
      <div class="row">
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat selected"></div>
        <div class="seat occupied"></div>
        <div class="seat occupied"></div>
        <div class="seat occupied"></div>
        <div class="seat"></div>
      </div>
    </div> -->


			<div class="input-group">
				<span class="input-group-text col-md-2">인원수</span> <input
					id="passengers" name="regdate" type="number" class="form-control"
					placeholder="">
			</div>
			<div id="buttonset" class="input-group">
				<button type="submit" class="btn btn-primary btn-lg"
					onclick="return validChack();">예약</button>
				&nbsp;&nbsp;&nbsp;
				<button type="reset" class="btn btn-secondary btn-lg">초기화</button>
			</div>
		</form>
	</div>
</body>
</html>
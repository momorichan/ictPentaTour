<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="./../common/common.jsp"%>
<%@ include file="./../common/bootstrap5.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.rounded-pill {
	opacity: 0.9;
}

.mode, .keyword, .col {
	margin: auto;
}

/* 좌측 div 설정 */
        .left-div {
            float: left; /* 왼쪽으로 부유(floating) */
            width: 58.4%; /* 가로 공간의 58.4% 차지 */
			padding:0px;
			justify-content: center;
            
        }

        /* 우측 div 설정 */
        .right-div {
            float: left; /* 왼쪽으로 부유(floating) */
            width: 41.6%; /* 가로 공간의 41.6% 차지 */
            padding:0px;
        }
		.p1 {
	float: left;
    width: 48%;
    display: block;
    margin-bottom: 3px;
    margin-left: 1px;
    margin-right: 1px;
}

.p2 {
    float: left;
    width: 32%;
    height: 174px;
    margin-left: 1px;
    margin-right: 1px;
}
.img-size{
}
</style>

</head>
<body>
	<div class="container">
	<div class="left-div img-size">
		<span class="p1"><img src="${pageContext.request.contextPath}/upload/${requestScope.randomimage.get(1)}" style="width:100%; title="" data-src="" alt=""></span>
		<span class="p1"><img src="${pageContext.request.contextPath}/upload/${requestScope.randomimage.get(2)}" style="width:100%; title="" data-src="" alt=""></span>
		<span class="p2"><img src="${pageContext.request.contextPath}/upload/${requestScope.randomimage.get(3)}" style="width:100%; title="" data-src="" alt=""></span>
		<span class="p2"><img src="${pageContext.request.contextPath}/upload/${requestScope.randomimage.get(4)}" style="width:100%; title="" data-src="" alt=""></span>
		<span class="p2"><img src="${pageContext.request.contextPath}/upload/${requestScope.randomimage.get(0)}" style="width:100%;" title="" data-src="" alt=""></span>
	</div>
	<div class="right-div">
		<table class="table table-borderless">
			<thead>
				<td class="col-lg-7">
				asdsad
				</td>
				
				<td class="col-lg-5">
					<h2 align="right">${requestScope.acbean.name}</h2>
					<p align="right">${requestScope.acbean.description}</p>
				</td>
			</thead>
		</table>
	</div>
		

		<table class="table table-borderless">

			<tbody>
				<c:forEach var="bean" items="${requestScope.roomlists}">
					<tr>
						<td><a href="<%=notWithFormTag%>roDetail&roid=${bean.roid}">
								${bean.room} </a></td>
						<td>조식 ${bean.breakfast}</td>
						<td>1박<br>
						<fmt:formatNumber value="${bean.price}"></fmt:formatNumber>원
						</td>
						<td><a href="#" class="btn btn-primary">예약하기</a></td>
					</tr>
				</c:forEach>
				
			</tbody>
		</table>
		<table class="table table-borderless">
			<tbody>
				<tr >
				<td align="center">편의시설</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>
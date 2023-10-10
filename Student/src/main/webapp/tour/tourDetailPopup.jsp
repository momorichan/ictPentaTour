<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/bootstrap5.jsp"%>
<%
	String appName = request.getContextPath();
	String mappingName = "/Shopping"; //in FrontController.java file
	
	//form 태그에서 사용할 변수
	String withFormTag = appName + mappingName;
	
	//form 태그가 아닌 영역에서 사용할 변수
	String notWithFormTag = appName + mappingName + "?command=";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script>
  function Submit() {
    var ticket = document.getElementById('title').innerText;
    var qty = document.getElementById('tqty').value;
    alert( ticket + ' 티켓 ' + qty + "장 구매 완료." );
  }
  var price = ${requestScope.bean.tprice};
  $(document).ready(function(){
	  var qty = document.getElementById('tqty').value;
	  $('#totalprice').html(totalprice);
	  var totalprice = qty * price;
  });
</script>
<style type="text/css">
html, body {
	width:600px !important;
	height:640px !important;
}

.container {
	width:100%;
	height:100%;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-content: center;
}

.info {
	width:100%;
	display: flex;
	flex-direction: column;
	justify-content: center;
}
.title, .location, .price, .totalprice {
	text-align: center;
}
.price {
	margin-top: 10px;
	font-size: 18px;
}
.totalprice {
	margin-top:10px;
}
.reservation {
	display: flex;
	flex-direction:column;
	justify-content: center;
	margin-top:100px;
}
.qty-div, .submit-btn {
	margin-right:auto;
	margin-left:auto;
}
.qty {
	width:50px;
}
.submit-btn {
	background-color: #339af0;
	border-radius: 10px 10px 10px 10px;
	border: 1px solid white;
	width:70px;
	height:40px;
	color: white;
	margin-top: 20px;
}
h1 {
	font-size: 26px;
}
h2 {
	font-size: 20px;
}
</style>
</head>
<body>
	<div class="container">
		<form action="<%=withFormTag%>" method="post" enctype="multipart/form-data">
		<input type="hidden" name="command" value="tourPopup">
		<input type="hidden" name="toid" id="toid" value="${requestScope.bean.toid}">
		<input type="hidden" name="meid" id="meid" value="${sessionScope.loginfo.meid}">
			<div class="info">
				<h2 class="location">${requestScope.bean.location}</h2>
				<h1 class="title" id="title">${requestScope.bean.tname}</h1>
				<p class="price">가격 : ${requestScope.bean.tprice}</p>
			</div>
			<div class="reservation">
				<div class="qty-div">
					매수 : <input type="number" class="qty" name="tqty" id="tqty" value="1">
				</div>
				<span class="totalprice" id="totalprice">asdfsadf</span>
				<button type="submit" class="submit-btn" onclick="Submit()">구매</button>
			</div>
		</form>
	</div>
</body>
</html>
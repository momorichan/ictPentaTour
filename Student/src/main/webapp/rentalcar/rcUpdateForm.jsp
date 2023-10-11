<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		.container{margin-top: 10px;}
  		.input-group{margin: 7px;}
  		.input-group-text{
  			display: block;
  			margin-left: auto;
  			margin-right: auto;
  		}
  		.radio_gender, .checkbox_hobby{font-size: 1.1rem;} /* 주위 글꼴의 1.1배 */
  		#buttonset{margin-top: 15px;}
	</style>
	<script type="text/javascript">
		$(function (){			

			});
			
			
			});
	</script>
</head>
<body>
<div class="container">
		<h2>상품 수정</h2>
		<p>관리자가 렌터카를 수정하는 페이지입니다.</p>
		<form action="<%=withFormTag%>" method="post" enctype="multipart/form-data">
			<input type="hidden" name="pageNumber" value="<%=request.getParameter("pageNumber")%>"> 
			<input type="hidden" name="pageSize" value="<%=request.getParameter("pageSize")%>">
			<input type="hidden" name="startLocation" value="<%=request.getParameter("startLocation")%>">
			<input type="hidden" name="endLocation" value="<%=request.getParameter("endLocation")%>">
			<input type="hidden" name="startDate" value="<%=request.getParameter("startDate")%>">
			<input type="hidden" name="endDate" value="<%=request.getParameter("endDate")%>">
			
			<input type="hidden" name="command" value="rcUpdate">
			
			<div id="productPnum" class="input-group">
				<span class="input-group-text">차량 번호</span>
				<input class="form-control" type="number" disabled="disabled" 
					id="fakepnum" name="fakepnum" value="${requestScope.bean.rcid}">	
				<input type="text" id="rcid" name="rcid" value="${requestScope.bean.rcid}">
			</div>
			<div class="input-group">
				<span class="input-group-text">차량 종류</span>
				<input class="form-control" type="text" id="carType" name="carType" value="${requestScope.bean.carType}">			
			</div>
			<div class="input-group">
				<span class="input-group-text">차량 이름</span>
				<input class="form-control" type="text" id="carName" name="carName" value="${requestScope.bean.carName}">			
			</div>
			<div class="input-group">
				<span class="input-group-text">대여 장소</span>
				<input class="form-control" type="text" id="startLocation" name="startLocation" value="${requestScope.bean.startLocation}">			
			</div>
			<div class="input-group">
				<span class="input-group-text">반납 장소</span>
				<input class="form-control" type="text" id="endLocation" name="endLocation" value="${requestScope.bean.endLocation}">			
			</div>
			<div class="input-group">
				<span class="input-group-text">대여 시작일</span>				
				<input class="form-control" type="date" id="startDate" name="startDate" value="${requestScope.bean.startDate}">
			</div>
			<div class="input-group">
				<span class="input-group-text">반납일</span>
				<input class="form-control" type="date" id="endDate" name="endDate" value="${requestScope.bean.endDate}">			
			</div>
			<div class="input-group">
				<span class="input-group-text">대여료</span>
				<input class="form-control" type="text" id="price" name="price" value="${requestScope.bean.price}">			
			</div>
			<div class="input-group">
				<span class="input-group-text">탑승인원</span>
				<input class="form-control" type="text" id="passengers" name="passengers" value="${requestScope.bean.passengers}">			
			</div>			
			<div class="input-group">
				<span class="input-group-text">이미지01</span>
				<input class="form-control" type="file" id="carImage01" name="carImage01">
				<input type="text" name="deleteImage01" value="${requestScope.bean.carImage01}">				
			</div>
			<div class="input-group">
				<span class="input-group-text">이미지02</span>
				<input class="form-control" type="file" id="image02" name="image02">
				<input type="text" name="deleteImage02" value="${requestScope.bean.carImage02}">				
			</div>
			<div class="input-group">
				<span class="input-group-text">이미지03</span>
				<input class="form-control" type="file" id="image03" name="image03">
				<input type="text" name="deleteImage03" value="${requestScope.bean.carImage03}">				
			</div>
			<div id="buttonset" class="input-group">
				<button type="submit" class="btn btn-primary btn-lg"
					onclick="return validCheck();"> 
					수정
				</button>
				&nbsp;&nbsp;&nbsp;
				<button type="reset" class="btn btn-secondary btn-lg">초기화</button>
			</div>
		</form>
	</div>
</body>
</html>
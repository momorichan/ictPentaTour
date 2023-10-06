<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>rcInsert</title>
  	<style type="text/css">
  		/* box model에 대한 공부가 필요합니다. */
  		.container{margin-top: 10px;}
  		.input-group{margin: 7px;}
  		.input-group-text{
  			display: block;
  			margin-left: auto;
  			margin-right: auto;
  		}
  		#buttonset{margin-top: 15px;}
  		.radio_gender, .checkbox_hobby{font-size: 1.1rem;} /* 주위 글꼴의 1.1배 */
  		
  		
  		#productPnum{display: none;visibility: hidden;} /* 상품 번호는 안보이게 지정*/
  		
  	</style>	
	<script type="text/javascript">
		
	</script>
</head>

<body>
	<div class="container">
		<h2>렌터카 등록</h2>
		<p>관리자가 렌터카 상품을 등록하는 페이지입니다.</p>
		<form action="<%=withFormTag%>" method="post" enctype="multipart/form-data">
			<input type="hidden" name="command" value="rcInsert">
			<div id="productPnum" class="input-group">
				<span class="input-group-text">차량 번호</span>
				<input class="form-control" type="text" id="rcid" name="rcid">				
			</div>
			<div class="input-group">
				<span class="input-group-text">차 종류</span>
				<input class="form-control" type="text" id="carType" name="carType">				
			</div>
			<div class="input-group">
				<span class="input-group-text">차량 이름</span>
				<input class="form-control" type="text" id="carName" name="carName">				
			</div>
			<div class="input-group">
				<span class="input-group-text">픽업 장소</span>
				<input class="form-control" type="text" id="startLocation" name="startLocation">				
			</div>
			<div class="input-group">
				<span class="input-group-text">반납 장소</span>
				<input class="form-control" type="text" id="endLocation" name="endLocation">				
			</div>
			<div class="input-group">
				<span class="input-group-text">대여 시작일</span>
				<input class="form-control" type="text" id="startDate" name="startDate">				
			</div>			
			<div class="input-group">
				<span class="input-group-text">반납일</span>
				<input class="form-control" type="text" id="endDate" name="endDate">				
			</div>			
			<div class="input-group">
				<span class="input-group-text">이미지01</span>
				<input class="form-control" type="file" id="carImage01" name="carImage01">				
			</div>
			<div class="input-group">
				<span class="input-group-text">이미지02</span>
				<input class="form-control" type="file" id="carImage02" name="carImage02">				
			</div>
			<div class="input-group">
				<span class="input-group-text">이미지03</span>
				<input class="form-control" type="file" id="carImage03" name="carImage03">				
			</div>
			<div class="input-group">
				<span class="input-group-text">단가</span>
				<input class="form-control" type="number" id="price" name="price">				
			</div>
			<div class="input-group">
				<span class="input-group-text">카테고리</span>
				<select id="category" name="category" class="form-select">
					<c:forEach var="category" items="${requestScope.categories}"> 
						<option value="${category.engname}">${category.korname}</option>
					</c:forEach>
				</select>				
			</div>
			<div class="input-group">
				<span class="input-group-text">상품 상세 설명</span>
				<input class="form-control" type="text" id="contents" name="contents">				
			</div>			
			<div class="input-group">
				<span class="input-group-text">적립 포인트</span>
				<input class="form-control" type="number" id="point" name="point">				
			</div>			
			<div class="input-group">
				<span class="input-group-text">입고 일자</span>
				<input class="form-control" type="datetime" id="inputdate" name="inputdate">				
			</div>
			<div id="buttonset" class="input-group">
				<button type="submit" class="btn btn-primary btn-lg"
					onclick="return validCheck();"> 
					등록
				</button>
				&nbsp;&nbsp;&nbsp;
				<button type="reset" class="btn btn-secondary btn-lg">초기화</button>
			</div>
		</form>
	</div>	

</body>
</html>
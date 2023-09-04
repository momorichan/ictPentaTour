<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./../common/bootstrap5.jsp" %>
<%@ include file="./../common/common.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
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
  	</style>
  	<script type="text/javascript">
  	function validChack(){
		var regex;/* 정규 표현식 */
  		var result;
  		
		var name = $('#name').val();
		if(name.length<4||name.length>10){
			swal('상품명은 4글자 이상 10글자 이하이어야 합니다.');
			$('#name').focus();
			return false;
		}
		
		var company = $('#company').val();
		if(company.length<4||company.length>10){
			swal('제조 회사는 4글자 이상 10글자 이하이어야 합니다.');
			$('#company').focus();
			return false;
		}
		
		var contents = $('#contents').val();
		if(contents.length<10||contents.length>30){
			swal('상품에 대한 코멘트는 10글자 이상 30글자 이하이어야 합니다.');
			$('#contents').focus();
			return false;
		}
		
		var image01 = $('#image01').val();
		if(image01 == ''){
			swal('이미지는 필수 입력 사항입니다.');
			$('#image01').focus();
			return false;
		}
		
		var isCheck = false;
		const imgCheck = ['.png, .jpg']
		for(var i=0 ; i < imgCheck.length ; i++){
  			if(image01.endsWith(imgCheck[i])){
  				isCheck = true ;
  				break ;
  			}	
  		}

		if(isCheck == false){
			swal('이미지의 확장자는 png 또는 jpg 형식이어야 합니다.');
  			return false ;
  		}
		
		const numberMessage = '는(은) 숫자 형식이어야 합니다.';
		
		var stock = $('#stock').val();
		regex = /^\d+$/;
		result = regex.test(stock);
		if(result == false){
			swal('재고' + numberMessage);
			$('#stock').focus();
			return false;
		}
		
		
		if(Number(stock) > 5){
			swal('재고는 최대 5개까지입니다.');
			$('#stock').focus();
			return false;
		}
				
		var price = $('#price').val();
		regex = /^\d+$/;
		result = regex.test(price);
		if(result == false){
			swal('단가' + numberMessage);
			$('#price').focus();
			return false;
		}
		
		
		if(Number(price) < 100 || Number(price) > 10000){
			swal('단가는(은) 100이상 10000이하의 값이어야 합니다.');
			$('#price').focus();
			return false;
		}		
		
		var point = $('#point').val();
		regex = /^\d+$/;
		result = regex.test(point);
		if(result == false){
			swal('포인트' + numberMessage);
			$('#point').focus();
			return false;
		}
		
		
		if(Number(point) < 3 || Number(point) > 10){
			swal('포인트는 3이상 10이하의 값이어야 합니다.');
			$('#point').focus();
			return false;
		}		
		
		var category = $('#category').val();
		if(category == '-'){
			swal('카테고리를 반드시 선택해 주세요.');
			$('#category').focus();
			return false;
		}		
		
		
		var regdate = $('#inputDate').val();
		regex = /^\d{4}[\/-][01]\d{1}[\/-][0123]\d{1}$/;
		result = regex.test(regdate);
		if(result==false){
			swal('날짜 형식은 반드시 yyyy/mm/dd 형식 또는 yyyy-mm-dd으로 작성해 주세요.');
			$('#inputDate').focus();
			return false;
		}	
  	};
  	</script>
</head>
<body>
	<div class="container">
		<h2>상품 등록</h2>
		<p>관리자가 구매할 상품을 등록하는 페이지입니다.</p>
		<form action="">
			<div class="input-group">
				<span class="input-group-text">상품 번호</span>
				<input class="form-control" type="number" id="pnum" name="pnum">				
			</div>
			<div class="input-group">
				<span class="input-group-text">상품 이름</span>
				<input class="form-control" type="text" id="name" name="name">				
			</div>
			<div class="input-group">
				<span class="input-group-text">제조 회사</span>
				<input class="form-control" type="text" id="company" name="company">				
			</div>
			<div class="input-group">
				<span class="input-group-text">이미지</span>
				<input class="form-control" type="file" id="image01" name="image01">				
			</div>
			<div class="input-group">
				<span class="input-group-text">재고 수량</span>
				<input class="form-control" type="text" id="stock" name="stock">				
			</div>
			<div class="input-group">
				<span class="input-group-text">단가</span>
				<input class="form-control" type="number" id="price" name="price">				
			</div>
			<div class="input-group">
				<span class="input-group-text">카테고리</span>
				<select id="category" name="category" class="form-select form-select-lg">
					<option value="-">-- 항목을 선택해 주세요</option>
					<option value="bread">빵</option>
					<option value="beverage">음료수</option>
					<option value="cake">케일</option>
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
				<input class="form-control" type="datetime" id="inputDate" name="inputDate">				
			</div>
			<div class="input-group">
				<button type="submit" class="btn btn-primary" onclick="return validChack();">
				등록
				</button>
				&nbsp;&nbsp;&nbsp;
				<button type="reset" class="btn btn-primary">초기화</button>				
			</div>
		</form>
	</div>
</body>
</html>
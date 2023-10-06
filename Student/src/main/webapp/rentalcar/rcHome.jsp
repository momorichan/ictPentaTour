<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
	

	.container {
		display: grid;
		grid-template-columns: repeat(3, 1fr);
		grid-template-rows: repeat(3, minmax(100px, auto));
		align-item: stretch;
		
		row-gap: 20px;
		column-gap: 20px;
	}
	.item {
		border: 2px;
		border-radius: 5%;
		box-shadow: 1px 1px 3px 1px #dadce0;
		background-color: #ffffff;
        border-radius: 5%;	
	}	
	.item:hover {
		background-color: #eeeeee;
        border-color: #bbb;
        border-radius: 5%;
        cursor: pointer;
	}
	

	
	img{
		width:100%;
		/* 왼쪽 위, 오른쪽 위, 왼쪽 아래, 오른쪽 아래 */
		border-radius: 5% 5% 0 0;
		
	}
	
	
	</style>	
	<script type="text/javascript" async src="https://tenor.com/embed.js"></script>
	<script type="text/javascript">
	$(function(){
		/* gif 테스트 */
		var staticImg="https://media.vlpt.us/images/gicomong/post/0e017975-70cc-41f5-b9a0-c5fa2b8b9e94/image.png";
		var gifImg ="https://media.vlpt.us/images/gicomong/post/94c268f8-9b9c-4662-b3e8-73a0487ed0cc/1.gif";
		
		var image = document.querySelector('.image');
		image.src = staticImg;
		$(image).on("mouseenter", function(){
			image.src = gifImg;
		});
		$(image).on("mouseleave", function(){
			image.src = staticImg;
		})
		/* tooltip */
		var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
		var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
		  return new bootstrap.Tooltip(tooltipTriggerEl)
		})
	});
		
	</script>
</head>
<body>

	<div class="container">
		<div class="item">
			<div class="hover-img">
				<figure>
					 <a  data-bs-toggle="modal" data-bs-target="#myModal">
						<img class="image" />		
					</a>			
				</figure>			
				<h5>예약 정보 확인하기</h5>				
			</div>
		</div>
		<div class="item">
			<div class="hover-img" >
				<figure>					
					<a href="<%=notWithFormTag%>rcList">
						<img src="https://content.skyscnr.com/db465e93dcaad614e9bfcaddb5865e36/GettyImages-505777764.jpg">						
					</a>
				</figure>
				https://tenor.com/bogMO.gif			
				<h5>예약 하러 가기</h5>				
			</div>
		</div>
		<div class="item">
			<div class="hover-img">
				<figure>
					<img src="https://content.skyscnr.com/db465e93dcaad614e9bfcaddb5865e36/GettyImages-505777764.jpg">
				</figure>			
				<h5>예약 정보 확인하기</h5>				
			</div>
		</div>
	</div>
	
	<!-- The Modal -->
	<div class="modal fade" id="myModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">차량 번호를 입력해주세요.</h4>
	        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	      </div>
	      <!-- Modal body -->
	      <div class="modal-body">
	      	<form name="myform" action="<%=withFormTag%>" method="get">
	      		<label>
	      			차량 번호
	      		</label>
	      		<input type="hidden" name="command" value="rcList">
	      		<input type="text" id="rcid" name="rcid" class="form-control"
	      			data-bs-toggle="tooltip" title="ex)OO호OOOO"
					data-bs-placement="top">
	      	</form>
	      </div>
	      <!-- Modal footer -->
	      <div class="modal-footer">
	      	<button type="submit" class="btn btn-primary" data-bs-dismiss="modal">검색</button>
	        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
	      </div>	
	    </div>
	  </div>
	</div>
</body>
</html>
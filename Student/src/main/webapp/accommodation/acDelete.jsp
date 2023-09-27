<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="./../common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script type="text/javascript">
function roomForm(){ 
	location.href = '<%=notWithFormTag%>roInsert';
	}
function amenitiesForm(){ 
	location.href = '<%=notWithFormTag%>amInsert';
	}

function selectAmenities(){
	$('#amenities').empty();
	//$.ajax() 함수를 이용하여 데이터 보여주기 
	$.ajax({
		url:'<%=notWithFormTag%>amUpdate',
			data:'acid=' + '${requestScope.acbean.acid}',
			type : 'get',
			//dataType:'json', 
			dataType : 'html',
			success : function(result) {
				$('#amenities').html(result);
			}
		});
	}
$(document).ready(function() {
		selectAmenities();
});
</script>
<style type="text/css">
.container {
	margin-top: 10px;
}

.input-group {
	margin: 7px;
}

.input-group-text {
	display: block;
	margin-left: auto;
	margin-right: auto;
}

.input-group-right {
	display: block;
	margin-left: auto;
	margin-right: auto;
	float: right;
}

#invisible {
	display: none;
	visibility: hidden;
}
</style>

</head>
<body>
	<div class="container">
		<h2>숙소 등록</h2>
		<p>숙소를 등록하는 페이지입니다.</p>

		<form action="<%=withFormTag%>" method="post">
			<input type="hidden" name="command" value="acUpdate">
			<div id="invisible" class="input-group">
				<span class="input-group-text col-md-2">예약 번호</span> <input
					id="acid" name="acid" 
					type="number" class="form-control" value="${requestScope.acbean.acid}">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">숙소 이름</span> 
				<input
					id="name" name="name" type="text" class="form-control"
					value="${requestScope.acbean.name}">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">숙소 주소</span> <input
					id="address" name="address" type="text" class="form-control"
					value="${requestScope.acbean.address}">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">설명</span> <input
					id="description" name="description" type="text"
					class="form-control" placeholder=""
					value="${requestScope.acbean.description}">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">이미지01</span> 
				<input id="image01" name="newimage01" type="file" class="form-control">
				<input type="hidden" name="preimage01"  value=${requestScope.acbean.image01 }>
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">이미지02</span> 
				<input id="image02" name="newimage02" type="file" class="form-control">
				<input type="hidden" name="preimage02"  value=${requestScope.acbean.image02 }>				
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">이미지03</span> 
				<input id="image03" name="newimage03" type="file" class="form-control">
				<input type="hidden" name="preimage03"  value=${requestScope.acbean.image03 }>				
			</div>		
			<div class="input-group">
					<span class="input-group-text col-md-2 " >편의시설 선택</span>
					<span type="button" class="btn btn-info form-control-sm" onclick="amenitiesForm();">편의시설 추가하기</span>
			</div>
			<div class="input-group">
					<span id="amenities"></span>
			</div>							
			<div>
			<table class="table table-striped">
			<thead>
				<tr>
					<th>방 이름</th>
					<th>방 정보</th>
					<th>1박 가격</th>
					<th>조식</th>
					<th>수용인원</th>
					<th>이미지</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
			
			<c:if test="${requestScope.roomlist != null}">
				<c:forEach items="${requestScope.roomlist}" var="room">
					<tr>
						<td>${room.room}</td>
						<td>${room.roominfo}</td>
						<td><fmt:formatNumber>${room.price}</fmt:formatNumber>원</td>
						<td>${room.breakfast}</td>
						<td>${room.guests}명</td>
						<td data-bs-toggle="modal" data-bs-target="#myModal">
						클릭
							<!-- The Modal -->
						<div class="modal fade" id="myModal">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <!-- Modal body -->
						      <div class="modal-body">
						        <table>
						        <thead>
						        <tr>
						        <td><p>이미지 01</p></td>
						        <td><p>이미지 02</p></td>
						        <td><p>이미지 03</p></td>
						        </tr>
						        </thead>
						        <tbody>
						          <tr>
						            <td>
						              <img src="${pageContext.request.contextPath}/upload/${room.image01}" data-src="" alt="">
						            </td>
						            <td>
						              <img src="${pageContext.request.contextPath}/upload/${room.image02}" data-src="" alt="">
						            </td>
						            <td>
						              <img src="${pageContext.request.contextPath}/upload/${room.image03}" data-src="" alt="">
						            </td>
						          </tr>
						          </tbody>
						        </table>
						      </div>
						
						      <!-- Modal footer -->
						      <div class="modal-footer">
						        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
						      </div>
						    </div>
						  </div>
						</div>			
						</td>
						<td>
						<a href="<%=notWithFormTag%>roUpdate&roid=${room.roid}">수정</a>
						</td>
						<td>
						<a href="<%=notWithFormTag%>roDelete&roid=${room.roid}">삭제</a>
						</td>
					</tr>
				</c:forEach>
			</c:if>
			</tbody>
			</table>
			</div>
			<div class="input-group">
				<span type="button" class="btn btn-info form-control-sm"
					onclick="roomForm();">방 등록</span>
			</div>
			<div id="buttonset" class="input-group">
				<button type="submit" class="btn btn-primary btn-lg">등록</button>
				&nbsp;&nbsp;&nbsp;
				<button type="reset" class="btn btn-secondary btn-lg">초기화</button>
			</div>
		</form>
	</div>
</body>
</html>
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
		/*총 금액과 적립 포인트를 위한 스타일 지정*/
		.LargeSpan{color: red;font-size: 1.2em;font-weight: bolder;}
		
		/*수정 버튼을 위한 스타일 지정*/
		.row{margin: auto;vertical-align: middle;}
		.col{margin: -10px;vertical-align: middle;}
		.form-control-sm{width: 40px;height: 40px; border: 2px solid Gainsboro;}
	</style>
	<script type="text/javascript">
		function checkAll(){
			if($('#checkall').prop('checked')){/*전체 선택 on*/
				$('input[name=cartCheckBox]').prop('checked', true);
			}else{
				$('input[name=cartCheckBox]').prop('checked', false);
			}
			reCalculateAmount();
		}
		
		/*개별 체크 박스의 상태가 변경, 전체 선택 체크의 상태 변경시 호출*/
		function reCalculateAmount(){
			var cartTotalPrice = 0;
			var cartTotalPoint = 0;
			
			/*체크 상태가 on인 항목들을 반복*/
			$('input[name=cartCheckBox]:checked').each(function(){/*개별 체크 박스의 상태 변경*/
				var pnum = $(this).val();
				var price = $('.price_' + pnum).attr('data');
				var point = $('.point_' + pnum).attr('data');
				var qty = $('.qty_' + pnum).attr('data');
				
				cartTotalPrice += price*qty;
				cartTotalPoint += point*qty;
			});
			
			$('.cartTotalPrice').html(AddComma(cartTotalPrice)+'원');
			$('.cartTotalPoint').html(AddComma(cartTotalPoint)+'원');
		}
		
		function AddComma(num){/*3자리마다 콤마 유형 넣기*/
			var regexp = /\B(?=(\d{3})+(?!\d))/g;
            return num.toString().replace(regexp, ',');
		}
		
		$(document).ready(function(){
			$('#checkall').prop('checked', true); /*전체 선택 체크박스 on*/
			$('input[name=cartCheckBox]').each(function(){ /*개별 체크박스 on*/
				$(this).prop('checked', true);
			});
			$('input[name=cartCheckBox]').change(function(){/*개별 체크 박스의 상태 변경*/
				reCalculateAmount();
			});
		});
	</script>
</head>
<body>
	<div class="container mt-3">
		<h2>카트 내역 보기</h2>
		<p>나의 관심/구매 예정인 목록에 대한 정보를 보여줍니다.</p>
		<table class="table table-hover">
			<thead>
				<tr>
					<th width="9%">
	                  <div class="form-check">
	                       <input class="form-check-input" type="checkbox" id="checkall" name="option1" onclick="checkAll();">
	                       <label class="form-check-label">전체선택</label>
	                  </div>
               		</th>
					<th>상품명</th>
					<th>수량</th>
					<th>단가</th>
					<th>포인트</th>
					<th>금액</th>
					<th>누적포인트</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
			<%--총 금액 : totalAmount, 총 누적포인트 : totalPoint --%>
			<c:set var="totalAmount" value="0"/>
			<c:set var="totalPoint" value="0"/>
			<c:forEach items="${sessionScope.cartWishList}" var="bean">
				<tr>
					<td align="center" valign="middle">
	                  <div class="form-check">
	                       <input type="checkbox" name="cartCheckBox" value="${bean.pnum}">
	                  </div>                  
               		</td>
					<td align="center" valign="middle">
						<img alt="${bean.pname}" src="upload/${bean.image01}" width="45" height="45"
							class="rounded">
						${bean.pname}
					</td>
					<td align="center" valign="middle" class="qty_${bean.pnum}" data="${bean.qty}">
					<fmt:formatNumber value="${bean.qty}" pattern="###,###"/>개
					</td>
					<td align="center" valign="middle" class="price_${bean.pnum}" data="${bean.price}">
					<fmt:formatNumber value="${bean.price}" pattern="###,###"/>원
					</td>
					<td align="center" valign="middle" class="point_${bean.pnum}" data="${bean.point}">
					<fmt:formatNumber value="${bean.point}" pattern="###,###"/>원
					</td>
					<td align="center" valign="middle" >
					<fmt:formatNumber value="${bean.price * bean.qty}" pattern="###,###"/>원
					</td>
					<td align="center" valign="middle" >
					<fmt:formatNumber value="${bean.point * bean.qty}" pattern="###,###"/>원
					</td>
					<td align="center" valign="middle">
	                  	<div class="row">
	                  	<div class="col"> 
	                       <input class="form-control-sm" type="text" id="edit_${bean.pnum}" name="edit_${bean.pnum}">
	                       <button class="btn btn-outline-secondary btn-sm" onclick="editQty('${bean.pnum}');">                      
	                       수정
	                    </button>
	                    </div>
	                  	</div>
	               </td>
	               <td align="center" valign="middle">
	                  <a href="<%=notWithFormTag%>maDelete&pnum=${bean.pnum}">
	                     삭제
	                  </a>                  
	               </td>
				</tr>
				
			<%-- 총 금액과 총 누적포인트를 누적 --%>
			<c:set var="totalAmount" value="${bean.price * bean.qty + totalAmount}"/>
			<c:set var="totalPoint" value="${bean.point * bean.qty + totalPoint}"/>
			</c:forEach>
			<%--결제하기, 추가 주문 기능, 총 금액, 총 누적 포인트 보여 주기 --%>
			<tr>
				<td align="center" colspan="3">
					<a href="<%=notWithFormTag%>">결제 하기</a>
					&nbsp;&nbsp;&nbsp;
					<a href="<%=notWithFormTag%>prList">추가 주문</a>
				</td>
				<td align="left" colspan="6">
					<span class="LargeSpan">
						총 주문 금액 :
						<span class="cartTotalPrice"> 
							<fmt:formatNumber value="${totalAmount}" pattern="###,###"/>원
						</span>
					</span>
					&nbsp;&nbsp;&nbsp;
					<span class="LargeSpan">
						총 적립포인트 :
						<span class="cartTotalPoint"> 
							<fmt:formatNumber value="${totalPoint}" pattern="###,###"/>원
						</span>
					</span>
				</td>				
			</tr>
			</tbody>
		</table>
	</div>
</body>
</html>
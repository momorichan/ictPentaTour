<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
      /* table 셀의 수평 가운데 정렬 */
      .card{margin-left:auto;margin-right:auto;}
      .card-img-top{width:300px;height:300px;}
      .removeUnderLine{text-decoration-line: none;}
		#buttonList{margin-top:10px;}		
		#updateAnchor, #deleteAnchor{opacity:0.8;}   
		.mode, .keyword, .col{margin: auto;}  
		.form-control-sm{border: 1px solid Gainsboro;}
		#minprice {	color: black;	font-size: 18px;	 font-weight: bolder;}
</style>
<script type="text/javascript">

      $(document).ready(function(){
         // Initialize popoveer
         
         

         
         var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
         var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
              return new bootstrap.Popover(popoverTriggerEl);
         });

         var optionList = $('#mode option');
			for(var i = 0 ; i < optionList.length ; i++){
				if(optionList[i].value == '${requestScope.pageInfo.mode}'){
					optionList[i].selected = true;
				}
			}
			$('#keyword').val('${requestScope.pageInfo.keyword}');
			
			
			// 기존의 삭제 버튼 href 속성을 저장합니다.
			var originalDeleteHref = $("#acDelete").attr("href");

			// 클릭된 버튼의 ${bean.acid} 값을 얻는 함수
			function getAcidFromDeleteButton(button) {
			  // 버튼의 ID 속성 값을 가져옵니다.
			  var buttonId = button.attr("id");
			  
			  // 버튼 ID에서 ${bean.acid} 부분을 추출합니다.
			  var startIndex = buttonId.indexOf("deleteAnchor") + "deleteAnchor".length;
			  var endIndex = buttonId.length;
			  var acid = buttonId.substring(startIndex, endIndex);
			  
			  // 추출한 ${bean.acid} 값을 반환합니다.
			  return acid;
			}

			// 클릭 이벤트 핸들러를 추가하여 삭제 버튼 클릭 시 href 속성을 변경합니다.
			$("[id^=deleteAnchor]").click(function() {
			  var acidValue = getAcidFromDeleteButton($(this));

			  // 삭제 링크의 href 속성에 데이터 추가
			  var deleteLink = $("#acDelete");
			  var href = originalDeleteHref + acidValue;
			  deleteLink.attr("href", href);
			});
      });
      function searchAll(){ 
			location.href = '<%=notWithFormTag%>acList';
		}
	
		function writeForm(){ 
			location.href = '<%=notWithFormTag%>acInsert';
		}
		

   </script>
</head>
<body>
	<div class="container">
		<h2>숙소 목록</h2>
		<p>숙소 목록입니다.</p>		
		<table class="table table-borderless">
			<thead>
			</thead>
			<tbody>
			<tr>
			<td colspan="7" align="center">
				<div class="row">
	            <div class="col-sm-12">               
                <form name="myform" action="<%=withFormTag%>" method="get">
                   <input type="hidden" name="command" value="acList">
                   <div class="row">
                      <div class="col-sm-12 mode">
                         <select class="form-control-sm" id="mode" name="mode">
                            <option value="all" selected="selected">--- 선택해 주세요 ---
                            <option value="name">상품 이름
                            <option value="company">제조 회사
                            <option value="category">카테고리
                         </select>    
                      <input class="form-control-sm" type="text" name="keyword" id="keyword"
                         placeholder="키워드 입력">                             
                         <button type="submit" class="btn btn-warning form-control-sm" onclick="">검색</button>    
                         <button type="button" class="btn btn-warning form-control-sm" onclick="searchAll();">전체 검색</button>       
                      	 <c:if test="${whologin==2}">
                         <button type="button" class="btn btn-info form-control-sm"  onclick="writeForm();">숙소 등록</button>
                         </c:if>          
                         <span class="label label-default">${requestScope.pageInfo.pagingStatus}</span> 
                      </div>
                   </div>
                </form>                     
             	</div>
          		</div>
			</td>
			</tr>
				<c:set var="colsu" value="${applicationScope.map['accommodation_list_column_size']}"/>
				<c:forEach var="bean" items="${requestScope.datalist}" varStatus="status">
				<c:if test="${status.index%colsu==0}">
					<tr>
				</c:if> 
				<td>
					<div class="card" style="width:19rem;">
						<a href="<%=notWithFormTag%>acDetail&acid=${bean.acid}${requestScope.pageInfo.flowParameter}" class="removeUnderLine">
							<img class="card-img-top" alt="${bean.name}" src="${pageContext.request.contextPath}/upload/${bean.image}" >
							<div class="card-body"> 
								<h5 class="card-title">${bean.name}</h5> 
								<p class="card-text">
									<span id="minprice">
									<c:if test="${bean.minprice != 0}">
									<fmt:formatNumber value="${bean.minprice}" ></fmt:formatNumber>원~
									</c:if>
									</span>
								</p>
							<c:if test="${whologin == 2}">
								<div id="buttonList">
									<a id="updateAnchor" href="<%=notWithFormTag%>acUpdate&acid=${bean.acid}${requestScope.pageInfo.flowParameter}" class="btn btn-info">
									수정</a>
									<span id="deleteAnchor${bean.acid}" data-bs-toggle="modal" data-bs-target="#myModal" class="btn btn-info" data-acid="${bean.acid}">
									삭제
									</span>							
								</div>
							</c:if>
							<c:if test="${bean.minprice == 0}">
								<a id="roominsert" href="<%=notWithFormTag%>roInsert&acid=${bean.acid}" class="btn btn-info"">
								방 등록하기
								</a>
							</c:if>									
							</div>
						</a>

					</div>
					</td>
					
 				 <c:if test="${status.index%colsu==colsu-1}">
					
				</c:if>			
				</c:forEach>
			</tbody>
		</table>
		${requestScope.pageInfo.pagingHtml}	
	</div>	 
	
	
			<!-- The Modal -->
	<div class="modal fade" id="myModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <!-- Modal body -->
	      <div class="modal-body">
			정말 삭제하시겠습니까?
	      </div>
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <a id="acDelete" href="<%=notWithFormTag%>acDelete&acid=" class="btn btn-danger" >삭제합니다.</a>
	        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./../common/common.jsp" %>
<%@ include file="./../common/bootstrap5.jsp" %>
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
		#totalprice {	color: red;	font-size: 20px;	 font-weight: bolder;}
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
		<h2>상품 목록</h2>
		<p>고객들이 구매하고자 하는 상품 목록을 보여 주는 페이지입니다.</p>		
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
                         <button type="button" class="btn btn-info form-control-sm"  onclick="writeForm();">상품 등록</button>
                         </c:if>          
                         <span class="label label-default">${requestScope.pageInfo.pagingStatus}</span> 
                      </div>
                   </div>
                </form>                     
             	</div>
          		</div>
			</td>
			</tr>
				<c:set var="colsu" value="${applicationScope.settingMap['accommodation_list_column_size']}"/>
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
									<span id="totalprice">
									<fmt:formatNumber>
										${bean.price}
									</fmt:formatNumber>
									</span>
								</p>
							<c:if test="${whologin == 2}">
								<div id="buttonList">
									<a id="updateAnchor" href="<%=notWithFormTag%>acUpdate&acid=${bean.acid}${requestScope.pageInfo.flowParameter}" class="btn btn-info">
									수정</a>
									<a id="deleteAnchor" href="<%=notWithFormTag%>acDelete&acid=${bean.acid}${requestScope.pageInfo.flowParameter}" class="btn btn-info">
									삭제</a>							
								</div>
							</c:if>
							</div>
						</a>

					</div>
					</td>
					
 				 <c:if test="${status.index%colsu==colsu-1}">
					</tr>
				</c:if>			
				</c:forEach>
			</tbody>
		</table>
		${requestScope.pageInfo.pagingHtml}	
	</div>	 
</body>
</html>
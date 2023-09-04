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
</style>
<script type="text/javascript">
      $(document).ready(function(){
         // Initialize popoveer
         var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
         var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
              return new bootstrap.Popover(popoverTriggerEl);
         });

      });
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
				<c:set var="colsu" value="${applicationScope.settingMap['product_list_column_size']}"/>
				<c:forEach var="bean" items="${requestScope.datalist}" varStatus="status">
				<c:if test="${status.index%colsu==0}">
					<tr>
				</c:if>
				<td>
					<div class="card" style="width:19rem;">
						<a href="prDetail02.jsp?pnum=${bean.pnum}" class="removeUnderLine">
							<img class="card-img-top" alt="${bean.name}" src="${pageContext.request.contextPath}/image/${bean.image01}" >
							<div class="card-body"> 
								<h5 class="card-title">${bean.name}</h5> 
								<p class="card-text">
									<span data-bs-toggle="popover" 
									title="${bean.name}" 
									data-bs-content="${bean.contents}"
									data-bs-trigger="hover">
									<c:if test="${fn:length(bean.contents) >= 10}">
										${fn:substring(bean.contents,0,10)}...
									</c:if>
									</span>
									<c:if test="${fn:length(bean.contents) < 10}">
										${bean.contents}
									</c:if>
								</p>
							<c:if test="${whologin == 2}">
								<div id="buttonList">
									<a id="updateAnchor" href="#" class="btn btn-info">
									수정</a>
									<a id="updateAnchor" href="#" class="btn btn-info">
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
	</div>	 
</body>
</html>
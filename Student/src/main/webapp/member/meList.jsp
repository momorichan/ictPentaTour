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
	.mode, .keyword, .col{margin: auto;}  
	</style>
	<script type="text/javascript">
      $(document).ready(function(){
         var optionList = $('#mode option');
			for(var i = 0 ; i < optionList.length ; i++){
				if(optionList[i].value == '${requestScope.pageInfo.mode}'){
					optionList[i].selected = true;
				}
			}
			$('#keyword').val('${requestScope.pageInfo.keyword}');
      });
      function searchAll(){ 
			location.href = '<%=notWithFormTag%>meList';
		}
	
		function writeForm(){ 
			location.href = '<%=notWithFormTag%>meInsert';
		}
   </script>
</head>
<body>
	<div class="container">
		<h2>회원 목록</h2>
		<p>회원 목록을 보여 주는 페이지입니다.</p>		
		<table class="table table-hover">
			<!-- table-hover, table-striped, table-condensed  -->
			<thead>
				<tr class="table-primary">
					<th>아이디</th>
					<th>이름</th>
					<th>비밀 번호</th>
					<th>성별</th>
					<th>생일</th>
					<th>결혼 여부</th>
					<th>급여</th>
					<th>주소</th>
					<th>매니저</th>
				</tr>
			</thead>
			<tbody>
			<tr>
			<td colspan="7" align="center">
				<div class="row">
	            <div class="col-sm-12">               
                <form name="myform" action="<%=withFormTag%>" method="get">
                   <input type="hidden" name="command" value="meList">
                   <div class="row">
                      <div class="col-sm-12 mode">
                         <select class="form-control-sm" id="mode" name="mode">
                            <option value="all" selected="selected">--- 선택해 주세요 ---
                            <option value="id">아이디
                            <option value="name">이름
                            <option value="manager">매니저
                         </select>
                      <input class="form-control-sm" type="text" name="keyword" id="keyword"
                         placeholder="키워드 입력">                
                         <button type="submit" class="btn btn-warning form-control-sm" onclick="">검색</button>
                         <button type="button" class="btn btn-warning form-control-sm" onclick="searchAll();">전체 검색</button>          
                         ${requestScope.pageInfo.pagingStatus}
                      </div>
                   </div>
                </form>                     
             	</div>
          		</div>
			</td>
			</tr>
				<c:forEach var="bean" items="${requestScope.datalist}">
					<c:if test="${bean.id == 'admin'}">
					<tr class="table-danger">
					</c:if>
					<c:if test="${bean.id != 'admin'}">
					<tr>
					</c:if>
						<td>${bean.id}</td>
						
						<td>
							<a href="<%=notWithFormTag%>meDetail&id=${bean.id}">
								${bean.name}
							</a>
						</td>
						<td>${bean.password}</td>
						<td>
							<c:if test="${bean.gender eq 'male'}">
								남자
							</c:if>
							<c:if test="${bean.gender eq 'female'}">
								여자
							</c:if>
						</td>
						<td>${bean.birth}</td>
						<td>${bean.marriage}</td>
						<td>${bean.salary}</td>
						<td>${bean.address}</td>
						<td>${bean.manager}</td>
					</tr>

				</c:forEach>
			</tbody>
		</table>
		<!-- 
			ol : ordered list
			ul : unordered list
			li : list
		 -->		 
		${requestScope.pageInfo.pagingHtml}
	</div>	 
</body>
</html>
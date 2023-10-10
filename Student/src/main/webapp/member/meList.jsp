<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./../common/common.jsp" %>
    
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
				if(optionList[i].value == '${sessionScope.pageInfo.mode}'){
					optionList[i].selected = true;
				}
			}
			$('#keyword').val('${sessionScope.pageInfo.keyword}');
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
					<th>비밀번호</th>
					<th>이름</th>
					<th>성별</th>
					<th>생년월일</th>
					<th>핸드폰번호</th>
					<th>주소</th>
					<th>회원 유형</th>
				</tr>
			</thead>
			<tbody>
			<tr>
                <form name="myform" action="<%=withFormTag%>" method="get">
                   <input type="hidden" name="command" value="meList">
                   <div class="row">
                      <div class="col-sm-12 mode">
                         <select class="form-control-sm" id="mode" name="mode">
                            <option value="all" selected="selected">--- 선택해 주세요 ---
                            <option value="meid">아이디
                            <option value="name">이름
                         </select>
                      <input class="form-control-sm" type="text" name="keyword" id="keyword"
                         placeholder="키워드 입력">                
                         <button type="submit" class="btn btn-warning form-control-sm" onclick="">검색</button>
                         <button type="button" class="btn btn-warning form-control-sm" onclick="searchAll();">전체 검색</button>          
                         ${sessionScope.pageInfo.pagingStatus}
                      </div>
                   </div>
                </form>                     
			</tr>
				<c:forEach var="bean" items="${sessionScope.datalist}">
					<c:if test="${bean.meid == 'admin'}">
					<tr class="table-danger">
					</c:if>
					<c:if test="${bean.meid != 'admin'}">
					<tr>
					</c:if>
						<td>${bean.meid}</td>
						<td>${bean.password}</td>
						<td>
							<a href="<%=notWithFormTag%>meDetail&meid=${bean.meid}">
								${bean.name}
							</a>
						</td>
						<td>${bean.gender }</td>
						<td>${bean.birth}</td>
						<td>${bean.phone}</td>
						<td>${bean.address}</td>
						<td>${bean.role}</td>
				</c:forEach>
			</tbody>
		</table>
		${sessionScope.pageInfo.pagingHtml}
	</div>	 
</body>
</html>
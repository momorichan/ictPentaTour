<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="./../common/common.jsp"%>
<%@ include file="./../common/bootstrap5.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		
		function searchAll(){ //전체 검색
			location.href = '<%=notWithFormTag%>boList';
		}
	
		function writeForm(){ //글쓰기
			location.href = '<%=notWithFormTag%>
	boInsert';
	}
</script>
<style type="text/css">
.rounded-pill {
	opacity: 0.9;
}

.mode, .keyword, .col {
	margin: auto;
}
</style>

</head>
<body>
	<div class="container">
		<h2>게시물 목록</h2>
		<p>사용자들이 게시한 목록을 보여 주는 페이지</p>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>글번호</th>
					<th>작성자</th>
					<th>비밀 번호</th>
					<th>글제목</th>
					<th>글내용</th>
					<th>작성 일자</th>
					<th>조회수</th>
					<th>수정</th>
					<th>답글</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="9" align="center">
						<div class="row">
							<div class="col-sm-12">
								<form name="myform" action="<%=withFormTag%>" method="get">
									<input type="hidden" name="command" value="boList">
									<div class="row">
										<div class="col-sm-12 mode">
											<select class="form-control-sm" id="mode" name="mode">
												<option value="all" selected="selected">--- 선택해 주세요
													---
												<option value="id">작성자
												<option value="subject">글제목
												<option value="content">글내용
											</select> <input class="form-control-sm" type="text" name="keyword"
												id="keyword" placeholder="키워드 입력">
											<button type="submit" class="btn btn-warning form-control-sm"
												onclick="">검색</button>
											<button type="button" class="btn btn-warning form-control-sm"
												onclick="searchAll();">전체 검색</button>
											<button type="button" class="btn btn-info form-control-sm"
												onclick="writeForm();">글 쓰기</button>
											${requestScope.pageInfo.pagingStatus}
										</div>
									</div>
								</form>
							</div>
						</div>
					</td>
				</tr>
				<c:forEach var="bean" items="${requestScope.datalist}">
					<tr>
						<td>${bean.no}</td>
						<td>${bean.id}</td>
						<td>${bean.password}</td>
						<td><c:forEach var="i" begin="1" end="${bean.depth}" step="1">
								<span class="badge rounded-pill bg-secondary">re</span>
							</c:forEach> <a href="<%=notWithFormTag%>boDetail&no=${bean.no}">
								${bean.subject} </a></td>
						<td>${bean.content}</td>
						<td>${bean.regdate}</td>
						<td><c:if test="${bean.readhit < 50}">
								<span class="badge rounded-pill bg-success">${bean.readhit}</span>
							</c:if> <c:if test="${bean.readhit >=50}">
								<span class="badge rounded-pill bg-danger">${bean.readhit}</span>
							</c:if></td>
						<td><c:if test="${whologin==2||sessionScope.loginfo.id==bean.id}">
								<a id="updateAnchor"
									href="<%=notWithFormTag%>boUpdate&no=${bean.no}${requestScope.pageInfo.flowParameter}"
									class="btn btn-info">수정</a>
							</c:if>
						</td>
						<td>
							<c:set var="replyInfo" value="&groupno=${bean.groupno}&orderno=${bean.orderno}&depth=${bean.depth}"></c:set>
							<a href="<%=notWithFormTag%>boReply&no=${bean.no}${requestScope.pageInfo.flowParameter}${replyInfo}"
							class="btn btn-info">답글달기</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		${requestScope.pageInfo.pagingHtml}

	</div>
</body>
</html>
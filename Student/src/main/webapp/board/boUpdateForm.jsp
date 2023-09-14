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
  		/* box model에 대한 공부가 필요합니다. */
  		.container{margin-top: 10px;}
  		.input-group{margin: 7px;}
  		.input-group-text{
  			display: block;
  			margin-left: auto;
  			margin-right: auto;
  		}
  		#buttonset{margin-top: 15px;}
  		#boardNo1{display: none; visibility: hidden;}
  	</style>
  	<script type="text/javascript">
		$(document).ready(function(){
  	  		$('#regdate').datepicker({dateFormat: "yy/mm/dd"});   	
  		});
  	
  	function validChack(){

		
		var subject = $('#subject').val();
		if(subject.length<3||subject.length>20){
			swal('글 제목은 3글자 이상 20글자 이하이어야 합니다.');
			return false;
		}
		
		var content = $('#content').val();
		if(content.length<5||content.length>30){
			swal('글 내용은 5글자 이상 30글자 이하이어야 합니다.');
			return false;
		}
		
		var regdate = $('#regdate').val();
		var regex1 = /^\d{4}\/[01]\d{1}\/[0123]\d{1}$/;
		var regex2 = /^\d{4}\-[01]\d{1}\-[0123]\d{1}$/;
		var result = regex1.test(regdate) || regex2.test(regdate);
		if(result==false){
			swal('날짜 형식은 반드시 yyyy/mm/dd 형식 또는 yyyy-mm-dd으로 작성해 주세요.');
			return false;
		}		
  	}
  	
  	
  	
  	</script>
</head>
<body>
	<div class="container">
		<h2>게시물 수정</h2>
		<p>게시물을 수정하는 페이지입니다.</p>
		
		<form action="<%=withFormTag%>" method="post">
			<input type="hidden" name="command" value="boUpdate">
			<input type="hidden" name="pageNumber" value="<%=request.getParameter("pageNumber")%>">
			<input type="hidden" name="pageSize" value="<%=request.getParameter("pageSize")%>">
			<input type="hidden" name="mode" value="<%=request.getParameter("mode")%>">
			<input type="hidden" name="keyword" value="<%=request.getParameter("keyword")%>">
			<div id = "boardNo" class="input-group">
				<span class="input-group-text col-md-2">게시물 번호</span> 
				<input id="fakeno" name="fakeno" disabled="disabled" type="number" class="form-control" placeholder="" value="${requestScope.bean.no}">
				<input type="number" id="no" name="no" value="${requestScope.bean.no}">		
			</div> 
			<div class="input-group">
				<span class="input-group-text col-md-2">작성자</span> 
				
				<c:set var="userInfo" value="${sessionScope.loginfo.name}(${sessionScope.loginfo.id})"/>
				
				<input id="fakeid" name="fakeid" disabled="disabled" 
					type="text" class="form-control" placeholder="" value="${userInfo}">
				<input id="id" name="id" type="text" value="${sessionScope.loginfo.id}">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">글제목</span> 
				<input id="subject" name="subject" type="text" class="form-control" placeholder="" value="${requestScope.bean.subject}">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">글내용</span> 
				<input id="content" name="content" type="text" class="form-control" placeholder="" value="${requestScope.bean.content}">
			</div>  
			<div class="input-group">
				<span class="input-group-text col-md-2">글비밀번호</span> 
				<input id="password" name="password" type="password" class="form-control" placeholder="" value="${requestScope.bean.password}">
			</div>			
			<div class="input-group">
				<span class="input-group-text col-md-2">등록 일자</span> 
				<input id="regdate" name="regdate" type="datetime" class="form-control" placeholder="" value="${requestScope.bean.regdate}">
			</div>
			<div id="buttonset" class="input-group">
				<button type="submit" class="btn btn-primary btn-lg" onclick="return validChack();">등록</button>
				&nbsp;&nbsp;&nbsp;
				<button type="reset" class="btn btn-secondary btn-lg">초기화</button>
			</div>
		</form>
	</div>
</body>
</html>
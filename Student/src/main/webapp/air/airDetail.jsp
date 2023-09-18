<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%@ include file="./../common/bootstrap5.jsp" %>
<%@ include file="./../common/common.jsp" %>
  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		.container{margin: 10px;}
		#backButton{margin: auto;}
		.emoticon{text-decoration:none;}
	</style>
	<style type="text/css">
		/* 댓글들을 위한 스타일 지정 */
		* {
			padding: 0;
			margin: 0;
			color: #333;
		}
		ul { list-style: none; }
		#container { padding: 30px 20px; }
		#insertComment {
			padding: 20px 15px;
			border-bottom: 1px solid #7BAEB5;
		}

		#insertComment label {
			display: inline-block;
			width: 80px;
			font-size: 14px;
			font-weight: bold;
			margin-bottom: 10px;
		}

		#insertComment input[type='text'], #insertComment textarea {
			border: 1px solid #ccc;
			vertical-align: middle;
			padding: 3px 10px;
			font-size: 12px;
			line-height: 150%;
		}

		#insertComment textarea {
			width: 450px;
			height: 120px ;
		}

		.commentItem {
			font-size: 13px;
			color: #333;
			padding: 15px;
			border-bottom: 1px dotted #ccc;
			line-height: 150%;
		}

		.commentItem .id {
			color: #555;
			line-height: 200%;
		}

		.commentItem .id input {
			vertical-align: middle;
		}

		.commentItem .id .name {
			color: #222;
			font-weight: bold;
			font-size: 14px;
		}
		
		.form-group {
			margin-bottom: 3px;
		}
		
		.form-control {
			height: 25px;
		}
		.btn-primary{opacity: 0.8;}
	</style>	
	<script type="text/javascript">
	
		// 삭제 버튼 클릭 
		// on 메소드는 선택된 요소에 이벤트 핸들러 함수를 연결시켜주는 기능을 합니다.
		// cnum 이라는 속성을 개발자가 지정해두었습니다.
		$(document).on('click','.delete_btn',function(){
			
			if(confirm('선택하신 항목을 삭제하시겠습니까?'))
			{	
				$.ajax({
					url:'<%=notWithFormTag%>cmDelete', 
					data:'cnum=' + $(this).attr('cnum'),
					type:'get', 
					dataType:'json',
					success:function(result, status){
							console.log(result);
							console.log(status) ;
							getListComment();
						}
					});
				}
			});
		
		<%-- function getListComment(){
			$('#comment_list').empty();			
			/* $.ajax() 함수를 이용하여 데이터 보여 주기 */
			$.ajax({
				url:'<%=notWithFormTag%>cmList', 
				data:'flid=' + '${requestScope.bean.flid}',
				type:'get', 
				dataType:'json',
				success:function(result, status){
					/* console.log('result는 넘어온 데이터 결과 값') ; */
					/* console.log(result) ; */
					
					$.each(result, function(idx){ /* idx는 색인 번호 */
						var cnum = result[idx].cnum ;
						var id = result[idx].id ;
						var content = result[idx].content ;
						var regdate = result[idx].regdate ;
						addNewItem(cnum, id, content, regdate);
					})
				},
				error:function(result, status){
					console.log(result) ;
					console.log(status) ;
				}
			});
		} --%>
		
		function addNewItem(cnum, id, content, regdate){
			/* 댓글 1개를 추가해주는 함수입니다. */
			var litag = $('<li>') ; /* 댓글의 외곽 li 태그  */
			litag.addClass('commentItem') ;
			
			var ptag = $('<p>') ; /* 작성자 정보가 들어갈 태그  */
			ptag.addClass('id') ;

			var spantag = $('<span>') ; /* 작성자 이름이 들어갈 태그  */
			spantag.addClass('name') ;
			spantag.html(id + "님") ;
			
			var spandate = $('<span>') ;  /* 작성 일자가 들어갈 태그  */
			spandate.html("&nbsp;&nbsp;/&nbsp;&nbsp;" + regdate + '&nbsp;') ;
			
			/* 로그인한 사람이 작성한 댓글이면 삭제 가능 */
			if(id == '${sessionScope.loginfo.id}'){ 
				var inputtag = $('<input>') ; /* 삭제 버튼 */
				var attrlist = {'id':id, 'type':'button', 'value':'삭제', 'class':'btn btn-xs btn-outline-primary', 'cnum':cnum};
				inputtag.attr(attrlist);
				inputtag.addClass('delete_btn');
			}else{
				var inputtag = '' ;
			}
			
			var content_p = $('<p>') ; /* 작성한 댓글 내용 */
			content_p.html(content) ; 
			
			/* 조립하기(compose up) */
			ptag.append(spantag).append(spandate).append(inputtag);
			litag.append(ptag).append(content_p) ; 
			
			$('#comment_list').append(litag) ;
		}
	
		function aaa(){
			/* 댓글 입력 없이 전송 버튼을 누른 경우 */
			if(!$('#content').val()){
				alert('댓글을 입력해 주셔야 합니다.');
				$('#content').focus() ;
				return false ;
			}
			
			/* post 방식으로 데이터를 전송합니다. */
			var URL = '<%=notWithFormTag%>cmInsert' ;
			var parameters = $('#comment_form').serialize() ;
			$.post(URL, parameters, function(data){
				$('#content').val('');
				getListComment(); /* 목록 갱신하기 */
				
			}).fail(function(){
				alert('댓글 작성에 실패하였습니다.');
				return false ;
			});
			return true ;
		}
		
		$(document).ready(function(){
			getListComment();
			
			/* 사용자가 댓글을 입력하고, 전송 버튼을 눌렀습니다. */
			$('#comment_form').submit(function(){				
				/* 댓글 입력 없이 전송 버튼을 누른 경우 */
				if(!$('#content').val()){
					alert('댓글을 입력해 주셔야 합니다.');
					$('#content').focus() ;
					return false ;
				}
				
				/* post 방식으로 데이터를 전송합니다. */
				var URL = '<%=notWithFormTag%>cmInsert' ;
				var parameters = $('#comment_form').serialize() ;
				$.post(URL, parameters, function(data){
					alert('bbbbb');
					getListComment(); /* 목록 갱신하기 */
					$('#content').val('');					
					
				}).fail(function(){
					alert('댓글 작성에 실패하였습니다.');
					return false ;
				});
				return true ;
			});
		});
	</script>	
</head>
<body>
	<div class="container">
		<h2>[${requestScope.bean.flid}]번 항공편 정보</h2>
		<table class="table">
			<thead></thead>
			<tbody>
				<tr>
					<td align="center">항공편</td>
					<td>${requestScope.bean.flid}</td>
				</tr>
				<tr>
					<td align="center">출발지</td>
					<td>${requestScope.bean.depart}</td>
				</tr>
				<tr>
					<td align="center">도착지</td>
					<td>${requestScope.bean.arrive}</td>
				</tr>
				<tr>
					<td align="center">출발시간</td>
					<td>${requestScope.bean.detime}</td>
				</tr>
				<tr>
					<td align="center">도착시간</td>
					<td>${requestScope.bean.artime}</td>
				</tr>
			</tbody>
		</table>
		<div id="menubutton" align="center">
		
			<button type="button" class="btn btn-primary" onclick="">
				예약
			</button>
		
			<button type="button" class="btn btn-primary" onclick="history.back();">
				돌아 가기 
			</button>
			
<%-- 		 &nbsp;&nbsp;&nbsp;
         <a class="emoticon" href="<%=notWithFormTag%>boEmoticon&mode=likes&no=${bean.no}">
            <img src="<%=appName%>/image/like.png" width="30px" height="30px" alt="">
            ${bean.likes}
         </a>
         &nbsp;&nbsp;
         <a class="emoticon" href="<%=notWithFormTag%>boEmoticon&mode=hates&no=${bean.no}">
            <img src="<%=appName%>/image/hate.png" width="30px" height="30px" alt="">
            ${bean.hates}
         </a>   
			
			 --%>
		</div>
		
				    </tbody>
				</table>
			</form>	
		</div>		
	</div>
</body>
</html>	
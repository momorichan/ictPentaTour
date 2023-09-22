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

		$(document).ready(function(){
			
		
		});
		
		function goHome()
		{
			location.href='<%=notWithFormTag%>airHome'
		}
		
		
		
	</script>	
</head>
<body>
	<div class="container">
		<h2>${requestScope.fly.regid}번 예약 정보</h2>
		<table class="table">
			<thead></thead>
			<tbody>
			<tr>
				<td align="center">예약번호</td>
				<td>${requestScope.fly.regid}</td>
			</tr>
			
			
			
				<tr>
					<td align="center">항공편</td>
					<td>${requestScope.fly.flid}</td>
				</tr>
				
				<tr>
					<td align="center">항공사</td>
					<td>${requestScope.beans.fname}</td>
				</tr>
				
				<tr>
					<td align="center">출발지</td>
					<td>${requestScope.beans.depart}</td>
				</tr>
				
				<tr>
					<td align="center">도착지</td>
					<td>${requestScope.beans.arrive}</td>
				</tr>
				
				<tr>
					<td align="center">좌석</td>
					<td>${requestScope.fly.seat}</td>
				</tr>
				
				<tr>
					<td align="center">경유지</td>
					<td>${requestScope.fly.stopover}</td>
				</tr>
				
				
				<tr>
					<td align="center">출발 시간</td>
					<td>${requestScope.beans.detime}</td>
				</tr>
				
				
				<tr>
					<td align="center">도착 시간</td>
					<td>${requestScope.beans.artime}</td>
				</tr>
				
					<tr>
					<td align="center">인원수</td>
					<td>${requestScope.fly.passengers}</td>
				</tr>
				
				
				<tr>
					<td align="center">총 가격</td>
					<td><fmt:formatNumber value="${requestScope.fly.price}" pattern="###,###원"> </fmt:formatNumber>
					</td>
				</tr>
			</tbody>
		</table>
		<div id="menubutton" align="center">
		
			<button type="button" class="btn btn-primary" onclick="goHome();">
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
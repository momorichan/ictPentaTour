<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		.container{margin: 10px;}
		#backButton{margin: auto;
		position: center;}
		.emoticon{text-decoration: none;}
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
		/* 삭제 버튼 클릭 */
		/* on() 메소드는 선택된 요소에 이벤트 핸들러 함수를 연결시켜 주는 기능을 합니다. */
		
		
	</script>	
</head>
<body>
	<div class="container">
		<h2>[${requestScope.bean.rcid}]번 렌터카 정보 </h2>
		<table class="table">
			<thead></thead>
			<tbody>
				<tr>
					<td align="center">렌터카 번호</td>
					<td>${requestScope.bean.rcid}</td>
				</tr>
				<tr>
					<td align="center">차 종류</td>
					<td>${requestScope.bean.carType}</td>
				</tr>
				<tr>
					<td align="center">대여 장소</td>
					<td>${requestScope.bean.startLocation}</td>
				</tr>
				<tr>
					<td align="center">반납 장소</td>
					<td>${requestScope.bean.endLocation}</td>
				</tr>
				<tr>
					<td align="center">대여료</td>
					<td>${requestScope.bean.price}</td>
				</tr>
				<tr>
					<td align="center">탑승인원</td>
					<td>${requestScope.bean.passengers}</td>
				</tr>
			</tbody>
		</table>
		
		<!-- 댓글 삭제 ? -->
		
		<div id="backButton">
			<button type="button" class="btn btn-primary" onclick="history.back();">
				예약하기 
			</button>
			&nbsp;&nbsp;&nbsp;
			<a class="emoticon" href="<%=notWithFormTag%>boEmoticon&mode=likes&no=${bean.no}">
				<img src="<%=appName%>/image/likes.png" width="30px" height="30px" alt="">
				${bean.likes}
			</a>
			&nbsp;&nbsp;
			<a class="emoticon" href="<%=notWithFormTag%>boEmoticon&mode=hates&no=${bean.no}">
				<img src="<%=appName%>/image/hates.png" width="30px" height="30px" alt="">
				${bean.hates}
			</a>				
		</div>			
	</div>
</body>
</html>
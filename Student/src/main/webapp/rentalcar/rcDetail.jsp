<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>    
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Insert title here</title>
	
	<!-- kakao map api -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=72eb84a62edf4d4ab7f08e47e8ca4b6d"></script>
	<!-- kakao map -->
	<script>
	
	/* kakaoMap */
		$(function() {	
			/* kakao map */
			var container = document.getElementById('map');
			var options = {
				center: new kakao.maps.LatLng(33.450701, 126.570667),
				level: 3
			};
			var map = new kakao.maps.Map(container, options);
			
			/* '예약 하기' 버튼 클릭 시 alert */
			$("#bookCarBtn").click(function() {
			    /*  로그인 check */
			    if(${sessionScope.loginfo.id == null}){
			    	const login = confirm("로그인이 필요합니다. 로그인하시겠습니까?");			    
				    // 로그인	
				    if(login){
				    	location.href = ' member/meLoginForm.jsp';
				    }else{
				    	
				    }
				    
				/* 이미 로그인 시 예약 */			    	
			    }else{
			    	const booking = confirm("예약하시겠습니까?");
			    	if(booking){
			    		$('#bookCarForm').submit();			    		
			    		swal("예약이 완료되었습니다!");
			    		/* 사용자 아이디, 렌터카 번호 넘겨야 함. */
			    	}else{
			    		return;
			    	}
			    }
			});


		});
	</script>
	

	<style type="text/css">
	.hide_login{
		display: none;
	}
</style>
</head>
<body>
	<!-- 사이드에 지도 및 예약 하기 팝업 -->
	
	<div class="container">
		<h2>[${requestScope.bean.rcid}]번 렌터카 정보</h2>
		<table class="table">
			<thead>
			</thead>
			<tbody>
				<tr>
					<td align="center">차량 번호</td>
					<td>${requestScope.bean.rcid}</td>
				</tr>
				<tr>
					<td align="center">차 종류</td>
					<td>${requestScope.bean.carType}</td>
				</tr>
				<tr>
					<td align="center">대여 장소</td>
					<td><c:choose>
							<c:when test="${requestScope.bean.startLocation eq 'seoul'}">
								<c:out value="서울" />
							</c:when>
							<c:when test="${requestScope.bean.startLocation eq 'daejeon'}">
								<c:out value="대전" />
							</c:when>
							<c:when test="${requestScope.bean.startLocation eq 'daegu'}">
								<c:out value="대구" />
							</c:when>
							<c:when test="${requestScope.bean.startLocation eq 'busan'}">
								<c:out value="부산" />
							</c:when>
							<c:when test="${requestScope.bean.startLocation eq 'jeju'}">
								<c:out value="제주" />
							</c:when>
						</c:choose></td>
				</tr>
				<tr>
					<td align="center">반납 장소</td>
					<td><c:choose>
							<c:when test="${requestScope.bean.endLocation eq 'seoul'}">
								<c:out value="서울" />
							</c:when>
							<c:when test="${requestScope.bean.endLocation eq 'daejeon'}">
								<c:out value="대전" />
							</c:when>
							<c:when test="${requestScope.bean.endLocation eq 'daegu'}">
								<c:out value="대구" />
							</c:when>
							<c:when test="${requestScope.bean.endLocation eq 'busan'}">
								<c:out value="부산" />
							</c:when>
							<c:when test="${requestScope.bean.endLocation eq 'jeju'}">
								<c:out value="제주" />
							</c:when>
						</c:choose></td>
				</tr>
				<tr>
					<td align="center">대여일</td>
					<td>${requestScope.bean.startDate}</td>
				</tr>
				<tr>
					<td align="center">반납일</td>
					<td>${requestScope.bean.endDate}</td>
				</tr>
				<tr>
					<td align="center">대여료</td>
					<td>${requestScope.bean.price}</td>
				</tr>
				<tr>
					<td align="center">탑승 가능 인원</td>
					<td>${requestScope.bean.passengers}</td>
				</tr>
				
				
			</tbody>
		</table>
	</div>
	<div class="offcanvas offcanvas-end" id="demo">
		<div class="offcanvas-header">
			<h1 class="offcanvas-title">지도</h1>
			<button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button>
		</div>
		<div class="offcanvas-body">
			<p>테스트</p>			
			<div id="map" style="width: 500px; height: 400px;"></div>
			<br/>
			<!-- 예약 submit -->
			<!-- enctype="multipart/form-data" -->
			<form action= "<%=withFormTag%>" method="post" id="bookCarForm" >  
				<input type="hidden" name="command" value="rcDetail">
				<input type="hidden" name="id" value="${sessionScope.loginfo.id}">
	    		<input type="hidden" name="rcid" value="${requestScope.bean.rcid}">
				<button class="btn btn-success" type="button" id="bookCarBtn" >예약 하기</button>
			</form>
		</div>
	</div>
	


	<div class="container">
		<div class="container-fluid mt-3">
			<h3>예약 지점 확인</h3>
			<p>예약 가능한 지점을 확인해보세요.</p>
			<button class="btn btn-primary" type="button"
				data-bs-toggle="offcanvas" data-bs-target="#demo">위치 보기</button>			
		</div>
	</div>
	
	
	<!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& -->
	
	<div class="hide_login2">
	
	<th:block th:fragment="setLogin(login)">
    <body>
    <div class="member_login">      
        <form th:action="@{/auth/loginProc}" th:method="POST">
            <div class="member_login_input">
                <input type="text" name="username" placeholder="아이디" >
            </div>

            <div class="member_login_input">
                <input type="password" name="password" placeholder="비밀번호">
            </div>
            <div class="member_login_btn">
 

                <input type="submit" class="btn btn-secondary" id="btn-login" value="로그인">

                <input type="button" class="btn btn-secondary" value="회원가입" onclick="location.href='/member/join'">
				
            </div>

            <div class="find_password">
                <a href="/forgot-password">아이디 또는 비밀번호를 잊으셨나요?</a>
            </div>

            <div class="login_api">
                <a href="https://kauth.kakao.com/oauth/authorize?client_id=d860d38c992ca8bf5f07dcc3fd5122b9&redirect_uri=http://localhost:8181/member/auth/kakao/callback&response_type=code"><img src="${pageContext.request.contextPath}/image/kakao_login.png"></a>
            </div>

<!--             <div class="login_api"> -->
<!--                 <a href="/oauth2/authorization/google"><img src="/image/google_login_button.png"></a> -->
<!--             </div> -->

        </form>
    </div>
    </body>
</th:block>
</div>
	

</body>
</html>
<%@ page import="com.shopping.myservlet.HelloServlet"%>
<%@ page import="com.shopping.model.bean.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ include file="../common/bootstrap5.jsp"%>
<%
String appName = request.getContextPath();
String mappingName = "/Shopping"; //in FrontController.java file

//form 태그에서 사용할 변수
String withFormTag = appName + mappingName;

//form 태그가 아닌 영역에서 사용할 변수
String notWithFormTag = appName + mappingName + "?command=";
%>	
<%-- jstl을 위한 태그 라이브러리 선언 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	/* Member mem = new Member();
	mem.setId("admin");
	mem.setName("관리자");
	session.setAttribute("loginfo",mem); */
%>
<c:set var="whologin" value="0"/>
<c:if test="${not empty sessionScope.loginfo}">
	<c:if test="${sessionScope.loginfo.id == 'admin'}">
		<c:set var="whologin" value="2"/>
	</c:if>
	<c:if test="${sessionScope.loginfo.id != 'admin'}">
		<c:set var="whologin" value="1"/>
	</c:if>
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 이 파일은 모든 문서에서 공용으로 참조 할 파일입니다. -->
<!-- 자바 관련 변수 및 패키지 임포트, 네비게이션 바, jstl 등등-->
<script src="/Student/js/sweetalert.min.js"></script>
<script type="text/javascript">

</script>
<style type="text/css">
.navbar {
	margin-bottom: 20px;
	position: fixed !important;
	top:0px;
	width:100% !important;
	z-index: 999 !important;
}

.alert-danger {
	margin-left: 20px;
	margin-right: 100px;
}
.nav-link.login {
	color: aqua !important;
}

.nav-link.logout {
	color : red !important;
	opacity: 90% !important;
}

.nav-link{
	color : white !important;
}

.logout {
	color : red !important;
	opacity: 90%;
}
.login {
	color : aqua !important;
	opacity: 100% !important;
}

.navbar-text {
	text-decoration-line : none !important;
	color: white !important;
	padding-top : 0.5rem !important;
}
body{
	padding-top:56px !important;
}
.container{
	margin-left:auto;
	margin-right:auto;
}
.dropdown-div {
	width:800%;
	display: flex;
	position: absolute;
	left:0;
	right:0;
	margin-left:auto;
	margin-right:auto;
	padding-left:600px;
	padding-right:600px;
	justify-content: center;
	clear: both;
}
.login-div{
	display:flex;
	width:220px;
	clear: both;
}
.navbar-nav{
	width:220px;
}
.dropdown{
	margin-right:15px;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="/Student/common/home.jsp">쇼핑몰</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="collapsibleNavbar">
				<ul class="navbar-nav">
					<div class="login-div">
						<c:if test="${whologin == '0'}">
							<li class="nav-item"><a class="nav-link login" href="<%=notWithFormTag%>meLogin">로그인</a></li>
							<li><a class="nav-link create" href="<%=notWithFormTag%>meInsert">회원 가입</a></li>
						</c:if>
						<c:if test="${whologin == '1'}">
							<a class="navbar-text">${sessionScope.loginfo.id}(일반 유저)</a>
							<li class="nav-item"><a class="nav-link logout" href="<%=notWithFormTag%>meLogout">로그 아웃</a></li>
						</c:if>
						<c:if test="${whologin == '2'}">
							<a class="navbar-text">${sessionScope.loginfo.id}(관리자)</a>
							<li class="nav-item"><a class="nav-link logout" href="<%=notWithFormTag%>meLogout">로그 아웃</a></li>
						</c:if>
					</div>
					<div class="dropdown-div">
						<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">회원</a>
							<ul class="dropdown-menu">
								<c:if test="${whologin == '0'}">
								</c:if>
								<c:if test="${whologin != '0'}">
									<li><a class="dropdown-item" href="<%=notWithFormTag%>meDetail&id=${sessionScope.loginfo.id}">상세 보기</a></li>
									<li><a class="dropdown-item" href="/Student/member/meUpdateForm01.jsp">정보 수정</a></li>
									<li><a class="dropdown-item" href="#">탈퇴하기</a></li>
								</c:if>
								<c:if test="${whologin == '2'}">
									<li><a class="dropdown-item" href="<%=notWithFormTag%>meList">목록 보기</a></li>
								</c:if>
							</ul>
						</li>
						<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">게시물</a>
							<ul class="dropdown-menu">
								<c:if test="${whologin == '1' || whologin == '2'}">
									<li><a class="dropdown-item" href="<%=notWithFormTag%>boInsert">게시물 등록</a></li>
								</c:if>
								<li><a class="dropdown-item" href="<%=notWithFormTag%>boList">목록 보기</a></li>
							</ul>
						</li>
						<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">상품</a>
							<ul class="dropdown-menu">
								<c:if test="${whologin == '2'}">
									<li><a class="dropdown-item" href="<%=notWithFormTag%>prInsert">상품 등록</a></li>
								</c:if>
								<li><a class="dropdown-item" href="<%=notWithFormTag%>prList">목록 보기</a></li>
							</ul>
						</li>
						                 <!-- 쇼핑몰 section -->
		                <li class="nav-item dropdown">
		                	<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">쇼핑몰</a>
		                  	<ul class="dropdown-menu">          
		                    	<li>
			                       <a class="dropdown-item" href="<%=notWithFormTag%>maList">
			                          카트 내역 보기
			                       </a>
			                    </li>
			                    <li>
			                       <a class="dropdown-item" href="<%=notWithFormTag%>maHistory">
			                          나의 쇼핑 내역
			                       </a>
			                   </li>
		                  	</ul>
		                </li> 
						<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">데이터 보기</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="<%=notWithFormTag%>vwList">목록 보기</a></li>
							</ul>
						</li>
						<li class="nav-item dropdown">
						<a	class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">숙박 보기</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="<%=notWithFormTag%>acList">목록보기</a></li>
								<c:if test="${whologin == 2}">
									<li><a class="dropdown-item" href="<%=notWithFormTag%>acInsert">숙박 등록</a></li>
								</c:if>							
							</ul>
						</li>
						<li class="nav-item dropdown">
						<a	class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">투어</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="<%=notWithFormTag%>tourHome">투어홈</a></li>
								<c:if test="${whologin == 2}">
									<li><a class="dropdown-item" href="<%=notWithFormTag%>tourInsert">투어 등록</a></li>
								</c:if>							
							</ul>
						</li>	
					</div>
				</ul>
			</div>
		</div>
	</nav>
	<c:if test="${not empty sessionScope.alertMessage}">
		<div class="alert alert-danger alert-dismissible fade show">
	    	<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
	    	<strong></strong> ${sessionScope.alertMessage}
	  	</div>
	  	<c:remove var="alertMessage" scope="session"/>
  	</c:if>
</body>
</html>
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<title>Insert title here</title>
<!-- 이 파일은 모든 문서에서 공용으로 참조 할 파일입니다. -->
<!-- 자바 관련 변수 및 패키지 임포트, 네비게이션 바, jstl 등등-->
<script src="/Student/js/sweetalert.js"></script>
<script type="text/javascript">
	var togglecheck = "";
	function toggleSideOn(){
		togglecheck = "on";
		checkToggle();
	}
	
	function toggleSideOff(){
		togglecheck = "";
		checkToggle();
	}
	
	function checkToggle(){
		if(togglecheck == "on"){
			$("#side-bar-toggle, .side-bar, .side-bar-inner, html, body, .copyright, .navbar").addClass("sideon");
		}else{
			$("#side-bar-toggle, .side-bar, .side-bar-inner, html, body, .copyright, .navbar").removeClass("sideon");
		}
	}
	$(function(){
		  $('.top-btn').on('click',function(e){
		      e.preventDefault();
		      $('html,body').animate({scrollTop:0},0);
		  });
		});
</script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
@import url(//fonts.googleapis.com/earlyaccess/kopubbatang.css);
#side-bar-toggle .side-bar-on-btn {
	position:absolute;
	top:10px;
	display:block;
	width:50px; 
	height:30px; 
	border-radius:5px 5px 5px 5px;
	color:black;
	background-color: black;
	padding-top:1px;
	padding-bottom:1px;
	font-size: 14px;
	text-align: center;
	border: none;
	transform:translate(0px,0);
    transition:transform 300ms;
}
#side-bar-toggle.sideon .side-bar-on-btn {
	display: none;
}
.side-bar-off-btn {
	display: none;
}
.side-bar-inner.sideon .side-bar-off-btn {
	position:absolute;
	top:7px;
	display:block;
	width:40px; 
	height:27px; 
	border-radius:10px 10px 10px 10px; 
	background:#4cadcc; 
	text-align:center; 
	background-color: black;
	color:white;
	padding-top:1px;
	padding-bottom:1px;
	font-size: 14px;
	text-align: center;
	margin-right:78%;
	border-style: none;
	transform:translate(0px,0);
    transition:transform 300ms;
    font-size: 25px;
    font-weight: bolder;
}
.side-bar-inner.sideon {
	position: relative;
	display:flex;
	flex-direction:column;
	background-color: black;
	width:200px;
	height:948px;
	z-index: 999;
	pointer-events:all;
	border-radius: 0px 0px 0px 0px;
	transform:translate(0px,0);
	transition:transform 300ms ease 0ms;
}
.side-bar-inner {
	width:200px;
	height:948px;
	display:flex;
	right:-50px;
	background-color: black;
	pointer-events:none;
	position: relative;
	transform:translate(0,0);
    transition:transform 300ms;
}
.side-bar.sideon {
	width:0px;
	height:0px;
	position:fixed;
	top: 0px;
	z-index: 999 !important;
    border-radius: 10px 10px 10px 10px;
    transform:translate(-200px,0);
    transition:transform 300ms;
    
}
.side-bar {
	width:0px;
	height:0px;
	position:fixed;
	top: 0px;
	right: 50px;
	z-index: 999 !important;
    transform:translate(0px,0);
    transition:transform 300ms;
}
.simple-login {
	width:100%;
	position:absolute;
}
.simple-login-a {
	width:25%;
	position:relative;
	filter:grayscale(100%);
}
.simple-login-a:hover {
	width:25%;
	position:relative;
	filter:grayscale(100%);
}
.simple-login-div {
	width:100%;
	height:20%;
	top:80%;
	position: absolute;
	padding:10px 20px 10px 20px;
	display:flex;
	float:left;
	justify-content: space-between;
}
.side-bar-icon {
	width:80%;
	filter:invert(1);
}
.navbar {
	margin-bottom: 20px !important;
	position: fixed !important;
	top:0px !important;
	width:calc(100% + 200px) !important;
	z-index: 999 !important;
	background-color: black !important;
	padding-right:100px;
	padding-left:100px;
}
.navbar-brand {
	position: relative !important;
	z-index: 998 !important;
	font-family: 'Jeju Gothic', sans-serif !important;
}

.alert-danger {
	margin-left: auto;
	margin-right: auto;
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
	font-family: 'Jeju Gothic', sans-serif !important;
}
.non-dropdown{
	color : white !important;
	z-index: 998;
	position: relative;
	font-family: 'Jeju Gothic', sans-serif !important;
}
.logout {
	color : red !important;
	opacity: 90%;
	z-index: 998;
	position: relative;
	font-family: 'Jeju Gothic', sans-serif !important;
}
.login {
	color : aqua !important;
	opacity: 100% !important;
	z-index: 998;
	position: relative;
	font-family: 'Jeju Gothic', sans-serif !important;
}
.create {
	color : white !important;
	z-index: 998;
	position: relative;
	font-family: 'Jeju Gothic', sans-serif !important;
}

.navbar-text {
	text-decoration-line : none !important;
	color: white !important;
	padding-top : 0.5rem !important;
}
body{
	padding-top:56px !important;
	padding-bottom:120px !important;
	justify-content: center;
    display: flex;
    position: relative !important;
    z-index: 999 !important;
    min-width: 70% !important;
    transition:width 300ms;
}
.container{
	margin-left:auto;
	margin-right:auto;
}
.dropdown-div {
	width:800px !important;
	display: flex !important;
	position: absolute !important;
	left:0 !important;
	right:0 !important;
	margin-left: auto !important;
	margin-right: auto !important;
	padding-left: 720px !important;
	padding-right: 720px !important;
	justify-content: center !important;
	clear: both !important;
}
.login-div{
	display:flex;
	width:330px;
	clear: both;
}
.navbar-nav{
	width:220px;
}
.dropdown{
	margin-right:15px;
}
.dropdown-menu {
	background-color:rgb(33,37,41) !important;
	margin-top:7px !important;
}
.dropdown-item {
	color: white !important;
	font-family: 'Jeju Gothic', sans-serif !important;
	padding-left:9px;
	padding-right:2px;
}
.dropdown-item:hover {
	background-color: rgb(53,53,53) !important;
}
#top{
	position:relative; 
	display:none; 
	pointer-events:none; 
	top:0%
}
.copyright{
	padding-bottom: 0px;
	z-index: 998 !important;
}

.arrow {
    position: absolute;
    left: 0; 
    top: 0; 
    filter:grayscale(100%);
    content: '';
    width: 25px; /* 사이즈 */
    height: 25px; /* 사이즈 */
    border-top: 5px solid #000; /* 선 두께 */
    border-right: 5px solid #000; /* 선 두께 */
    transform: rotate(-45deg); /* 각도 */
}
.top-btn-div{
	position:fixed;
	right:75px;
	bottom:150px;
	z-index: 997;
}
body.sideon, .navbar.sideon, .copyright.sideon{
	width:calc(100% - 200px) !important;
	padding-right:0;
	padding-left:0;
	transition:width 300ms;
}
.dummy-navbar{
	height:56px !important;
	background-color: black !important;
	width:120% !important;
	position: fixed !important;
	top:0 !important;
	z-index: -999 !important;
}
.dummy-copyright{
	height:85.61px !important;
	background-color: black !important;
	width:120% !important;
	position: fixed !important;
	bottom:0 !important;
	z-index: -999 !important;
}

</style>
</head>
<body>
	<div id="top"></div>
	<c:if test="${not empty sessionScope.alertMessage}">
		<div class="alert alert-danger alert-dismissible fade show">
	    	<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
	    	<strong></strong> ${sessionScope.alertMessage}
	  	</div>
	  	<c:remove var="alertMessage" scope="session"/>
  	</c:if>
</body>
<!--  footer -->
	<div class="dummy-navbar"></div>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark" id="navbar">
		<div class="container-fluid">
			<a class="navbar-brand" href="/Student/common/home.jsp">ICTPentaTour</a>
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
							<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">항공</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="<%=notWithFormTag%>airHome">목록보기</a></li>
							</ul>
						</li>
						<li class="nav-item dropdown">
							<a	class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">숙박</a>
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
								<li><a class="dropdown-item" href="<%=notWithFormTag%>tourHome">투어 홈</a></li>
								<c:if test="${whologin == 2}">
									<li><a class="dropdown-item" href="<%=notWithFormTag%>tourInsert">투어 등록</a></li>
								</c:if>							
							</ul>
						</li>
						<li class="nav-item dropdown">
						<a	class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">렌트카</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="<%=notWithFormTag%>rcList">렌트카</a></li>
								<c:if test="${whologin == 2}">
									
								</c:if>							
							</ul>
						</li>	
					</div>
				</ul>
			</div>
		</div>
	</nav>
<div class="dummy-copyright"></div>
<div id="container" class="copyright" style="width: 100%; z-index: 1; bottom:0; position: fixed;">
	<ul class="icons">
		<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
		<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
		<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
		<li><a href="#" class="icon fa-solid fa-envelope"><span class="label">Email</span></a></li>
		<li><a href="https://github.com/momorichan/ictPentaTour" class="icon fa-brands fa-square-github"><span class="label">GitHub</span></a></li><br>
		<li>Made with <a href="https://naver.com/">5조</a></li>
	</ul>
</div>
<!-- side bar -->
<div class="side-bar">
	<div id="side-bar-toggle" class="">
		<button type="button" class="side-bar-on-btn" onclick="toggleSideOn()"><img class="side-bar-icon" src="/Student/upload/sidebar.png"></button>
	</div>
	<div class="side-bar-inner">
		<button type="button" class="side-bar-off-btn" onclick="toggleSideOff()">X</button>
		<div class="simple-login-div">
			<a class="simple-login-a google-login" href=""><img class="simple-login" src="/Student/upload/google.png"></a>
			<a class="simple-login-a kakao-login" href=""><img class="simple-login" src="/Student/upload/kakao.png"></a>
		</div>
	</div>
</div>
<div class="top-btn-div">
	<a class="top-btn" href=""><span class="arrow"></span></a>
</div>
</html>
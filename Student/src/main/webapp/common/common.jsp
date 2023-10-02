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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<title>Insert title here</title>
<!-- 이 파일은 모든 문서에서 공용으로 참조 할 파일입니다. -->
<!-- 자바 관련 변수 및 패키지 임포트, 네비게이션 바, jstl 등등-->
<script src="/Student/js/sweetalert.js"></script>
<script type="text/javascript">
	var scrollheight = 0;
	var navbartoggle = "";
	$(window).scroll(function(){
	    scrollheight = $(window).scrollTop();
	    if(scrollheight < 1 && window.innerWidth > 1900){
			$(".navbar-brand, .navbar, .dropdown, .login-div, body, .dropdown-div").addClass("scrolltop");
			$(".navbar").removeClass("non-scrolltop");
			$(".dropdown-toggle, .dropdown-menu").addClass("show");
			$(".dropdown-toggle").attr("aria-expanded", "true");
			$('html,body').animate({scrollTop:0},0);
		}
		if(scrollheight > 1 || window.innerWidth <= 1900){
			$(".navbar-brand, .navbar, .dropdown, .login-div, body, .dropdown-div").removeClass("scrolltop");
			$(".navbar").addClass("non-scrolltop");
			$(".dropdown-toggle, .dropdown-menu").removeClass("show");
			$(".dropdown-toggle").attr("aria-expanded", "false");
		}
		
	    return scrollheight;
	});
	window.addEventListener('resize', () => {
		if(window.innerWidth <= 1900){
			$(".navbar-brand, .navbar, .dropdown, .login-div, body, .dropdown-div").removeClass("scrolltop");
			$(".navbar").addClass("non-scrolltop");
			$(".dropdown-toggle, .dropdown-menu").removeClass("show");
			$(".dropdown-toggle").attr("aria-expanded", "false");
		}
	});
	window.onload=function(){
		if(window.innerWidth < 501) {
			$(".slide-div, .card-title, .card, .card-img-top, .serchcon, .tablecon, .tablecon-2, .navbar-toggle-btn").addClass("mobile");
		}
	}
	window.addEventListener('resize', () => {
		if(window.innerWidth < 501) {
			$(".slide-div, .card-title, .card, .card-img-top, .serchcon, .tablecon, .tablecon-2, .navbar-toggle-btn").addClass("mobile");
		}
		if(window.innerWidth >= 501) {
			$(".slide-div, .card-title, .card, .card-img-top, .serchcon, .tablecon, .tablecon-2, .navbar-toggle-btn").removeClass("mobile");
			$(".navbar, .dropdown-div").removeClass("toggle-on");
			$(".dropdown-div").removeClass("dropstart");
			$(".collapse").removeClass("show");
			navbartoggle = "";
		}
	});
	function navtoggle(){
		if(navbartoggle == ""){
			$(".navbar, .dropdown-div").addClass("toggle-on");
			$(".dropdown-div").addClass("dropstart");
			$(".collapse").addClass("show");
			navbartoggle = "on";
		}else{
			$(".navbar, .dropdown-div").removeClass("toggle-on");
			$(".dropdown-div").removeClass("dropstart");
			$(".collapse").removeClass("show");
			navbartoggle = "";
		}
	};
	var setCookie = function(name, value) {
	    document.cookie = name + '=' + value;
	};
	var getCookie = function(name) {
	    var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
	    return value? value[2] : null;
	};
	document.cookie = getCookie("sidebar");
	function toggleSideOn(){
		setCookie("sidebar", "on")
		checkToggle();
	}
	
	function toggleSideOff(){
		setCookie("sidebar", "")
		checkToggle();
	}
	
	function checkToggle(){
		if(getCookie("sidebar") == "on"){
// 			$("#side-bar-toggle, .side-bar, .side-bar-inner, html, body, .copyright, .navbar").addClass("sideon");
			$(".side-icon, .hide-arrow, .side-bar-icon-div, .top-btn-div").addClass("sideon");
			$(".side-hide-btn").attr("href", 'javascript:toggleSideOff();')
		}else{
// 			$("#side-bar-toggle, .side-bar, .side-bar-inner, html, body, .copyright, .navbar").removeClass("sideon");
			$(".side-icon, .hide-arrow, .side-bar-icon-div, .top-btn-div").removeClass("sideon");
			$(".side-hide-btn").attr("href", 'javascript:toggleSideOn();')
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
.navbar-toggler{
	display:none !important;
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
.card.mobile {
    width: 215px;
    height: 290px;
    margin-left: auto;
    margin-right: auto;
}
.card-title.mobile {
    font-size: 1.0rem;
}
.card-img-top.mobile {
    width: 213px;
    height: 133px;
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
.serchcon.mobile {
    width: 460px;
}
.tablecon-2.mobile {
	display: block;
}
.tablecon-2{
	display: none;
}
.tablecon.mobile {
	display: none;
}
.tablecon{
	display: block;
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
	padding-top:10px;
	padding-bottom:10px;
	margin-bottom: 25px !important;
	position: fixed !important;
	top:0px !important;
	width:100% !important;
	z-index: 999 !important;
	background-color: black !important;
	transition: 300ms;
}
.navbar.non-scrolltop.toggle-on {
    padding-top: 10px;
    padding-bottom: 370px;
    margin-bottom: 25px !important;
    position: fixed !important;
    top: 0px !important;
    right: 0px !important;
    width: 100% !important;
    z-index: 999 !important;
    background-color: black !important;
    transition: 300ms;
}
.navbar.toggle-on {
    padding-top: 10px;
    padding-bottom: 370px;
    margin-bottom: 25px !important;
    position: fixed !important;
    top: 0px !important;
    right: 0px !important;
    width: 100% !important;
    z-index: 999 !important;
    background-color: black !important;
    transition: 300ms;
}
.navbar-toggle-btn.mobile{
	position: fixed;
	right:10px;
	top:10px;
	width:40px;
	height:40px;
	background: none;
	border: none;
	filter:invert(1);
	display: block;
}
.navbar-toggle-btn{
	display:none;
}
.navbar.non-scrolltop {
	padding-top:10px;
	padding-bottom:10px;
	margin-bottom: 25px !important;
	position: fixed !important;
	top:0px !important;
	right:0px !important;
	width:100% !important;
	z-index: 999 !important;
	background-color: black !important;
	transition: 300ms;
}
.navbar.scrolltop {
	padding-bottom:200px;
	padding-top:10px;
	margin-bottom: 25px !important;
	position: fixed !important;
	top:0px !important;
	width:100% !important;
	z-index: 999 !important;
	background-color: black !important;
}
.navbar-brand {
	position: relative !important;
	z-index: 998 !important;
	font-family: 'Jeju Gothic', sans-serif !important;
	transition:color 300ms;
}
.navbar-brand.scrolltop {
	position: absolute!important;
    z-index: 998 !important;
    font-family: 'Jeju Gothic', sans-serif !important;
    color: white;
    top: 0;
    font-size: 44px;
    transition: 300ms;
}
.slide-div.mobile {
    justify-content: center;
    display: block;
    width: 460px;
    height: 220px;
    margin-left: auto;
    margin-right: auto;
    margin-top: 20px;
    margin-bottom: 20px;
    border-radius: 10px;
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
	top:2px;
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
html{
	
}
body{
	padding-top:70px !important;
	padding-bottom:120px !important;
	justify-content: center;
    display: flex;
    flex-direction:column;
    position: relative !important;
    z-index: 999 !important;
    min-width: 70% !important;
    transition:300ms;
}

body.scrolltop{
	padding-top:200px !important;
	padding-bottom:120px !important;
	justify-content: center;
    display: flex;
    flex-direction:column;
    position: relative !important;
    z-index: 999 !important;
    min-width: 70% !important;
    transition:300ms;
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
	transition: 300ms
}
.dropdown-div.dropstart.toggle-on {
	width:800px !important;
	display: flex !important;
	flex-direction:column;
	position: absolute !important;
	left:0 !important;
	right:0 !important;
	margin-left: auto !important;
	margin-right: auto !important;
	padding-left: 370px !important;
	padding-right: 0px !important;
	justify-content: center !important;
	clear: both !important;
	transition: 300ms
}
.dropdown-div.scrolltop {
	width:800px !important;
	display: flex !important;
	position: absolute !important;
	left:0 !important;
	right:0 !important;
	margin-left: auto !important;
	margin-right: auto !important;
	padding-left: 200px !important;
	padding-right: 0px !important;
	justify-content: center !important;
	clear: both !important;
}
.login-div{
	display:flex;
	width:330px;
	clear: both;
}
.login-div.scrolltop{
	display: flex;
    width: 330px;
    clear: both;
    position: absolute;
    top: 50%;
    margin-left: 0;
    font-size: 20px;
    transition: 300ms;
}
.navbar-nav{
	width:220px;
}
.dropdown{
	width:auto;
	margin-right:15px;
	display: block;
	transition: width 300ms, margin-right 300ms;
}
.dropdown.scrolltop{
	margin-right:87px;
	width:72px;
	display: block;
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
.dropstart .dropdown-menu[data-bs-popper] {
    top: auto;
    right: 120px;
    bottom: auto;
    left: auto;
    transform: translate(0px, -50px);
    margin-top: 0;
    margin-right: var(--bs-dropdown-spacer);
    position: fixed;
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
.top-btn-div{
	position:fixed;
	right:14px;
	bottom:90px;
	z-index: 997;
	display: flex;
	flex-direction: row;
	pointer-events:none;
}
.top-btn-div.sideon{
	position:fixed;
	right:14px;
	bottom:90px;
	display: flex;
	flex-direction: row;
	pointer-events:all;
	z-index: 999;
}
.arrow {
    position: relative;
    left: 0; 
    top: 0; 
    filter:grayscale(100%);
    content: '';
    width: 25px;
    height: 25px;
    border-top: 5px solid #000;
    border-right: 5px solid #000;
    transform: rotate(-45deg);
}
.kakao {
	position:relative;
	width:50px;
	height:50px;
}
.naver {
	position:relative;
	width:50px;
	height:50px;
}
.top-btn {
	display: flex;
	position: relative;
	margin-top:10px;
	justify-content: center;
	pointer-events:all !important;
	z-index: 999 !important;
}
.side-bar-icon-div {
	display: flex;
	flex-direction: column;
	pointer-events: none;
}
.side-bar-icon-div.sideon {
	display: flex;
	flex-direction: column;
	pointer-events: all;
}
.side-hide-btn {
	bottom:90%;
	position:absolute;
	margin-left: -6px;
	opacity: 30%;
	pointer-events:all !important;
}
.hide-arrow {
	position: absolute;
    left: 0; 
    top: 0; 
    filter:grayscale(100%);
    content: '';
    width: 25px;
    height: 25px;
    border-top: 7px solid #000;
    border-right: 7px solid #000;
    transform: translate(4px, 0) scaleX(0.3) scaleY(0.7) rotate(-135deg);
}
.hide-arrow.sideon {
	position: absolute;
    left: 0; 
    top: 0; 
    filter:grayscale(100%);
    content: '';
    width: 25px;
    height: 25px;
    border-top: 7px solid #000;
    border-right: 7px solid #000;
    transform:scaleX(0.3) scaleY(0.7) rotate(45deg);
}
.side-icon {
	position: relative;
	right:-75px;
	transition: transform 300ms;
}
.side-icon.sideon {
	transform: translate(-75px, 0);
	transition: transform 300ms;
}
</style>
<!-- --------------------------review-------------------------------- -->
<script type="text/javascript">
		$(document).ready(function(){
			var optionList = $('#mode option');
			for(var i=0 ; i<optionList.length ; i++){
				if(optionList[i].value == '${requestScope.pageInfo.mode}'){
					optionList[i].selected = true ;
				}	
			}
			
			$('#keyword').val('${requestScope.pageInfo.keyword}');
			
			$("#mode").change(function(){				 
				  if($(this).val() != 'all'){
					  $('#keyword').attr('disabled', false);
				  }else{
					  $('#keyword').val('');
					  $('#keyword').attr('disabled', true);
				  }
			});			
		});
		
		function searchAll(){ /* 전체 검색 */
			location.href = '<%=notWithFormTag%>rvList';
		}
		
		function writeForm(){ /* 글쓰기 */
			location.href = '<%=notWithFormTag%>rvInsert';
		}
		
	</script>
<style type="text/css">
.head {
	width: 100%;
	height: 300px;
	text-align : center;
}

.wrap {
	width: 100%;
	height: 300px;
	text-align : center;
}

.review-section {
	width: 100%;
	height: 300px;
}

.shape {
	height: 30px;
	background-color : #bbb;
	border-top : 1px;
}
.text_reviewtype{
	position : relative ;
	left : 70px ;
}
.point_box{
	display: flex;
}
.rating_main{
	display: flex;
}
.rvList_image {
	position: relative;
	
}

.rvList_image_text {
	position: absolute;
	top: 50%;
	left: 50%;
	color: white;
	transform: translate(-50%, -50%);
}

.progress-bar {
    width: 100%;
    height: 30px;
    background-color: #dedede;
    font-weight: 600;
    font-size: .8rem;
}

.progress {
    height: 30px;
    padding: 0;
    text-align: center;
    background-color: #4F98FF;
    color: #111;
}
.rating_box{
	float : right;
}
.rating_main_left {
    width: 50%;
    float: left;
    box-sizing: border-box;  
    }
.rating_main_right {
     width: 50%;
     float: right;
     box-sizing: border-box;
    }
.point_txt{
 	width: 600px;height: 400px;
	line-height: 100px; /* 세로 가운데 정렬 : line-height와 height값을 동일하게 처리합니다.*/
	text-align: center /* 텍스트 가운데 정렬 */
}
</style>
</head>
<body>
	
</body>
<!--  footer -->
<!-- 	<div class="dummy-navbar"></div> -->
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
								<li><a class="dropdown-item" href="<%=notWithFormTag%>rcHome">렌트카 홈</a></li>
								<li><a class="dropdown-item" href="<%=notWithFormTag%>rcList">렌트카 리스트</a></li>
								<c:if test="${whologin == 2}">									
								</c:if>							
							</ul>
						</li>	
					</div>
				</ul>
			</div>
			<button type="button" class="navbar-toggle-btn" onclick="navtoggle()"><img src="/Student/upload/sidebar.png" style="width:100%; height:100%"></button>
		</div>
	</nav>
	<div id="top"></div>
	<c:if test="${not empty sessionScope.alertMessage}">
		<div class="alert alert-danger alert-dismissible fade show">
	    	<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
	    	<strong></strong> ${sessionScope.alertMessage}
	  	</div>
	  	<c:remove var="alertMessage" scope="session"/>
  	</c:if>
<!-- <div class="dummy-copyright"></div> -->
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
<!-- <div class="side-bar"> -->
<!-- 	<div id="side-bar-toggle" class=""> -->
<!-- 		<button type="button" class="side-bar-on-btn" onclick="toggleSideOn()"><img class="side-bar-icon" src="/Student/upload/sidebar.png"></button> -->
<!-- 	</div> -->
<!-- 	<div class="side-bar-inner"> -->
<!-- 		<button type="button" class="side-bar-off-btn" onclick="toggleSideOff()">X</button> -->
<!-- 		<div class="simple-login-div"> -->
<!-- 			<a class="simple-login-a google-login" href=""><img class="simple-login" src="/Student/upload/google.png"></a> -->
<!-- 			<a class="simple-login-a kakao-login" href=""><img class="simple-login" src="/Student/upload/kakao.png"></a> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->
<div class="top-btn-div sideon">
	<div class="side-bar-icon-div sideon">
		<a class="kakao-button side-icon sideon" href="https://open.kakao.com/o/gY9q37Ef" target='_blank'>
			<img class="side-button kakao" src="/Student/upload/kakao_chat.png">
		</a>
		<a class="naver-mail-button side-icon sideon" href="mailto:﻿superman@test.com?cc=user@dammy.net">
			<img class="side-button naver" src="/Student/upload/naver-icon.png" >
		</a>
		<a class="top-btn" href="">
			<span class="arrow"></span>
		</a>
	</div>
	<div>
		<a class="side-hide-btn " href="javascript:toggleSideOff();">
			<span class="hide-arrow sideon"></span>
		</a>
	</div>
</div>
</html>
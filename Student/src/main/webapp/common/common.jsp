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
<c:set var="whologin" value="0"/>
<c:if test="${not empty sessionScope.loginfo}">
	<c:if test="${sessionScope.loginfo.meid == 'admin'}">
		<c:set var="whologin" value="2"/>
	</c:if>
	<c:if test="${sessionScope.loginfo.meid != 'admin'}">
		<c:set var="whologin" value="1"/>
	</c:if>
</c:if>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css?after">
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

<!-- 이 파일은 모든 문서에서 공용으로 참조 할 파일입니다. -->
<!-- 자바 관련 변수 및 패키지 임포트, 네비게이션 바, jstl 등등-->
<script src="/Student/js/sweetalert.js"></script>
<script type="text/javascript">
	var scrollheight = 0;
	var navbartoggle = "";
	var setCookie = function(name, value) {
	    document.cookie = name + '=' + value;
	};
	var getCookie = function(name) {
	    var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
	    return value? value[2] : null;
	};
	document.cookie = getCookie("sidebar");
	$(window).scroll(function(){
	    scrollheight = $(window).scrollTop();
	    if(scrollheight < 50){
			$(".navbar").removeClass("non-scrolltop");
		}
	    if(scrollheight >= 50){
			$(".navbar").addClass("non-scrolltop");
		}
	    if(scrollheight < 1 && window.innerWidth > 1900){
			$(".navbar-brand, .navbar, .dropdown, .login-div, body, .dropdown-div").addClass("scrolltop");
			$(".dropdown-toggle, .dropdown-menu").addClass("show");
			$(".dropdown-toggle").attr("aria-expanded", "true");
			$('html,body').animate({scrollTop:0},0);
		}
		if(scrollheight > 1 || window.innerWidth <= 1900){
			$(".navbar-brand, .navbar, .dropdown, .login-div, body, .dropdown-div").removeClass("scrolltop");
			$(".dropdown-toggle, .dropdown-menu").removeClass("show");
			$(".dropdown-toggle").attr("aria-expanded", "false");
		}
		
		var bottom_of_window = $(window).scrollTop() + $(window).height();
		if(bottom_of_window > $('html').outerHeight() - 90) {
			$(".top-btn-div").addClass("bottom");
		} else {
			$(".top-btn-div").removeClass("bottom");
		}
	});
	window.addEventListener('resize', () => {
		if(window.innerWidth <= 1900){
			$(".navbar-brand, .navbar, .dropdown, .login-div, body, .dropdown-div").removeClass("scrolltop");
			$(".dropdown-toggle, .dropdown-menu").removeClass("show");
			$(".dropdown-toggle").attr("aria-expanded", "false");
		}
	});
	/* 모바일 */
	window.onload=function(){
		
	}
	window.addEventListener('resize', () => {
		if(window.innerWidth < 501) {
			$(".navbar-toggle-btn, .navbar").addClass("mobile");
			toggleSideOff();
		}
		if(window.innerWidth >= 501) {
			$(".navbar-toggle-btn, .navbar").removeClass("mobile");
			$(".navbar, .dropdown-div").removeClass("toggle-on");
			$(".dropdown-div").removeClass("dropstart");
			$(".collapse").removeClass("show");
			navbartoggle = "";
			toggleSideOn();
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
	$(document).ready(function(){
		if(window.innerWidth < 501) {
			$(".navbar-toggle-btn").addClass("mobile");
			toggleSideOff();
		}
		
		if(window.innerWidth < 501) {
			$(".navbar-toggle-btn").addClass("mobile");
			toggleSideOff();
		}else{
			$(".navbar-toggle-btn").removeClass("mobile");
			toggleSideOn();
		}
	});
	function clicklogin() {
		window.open("<%=notWithFormTag %>mePopup" , "a", "width=600, height=640, left=100, top=50");
	}
</script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">

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
</style>
</head>
<body>
	
</body>
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
							<li class="nav-item"><a class="nav-link login" href="" onclick="clicklogin()">로그인</a></li>
							<li><a class="nav-link create" href="<%=notWithFormTag%>meInsert">회원 가입</a></li>
						</c:if>
						<c:if test="${whologin == '1'}">
							<a class="navbar-text">${sessionScope.loginfo.meid}(일반 유저)</a>
							<li class="nav-item"><a class="nav-link logout" href="<%=notWithFormTag%>meLogout">로그 아웃</a></li>
						</c:if>
						<c:if test="${whologin == '2'}">
							<a class="navbar-text">${sessionScope.loginfo.meid}(관리자)</a>
							<li class="nav-item"><a class="nav-link logout" href="<%=notWithFormTag%>meLogout">로그 아웃</a></li>
						</c:if>
					</div>
					<div class="dropdown-div">
						<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">회원</a>
							<ul class="dropdown-menu">
								<c:if test="${whologin == '0'}">
								</c:if>
								<c:if test="${whologin != '0'}">
									<li><a class="dropdown-item" href="<%=notWithFormTag%>meDetail&meid=${sessionScope.loginfo.meid}">상세 보기</a></li>
									<li><a class="dropdown-item" href="<%=notWithFormTag%>meUpdate&meid=${sessionScope.loginfo.meid}">정보 수정</a></li>
									<li><a class="dropdown-item" href="<%=notWithFormTag%>meDelete&meid=${sessionScope.loginfo.meid}">탈퇴하기</a></li>
								</c:if>
								<c:if test="${whologin == '2'}">
									<li><a class="dropdown-item" href="<%=notWithFormTag%>meList">목록 보기</a></li>
								</c:if>
							</ul>
						</li>
						<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">게시물</a>
							<ul class="dropdown-menu">
								<c:if test="${whologin == '1' || whologin == '2'}">
									<li><a class="dropdown-item" href="<%=notWithFormTag%>rvDetail">게시물 등록</a></li>
								</c:if>
								<li><a class="dropdown-item" href="<%=notWithFormTag%>rvList">목록 보기</a></li>
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
<!--  footer -->
<!-- <div class="dummy-copyright"></div> -->
<div id="container" class="copyright" style="width: 100%; z-index: 1; bottom:0; position:absolute;">
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
		<a class="naver-mail-button side-icon sideon" href="">
			<img class="side-button naver" src="/Student/upload/naver_mail.png">
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
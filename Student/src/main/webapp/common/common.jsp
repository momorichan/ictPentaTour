<%@page import="com.shopping.model.bean.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%
	// appName : 애플리케이션 이름(프로젝트 이름_Student)
	String appName = request.getContextPath();
	String mappingName = "/Shopping"; //in FrontController.java file
	
	//form 태그에서 사용할 변수
	String withFormTag = appName + mappingName;

	//form 태그가 아닌 영역에서 사용할 변수
	String notWithFormTag = appName + mappingName + "?command=";

	//out.print("프로젝트 이름 : " + appName);
	//out.print("mappingName : " + mappingName + "<br>");
	//out.print("withFormTag : " + withFormTag + "<br>");
	//out.print("notWithFormTag : " + notWithFormTag + "<br>");
%>

<%-- jstl을 위한 태그 라이브러리 선언 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
/* 	Member mem = new Member();
	mem.setId("admin");
	mem.setName("길동");
	session.setAttribute("loginfo", mem);
	
	//경고성 Alert box
	//session.setAttribute("alertMessage", "아이디/비밀번호 정보를 잘못 입력했습니다.");
	session.setAttribute("alertMessage", null); */
%> 
<!-- whologin 변수는 현재 로그인 상태를 알려 주는 변수입니다. -->
<!-- 미로그인(0) 일반 사용자(1) 관리자(2)-->
<c:set var="whologin" value="0" />
<c:if test="${not empty sessionScope.loginfo}">
	<c:if test="${sessionScope.loginfo.id=='admin'}">
		<c:set var="whologin" value="2" />
	</c:if>
	<c:if test="${sessionScope.loginfo.id!='admin'}">
		<c:set var="whologin" value="1" />
	</c:if>
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 이 파일은 모든 문서에서 공용으로 참조할 파일입니다.  -->
<!-- 자바 관련 변수 및 패키지 임포트, 네비게이션 바, jstl 등등 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/sweetalert.js"></script>
<style type="text/css">
	.alert-dismissible{margin: 10px;}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">쇼핑몰</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="collapsibleNavbar">
				<ul class="navbar-nav">
					<li class="nav-item" >
						<c:if test="${whologin == 0}">	
							<a class="nav-link" href="#">미로그인</a>
						</c:if>
						<c:if test="${whologin != 0}">	
							<a class="nav-link" href="#">${sessionScope.loginfo.name}님</a>
						</c:if>
						</li>

					<!-- member section  -->
					<li class="nav-item dropdown">
					<a	class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown">회원</a>
						<ul class="dropdown-menu">
							<c:if test="${whologin == 0}">				
								<li><a class="dropdown-item" href="<%=notWithFormTag%>meInsert">회원가입</a></li>			
								<li><a class="dropdown-item" href="<%=notWithFormTag%>meLogin">로그인</a></li>
							</c:if>
							<c:if test="${whologin != 0}">			
								<li><a class="dropdown-item" href="<%=notWithFormTag%>meLogout">로그아웃</a></li>								
								<li><a class="dropdown-item" href="<%=notWithFormTag%>">정보수정</a></li>										
								<li><a class="dropdown-item" href="<%=notWithFormTag%>meDetail&id=${sessionScope.loginfo.id}">상세보기</a></li>
								<c:if test="${whologin == 1}">
									<li><a class="dropdown-item" href="<%=notWithFormTag%>">회원탈퇴</a></li>
								</c:if>
								<c:if test="${whologin == 2}">
									<li><a class="dropdown-item" href="<%=notWithFormTag%>meList">목록보기</a></li>
								</c:if>
							</c:if>

						</ul>
					</li>
					
					<!-- borad section  -->
					<li class="nav-item dropdown">
					<a	class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown">게시물</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="<%=notWithFormTag%>boList">목록보기</a></li>
							<c:if test="${whologin != 0}">	
								<li><a class="dropdown-item" href="<%=notWithFormTag%>boInsert">게시물 등록</a></li>
							</c:if>
						</ul>
					</li>		
								
					<!-- product section  -->
					<li class="nav-item dropdown">
					<a	class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown">상품</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="<%=notWithFormTag%>prList">목록보기</a></li>
						<c:if test="${whologin == 2}">
							<li><a class="dropdown-item" href="<%=notWithFormTag%>prInsert">상품 등록</a></li>
						</c:if>							
						</ul>
					</li>					
					
					<!-- view section  -->
					<li class="nav-item dropdown">
					<a	class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown">데이터 보기</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="<%=notWithFormTag%>vwList">목록보기</a></li>					
						</ul>
					</li>	

					<!-- accommodation section  -->
					<li class="nav-item dropdown">
					<a	class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown">숙박 보기</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="<%=notWithFormTag%>acList">목록보기</a></li>
						<c:if test="${whologin == 2}">
							<li><a class="dropdown-item" href="<%=notWithFormTag%>acInsert">숙박 등록</a></li>
						</c:if>							
						</ul>
						
					</li>											
				</ul>
			</div>
		</div>
	</nav>
	
	<c:if test="${not empty sessionScope.alertMessage}">
	<!-- 사용자에게 주의/경고/오류 등을 알려주시 위한 alert box -->
		<div class="alert alert-danger alert-dismissible">
		    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
		    <strong>오류</strong> ${sessionScope.alertMessage}
		</div>
	</c:if>
	<aside class="aside__menubar">
		sdfsadfsdafsdaf
	</aside>
	<!-- 보여준 alert box를 제거합니다. -->
	<c:remove var="alertMessage" scope="session"/>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/bootstrap5.jsp"%>
<%@ include file="./../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 1부터 10까지의 총합 구하기 -->
	<c:set var="total" value="0"/>
	<c:forEach var="i" begin="1" end="10" step="1" >
		<c:set var="total" value="${total+i}"/>
	</c:forEach>
	<c:out value="1부터 10까지의 총합 : ${total}"/>
	<br>
	<!-- 1부터 10까지의 짝수와 홀수의 총합 각각 구하기 -->
	<c:set var="oddtotal" value="0"/>
	<c:set var="eventotal" value="0"/>
	<c:forEach var="i" begin="1" end="10" step="1">
		<c:if test="${i%2==1}">
			<c:set var="oddtotal" value="${oddtotal+i}"/>
		</c:if>
		<c:if test="${i%2==0}">
			<c:set var="eventotal" value="${eventotal+i}"/>
		</c:if>
	</c:forEach>
	<c:out value="1부터 10까지의 홀수의 총합 : ${oddtotal}"/>
	<br>
	<c:out value="1부터 10까지의 짝수의 총합 : ${eventotal}"/><br>
	<!-- 1부터 10까지의 3의 배수 총합/4의 배수 총합/나머지 총합 구하기 -->
	<c:set var="total1" value="0"/>
	<c:set var="total2" value="0"/>
	<c:set var="total3" value="0"/>
	<c:forEach var="i" begin="1" end="10" step="1" >
		<c:choose>
			<c:when test="${i mod 3 eq 0}">
				<c:set var="total1" value="${total1+i}"/>
			</c:when>
			<c:when test="${i mod 4 eq 0}">
				<c:set var="total2" value="${total2+i}"/>			
			</c:when>
			<c:otherwise>
				<c:set var="total3" value="${total3+i}"/>
			</c:otherwise>	
		</c:choose>
	</c:forEach>
	<c:out value="1부터 10까지의 3의 배수의 총합 : ${total1}"/><br>
	<c:out value="1부터 10까지의 4의 배수의 총합 : ${total2}"/><br>
	<c:out value="1부터 10까지의 나머지의 총합 : ${total3}"/>	<br>
	
	<c:set var="id" value="hong"/>
	
	<c:if test="${empty id}">
		비어있음<br>
	</c:if>
	
	<c:if test="${not empty id}">
		데이터 ${id}가 들어 있음<br>
	</c:if>	
	
	<c:remove var="id"/>
	
	<c:if test="${empty id}">
		내용이 없습니다.<br>
	</c:if>	
	
	
	
</body>
</html>
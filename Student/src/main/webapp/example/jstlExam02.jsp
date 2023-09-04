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

	<!-- 1부터 100까지의 홀수의 총합을 구해 봅니다. 총합 구하기 : 1+3+5+...+99 = 2500 -->
	<c:set var="total" value="0"/>
	<c:forEach var="i" begin="1" end="100" step="1">
		<c:if test="${i%2==1}">
			<c:set var="total" value="${total+i}"/>
		</c:if>
	</c:forEach>
	1부터 100까지의 홀수의 총합 : <c:out value="${total}"/>
	<br>
	<!-- 시험 점수(jumsu)가 82점일때, 학점을 구해 보세요.
	'If 구문을 사용한 방식'과 'Choose 구문을 사용한 방식'으로 각각 풀어 보세요. -->
	<c:set var="jumsu" value="70"/>	
	<c:set var="grade" value=""/>	
	<c:if test="${jumsu>90}">
		<c:set var="grade" value="A"/>
	</c:if>
	<c:if test="${jumsu>80&&jumsu<=90}">
		<c:set var="grade" value="B"/>
	</c:if>	
	<c:if test="${jumsu>70&&jumsu<=80}">
		<c:set var="grade" value="C"/>
	</c:if>	
	<c:if test="${jumsu>60&&jumsu<=70}">
		 <c:set var="grade" value="D"/> 
	</c:if>	
	<c:if test="${jumsu<=60}">
		<c:set var="grade" value="F"/>
	</c:if>	
	학점 : <c:out value="${grade}"/>
	<br>	
	<c:choose>
		<c:when test="${jumsu>90}">
			<c:set var="grade" value="A"/>
		</c:when>	
		<c:when test="${jumsu>80}">
			<c:set var="grade" value="B"/>
		</c:when>	
		<c:when test="${jumsu>70}">
			<c:set var="grade" value="C"/>
		</c:when>	
		<c:when test="${jumsu>60}">
			<c:set var="grade" value="D"/>
		</c:when>	
		<c:otherwise>
			<c:set var="grade" value="F"/>
		</c:otherwise>
	</c:choose>
	학점 : <c:out value="${grade}"/>
	<br>		
</body>
</html>
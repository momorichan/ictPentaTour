<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#aminfo {
    display: inline-block;
    width: 150px;
    font-size: 17px;
    color: rgb(17, 17, 17);
    font-weight: 600;
    vertical-align: top;
    line-height: 1.4;
}
.description {
    display: inline-block;
    font-size: 15px;
    color: #333;
    background: #f5f5f5;
    padding: 4px 12px;
    border-radius: 4px;
}
</style>
</head>
<body>
<table class="table table-borderless">
<thead>
<tr>
<td>
<span id="aminfo" >객실 편의시설</span>
</td>
</tr>
</thead>
	<c:forEach items="${requestScope.lists}" var="bean">
			<tr>
			<td class="col-1">
			</td>
			<td class="col-3">
			<img alt="${bean.image}" src="${pageContext.request.contextPath}/upload/${bean.image}" style="width: 30px;">
			${bean.name}
			</td>
			<td>
			<span class="description">
			${bean.description}
			</span>
			</td>			
			</tr>
		
	</c:forEach>
</table>
</body>
</html>
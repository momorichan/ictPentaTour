<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<style type="text/css">
.form-check-label{display:inline-block; width:150px; line-height:20px; }
</style>
<script type="text/javascript">
$(document).ready(function(){ 

	/* 숙소에 있는 편의시설 정보를 JavaScript 배열로 가져옵니다. */
	var checkedAmenities = [
		<c:forEach items="${requestScope.checkedlists}" var="checkedBean" varStatus="checkedLoop">
			"${checkedBean.amid}"<c:if test="${!checkedLoop.last}">,</c:if>
		</c:forEach>
	];
	
	/* 편의시설 체크 처리 */
	<c:forEach items="${requestScope.listall}" var="bean" varStatus="loop">
    (function () { // IIFE 패턴을 사용하여 클로저 생성
      var checkbox = $('#check${loop.index}');
      var amenityValue = "${bean.amid}";

      /* 숙소에 있는 편의시설인 경우 체크 처리 */
      if (checkedAmenities.includes(amenityValue)) {
        checkbox.prop('checked', true);
      }

      checkbox.on('change', function () {
        if (this.checked) {
          /* 체크되면 checkedAmenities 배열에 추가 */
          checkedAmenities.push(amenityValue);
        } else {
          /* 체크 해제되면 checkedAmenities 배열에서 제거 */
          checkedAmenities = checkedAmenities.filter(item => item !== amenityValue);
        }
        console.log(checkedAmenities);
      });
    })(); // IIFE 호출
  </c:forEach>
	});
</script>
</head>
<body>
<div>
	<c:forEach items="${requestScope.listall}" var="bean" varStatus="loop">
		<div class="form-check form-check-inline">
			<input type="checkbox" class="form-check-input" id="check${loop.index}" name="amenities" value="${bean.amid}">
      		<label class="form-check-label" for="check${loop.index}">${bean.name}</label>
		</div>
	</c:forEach>
</div>
</body>
</html>

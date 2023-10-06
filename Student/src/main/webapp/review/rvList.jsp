<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link href="./../css/starscore.css" rel="stylesheet"/>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript">	
	</script>
<style type="text/css">

</style>
</head>
<body>
	<strong class="tit mid">숙소후기</strong><br>
	<span style="color : red"> ★</span><strong>${sessionScope.averageRating}</strong> <span>/ 5</span>
	<span>&nbsp;&nbsp;&nbsp;     ${sessionScope.commentAdd}개의 여행후기</span>
</body>
</html>
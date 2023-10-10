<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="./../common/common.jsp"%>
<%@ include file="./../common/bootstrap5.jsp"%>

<!DOCTYPE html>
<html>
<head>
<link href="./../css/starscore.css" rel="stylesheet"/>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript">	
		function deleteReview(trid) {
		    if (confirm("정말로 삭제하시겠습니까?")) {
		        $.ajax({
		            type: "get",
		            url: "<%=notWithFormTag%>rvDelete",
		            data: { trid: trid }, // 삭제할 데이터의 ID를 전송
		            success: function(result) {
		                if (result === "success") {
		                    alert("삭제되었습니다.");
		                    location.reload(); // 페이지 새로고침
		                } else {
		                    alert("삭제 실패.");
		                }
		            }
		        });
		    }
		}	
	</script>
<style type="text/css">
.point_txt2{
 	text-align: center; /* 텍스트 가운데 정렬 */
 	line-height: 3.0;
    margin: 20px 0px 25px;
    padding-bottom: 25px;
    border-bottom: 1px solid rgb(221, 221, 221);
    border-top: 1px solid rgb(221, 221, 221);
	
}
</style>
</head>
<body>
	<div class="point_txt2">
				<strong class="tit mid">숙소후기</strong><br>
					<span style="color : red"> ★</span><strong>${sessionScope.averageRating}</strong> <span>/ 5</span>
					<span>&nbsp;&nbsp;&nbsp;     ${sessionScope.commentAdd}개의 여행후기</span>
					</div>
</body>
</html>
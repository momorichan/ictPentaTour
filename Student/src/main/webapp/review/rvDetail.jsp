<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<link href="./../css/starscore.css" rel="stylesheet"/>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
			
		function writeForm(){ /* 글쓰기 */
			location.href = '<%=notWithFormTag%>rvInsert';
		}
		
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
.shape {
	height: 30px;
	background-color : #bbb;
	border-top : 1px;
}
}
</style>
</head>
<body>	
	<hr class="shape"></hr>
	<form name="myform" action="<%=withFormTag%>" method="get">
									<input type="hidden" name="command" value="rvList">
									<div class="row">
											<button type="button" class="btn btn-info form-control-lg"
												onclick="writeForm();">글 쓰기</button>
									</div>
								</form>				
	<!--  임시 창 -->
	 <div class ="review_text">
      <c:forEach var="bean" items="${requestScope.datalist}">
         <tr>
            <td>${bean.meid}님</td>
           	<td>${bean.regdate}</td><br>
            <td>
            <c:choose>
               <c:when test="${bean.rating eq 1}">
                  <c:out value="평점 : "/>
                  <span style="color: red;">★</span>
               </c:when>
               <c:when test="${bean.rating eq 2}">
                  <c:out value="평점 : "/> 
                  <span style="color: red;">★★</span>
               </c:when>
               <c:when test="${bean.rating eq 3}">
                  <c:out value="평점 : " />
                  <span style="color: red;">★★★</span> 
               </c:when>
               <c:when test="${bean.rating eq 4}">
                  <c:out value="평점 : " /> 
                  <span style="color: red;">★★★★</span>
               </c:when>
               <c:when test="${bean.rating eq 5}">
                  <c:out value="평점 : " /> 
                  <span style="color: red;">★★★★★</span>
               </c:when>
            </c:choose>            
            </td>
            <br/>
            <td>${bean.content}</td><br><br>
            <td><c:if test="${whologin==2||sessionScope.loginfo.meid==bean.meid}">
			<a id="meid" class="btn btn-info" onclick="deleteReview(${bean.trid})">삭제</a>
							</c:if>
         </tr>
      </c:forEach>
      ${requestScope.pageInfo.pagingHtml}
      </div>
</div>

</body>
</html>
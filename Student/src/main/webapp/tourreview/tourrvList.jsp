<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- <%@ include file="./../common/common.jsp"%> --%>

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
		
		function searchAll(){ /* 전체 검색 */
			location.href = '<%=notWithFormTag%>rvList';
		}
		if(${requestScope.bean.toid} != null) {
			var toid = ${requestScope.bean.toid};
		}
		function writeForm(){ /* 글쓰기 */
			if(${empty sessionScope.loginfo}) {
				alert("로그인이 필요한 서비스 입니다.");
				window.open("<%=notWithFormTag %>mePopup" , "a", "width=600, height=640, left=100, top=50");
				return false;
			} else {
				location.href = '<%=notWithFormTag%>tourrvInsert&toid=' + toid;	
			}
		}
		function deleteclick(trid) {
			if (confirm("정말 삭제하시겠습니까?") == true){    //확인
			      location.href = '<%= notWithFormTag%>tourrvDelete&trid=' + trid;
			  }else{   //취소
			      return;
			  }
			
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
 	width: 400px;height: 300px;
	line-height: 100px; /* 세로 가운데 정렬 : line-height와 height값을 동일하게 처리합니다.*/
	text-align: center; /* 텍스트 가운데 정렬 */
}
.row{
	width: 50%;
 	text-align: center;
	height : 30px;
}
.shape {
	height: 30px;
	background-color: #bbb;
	border-top: 1px;
}
.btn-info {
	color:white;
}
</style>
</head>
<body>

<div class ="container">
	
	<div class="point_txt">
				<strong class="tit mid">후기</strong><br>
					<span style="color : red"> ★</span><strong>${requestScope.averageRating}</strong> <span>/ 5</span><br>
					<span>${requestScope.commentAdd}개의 여행후기</span>
					</div>
	
	<form name="myform" action="<%=withFormTag%>" method="get">
									<input type="hidden" name="command" value="rvList">
									<div class="row">
											<button type="button" class="btn btn-info form-control-sm"
												onclick="writeForm();">글 쓰기</button>
									</div>
								</form>				
	<hr class="shape"></hr>
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
					<a id="meid"
						href="" onclick="deleteclick(${bean.trid})"
						class="btn btn-info">삭제</a>
					<br>
				</c:if>
         </tr>
         <hr>
      </c:forEach>
      ${requestScope.pageInfo.pagingHtml}
      </div>
</div>
<br>
<br>
<br>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<%@ include file="./../common/bootstrap5.jsp" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>rcList</title>
	<script type="text/javascript">
		$(function){
			var page = 1; 
			var list = 5;
			var totalPage = 1;
			var page_start = (page-1)*list; // db에서 몇번째 자료부터 보여줄지 정합니다
			
			$.fn.List = function(){
				$.ajax({
					type:"get", 
					dataType: "json",
					data: { 
						'list' : list,
						'page_start' : page_start
					},
					url: '<%=notWithFormTag%>리스트jsp' ,	
										
				}).done(function(data) { 
					page += 1; //페이지를 1 올립니다.
					page_start = (page-1)* list;

					total_page = Math.ceil(data.count/list);

					if(data.data){
						$('#empty').remove();
					}

					$('#contents').append(data.data);
				});
			
			}
			
			$(window).scroll(function() {
				if ($('body').height() <= ($(window).height() + $(window).scrollTop())) { //스크롤바가 윈도우창 아래쪽에 닿았을때
					if(page<=total_page){ //페이지가 페이지 총합보다 적으면
						$(this).List();
					}
				}
			});
			$(this).List();		
			
			
			function totalCount(
					)
			$.ajax({
				
			})
		}
		
		
	</script>
</head>
<body>

</body>
</html>
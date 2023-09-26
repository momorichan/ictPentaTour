<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%@ include file="./../common/common.jsp" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style type="text/css">
	</style>
	
	<script type="text/javascript">
	
	
	$(document).ready(function(){
	
	/* 	var optionList = $('#mode option');
		
		for(var i = 0 ; i < optionList.length ; i++){
			if(optionList[i].value == '${requestScope.pageInfo.mode}'){
				optionList[i].selected = true;
			}
		}
		 if('${requestScope.pageInfo.keyword}').val == 'all' || '${requestScope.pageInfo.keyword}').val == null)
		{
			console.log("전체페이지");
		}
		else
		{
			$('#keyword').val('${requestScope.pageInfo.keyword}');
		} 
		*/
	}); 
	
	function moveList()
	{
		location.href = '<%=notWithFormTag%>airList&mode=all&keyword=';
	}
	
	function goHome()
	{
		location.href = '<%=notWithFormTag%>airHome';
	}
	
		
	</script>

</head>
<body>
	
	
	<div class="container">
		<h2>가는날</h2>	
		<table class="table table-striped">
			<thead>
				<tr>
					<th align="center">항공편</th>
					<th align="center">항공사</th>
					<th align="center">출발지</th>
					<th align="center">도착지</th>					
					<th align="center">출발 시간</th>
					<th align="center">도착 시간</th>	
				</tr>
			</thead>
			<tbody>
				
				<tr>
					<td colspan="9" align="right">
					 <div class="row">
			           <div class="col-sm-1"></div>
			             <div class="col-sm-10">               
			                <form name="myform" action="<%=withFormTag%>" method="get">
			                  <input type="hidden" name="command" value="airList">
			                   <div class="row">
			                     <div class="col-sm-3 mode">
			                           <select class="form-control form-control-sm" id="mode" name="mode">
			                              <option value="all" selected="selected">--- 선택해 주세요 ---
			                              <option value="flid">항공편번호
			                              <option value="depart">출발지
			                              <option value="arrive">도착지
			                           </select>
			                        </div>
			                        <div class="col-sm-2 keyword">
			                      	  <input class="form-control form-control-sm" type="text" name="keyword" id="keyword"
			                           placeholder="키워드 입력">
			                        </div>
			                      
			                        <div class="col">                     
			                           <button type="submit" class="btn btn-warning form-control-sm" onclick="">검색</button>
			                        </div>
			                        <div class="col">
			                           <button type="button" class="btn btn-warning form-control-sm" onclick="moveList();">전체 검색</button>
			                        </div>
			                         <div class="col">            
		                   </div>     
		                </div>
		                
		               <c:forEach var="bean" items="${requestScope.datalist}"> 
					<tr onclick="location.href='<%=notWithFormTag%>airDetail&flid=${bean.flid}'" style="cursor: pointer;"
>
						<td align="left">${bean.flid}</td>
						<td align="left">${bean.fname}</td>
						<td align="left" class="deptime">${bean.depart}</td>
						
						<td align="left" class="arrtime">${bean.arrive}</td>
						<td align="left">${bean.detime}</td>
						<td align="left">${bean.artime}</td>			
				</tr>
				</c:forEach>
			
		                
		                
                  </form>                     
               </div>
             
					</td>
				</tr>	 
			</tbody>
		</table>
		
		
		
		<div class="container mt-2">
		
		
		<h2>오는날</h2>
		<table  class="table table-striped">
		
			<thead>
				<tr>
					<th align="center">항공편</th>
					<th align="center">항공사</th>
					<th align="center">출발지</th>
					<th align="center">도착지</th>
					<th align="center">출발 시간</th>
					<th align="center">도착 시간</th>	
				</tr>
			</thead>
			
			
			<tbody>
				<c:forEach var="lest" items="${requestScope.list}"> 
					<tr onclick="location.href='<%=notWithFormTag%>airDetail&flid=${lest.flid}'" style="cursor: pointer;">
						<td align="left">${lest.flid}</td>
						<td align="left">${lest.fname}</td>
						<td align="left" class="deptime">${lest.depart}</td>
						<td align="left" class="arrtime">${lest.arrive}</td>
						<td align="left">${lest.detime}</td>
						<td align="left">${lest.artime}</td>			
				</tr>
				</c:forEach>
			
			
			</tbody>
		</table>
		
		</div>
	<div align="center">
		<button type="button" class="btn btn-primary" onclick="goHome();">
				홈으로
			</button>
	</div>
		
		
		
		
		</div>
		
		
</body>
</html>
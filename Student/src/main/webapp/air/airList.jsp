<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%@ include file="./../common/bootstrap5.jsp" %>
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
		var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
		var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
		  return new bootstrap.Popover(popoverTriggerEl)
	});
		
	function moveList()
	{
		location.href = '<%=notWithFormTag%>airList&mode=all&keyword=';
	}
	
	
	</script>

</head>
<body>
	
	
	<div class="container">
		<h2>항공권 목록</h2>
		<p>항공권 목록을 보여주는 페이지</p>	
		<table class="table table-striped">
			<thead>
				<tr>
					<th>항공편</th>
					<th>출발지</th>
					<th>도착지</th>					
					<th>출발시간</th>
					<th>도착시간</th>		
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
		                      ${requestScope.pageInfo.pagingStatus}
		                   </div>     
		                </div>
                  </form>                     
               </div>
             
					</td>
				</tr>

				<c:forEach var="bean" items="${requestScope.datalist}"> 
					<tr>
						<td>${bean.flid}</td>
						<td>
						<a href="<%=notWithFormTag%>airDetail&flid=${bean.flid}">${bean.depart}</a>
						</td>
						
						<td>${bean.arrive}</td>
						<td>${bean.detime}</td>
						<td>${bean.artime}</td>
										
				</tr>
				</c:forEach>			 
			</tbody>
		</table>
	</div>	 
	
	
	
	
	<%-- <div class="main" align="center">
  <input type="radio" id="roundway" name="show" value="1" checked/>
  <input type="radio" id="oneway" name="show" value="2" />
  <input type="radio" id="checkinfo" name="show" value="3" />
  
  <div class="tab" align="center">
    <label for="roundway">왕복</label>
    <label for="oneway">편도</label>
    <label for="checkinfo">체크인</label>
  </div>

    <div class="tripA">
      <div class="container">
					<div>
						<form name="" action="<%=withFormTag%>" method="get">
						<input type="hidden" name="command" value="AviList">
							<div class="search justify-content-center">
								<div class="from">
								<h3>From</h3>
								<input class="city1" placeholder="출발지" type="text" id="depart" name="depart">		
								</div>
								<div class="to">
									<h3>To</h3>
									<input class="city2" placeholder="도착지" type="text" id="arrive" name="arrive">		
								</div>
								
								<div class="depart">
									<h3>가는 날</h3>
									<input class="departdate" type="date" id="departdate" name="departdate">	
								</div>
						
								<div class="arrive">
									<h3>오는 날</h3>
									<input class="arrivedate" type="date" id="arrivedate" name="arrivedate">	
								</div>
								
					<div class="people">
									<h3>성인</h3>
						<ul class="pagination">
						<li class="people-man"><a class="page-link minus" href="#">-</a></li>
						  
						 <li class="people-man">
						 	 <a class="page-link" href="#">
							  	<input type="text" name="qty" id="qty" value="0"
							  	data-bs-trigger="hover" data-bs-toggle="popover" title="인원수">
						  	</a>
						  </li>
						  
						  <li class="people-man"><a class="page-link plus" href="#">+</a></li>
						  </ul>
						  	  	
						  	<h3>아동</h3>
						<ul class="pagination">
						<li class="people-child"><a class="page-link cminus" href="#">-</a></li>
						  
						 <li class="people-child">
						 	 <a class="page-link" href="#">
							  	<input type="text" name="cqty" id="cqty" value="0"
							  	data-bs-trigger="hover" data-bs-toggle="popover" title="인원수">
						  	</a>
						  </li>
						  
						  <li class="people-child"><a class="page-link cplus" href="#">+</a></li>
						  </ul>
							</div>
							</div>
							
							
							
							
							
							
							
							
							
							<div class="find">
								<button type="submit" class="search_btn btn-primary">검색</button>
								<button type="submit" class="search_btn btn-primary">전체보기</button>
							</div>
							
							
						</form>
					</div>	
			</div>
    </div>
    
    <div class="tripB">
    	<div class="container">
    	
    		
    	
    	</div>
    
    </div>
  --%>
    
    



</body>
</html>
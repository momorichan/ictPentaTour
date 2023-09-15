<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.main-div{
		justify-content: center;
 		display: flex;
 		min-height:600px;
		
	}
	.main-image-div{
		min-width:50%;
		width: 50%;
		height: auto;
		margin:0 0;
		overflow:auto;
		display: block;
		background-color: black;
	}
	.main-info-div{
		width: 50%;
		height:auto;
		margin:0 0;
		overflow:hidden;
		position: relative;
		padding: 50px;
		justify-content: left;
		display: flex;
	}
	.bottom-info-div{
		display: flex;
		width: 1594.6px;
/* 		white-space: normal; */
/* 		overflow: hidden; */
	}
	.detail-info-div{
		width: 1227px;
		height: auto;
		margin:0 auto;
		overflow:hidden;
		display: inline;
		white-space: normal;
	}
	.side-pannel{
		width: 368px;
		height: 1226px;
		position: sticky;
		top:0px;
		background-color: aqua;
	}
	.side-pannel-inner{
		width:100%;
		height:100%;
		display:flex;
		align-content: center;
		justify-content: center;
		flex-wrap: wrap;
	}
	.main-image{
		width:100%;
		height:auto;
	}
	.main-info{
		width:100%;
		height:100%;
	}
	.detail-info{
		width:1226.7px;
		height:auto;
		font-size: 18px;
		margin-bottom:5px;
	}
	.detail-info-big{
		width:1226.7px;
		height:auto;
	}
	.floating{
		position:fixed;
		z-index: 1;
		margin-left:90%;
	}
	.container{
		max-width:1226.7px;
		display: block;
		justify-content: center;
		margin-left:auto;
		margin-right:auto;
	}
	.title{
		margin: 10px auto;
	}
	.info-div{
		width:570px;
		display: flex;
   	 	flex-direction: column;
    	margin-left: 25px;
    	justify-content: flex-start;
    	align-items: center;
	}
	.title-box{
	margin-bottom: 0;
	}
	.purchasebtn{
		margin-top:20px;
	}
	.borderdiv{
		display: flex;
		justify-content: center
	}
	body{
		width:100%;
		min-width:100%;
		margin: 0px;
	}
	h4{
		font-size: 24px;
	}
	h3{
		font-size: 28px;
	}
	h2{
		font-size: 32px;
	}
</style>
</head>
<body>
	<div class="floating">
		<button class="btn btn-primary" type="button" onclick="history.back()">back</button>
	</div>
	<div class="container">
		<div class="main-div">
			<div class="main-image-div">
				<div id="demo" class="carousel slide" data-bs-interval="false">

					<!-- Indicators/dots -->
					<div class="carousel-indicators">
						<button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
						<button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
						<button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
					</div>

					<!-- The slideshow/carousel -->
					<div class="carousel-inner">
						<div class="carousel-item active">
							<c:if test="${bean.timage01 == null }">
								<img src="/Student/upload/empty.jpg" alt="timage01" class="d-block" style="width: 100%">
							</c:if>
							<c:if test="${bean.timage01 != null }">
								<img src="/Student/upload/${bean.timage01 }" alt="timage01" class="d-block" style="width: 100%">
							</c:if>
						</div>
						<div class="carousel-item">
							<c:if test="${bean.timage02 == null }">
								<img src="/Student/upload/empty.jpg" alt="timage02" class="d-block" style="width: 100%">
							</c:if>
							<c:if test="${bean.timage02 != null }">
								<img src="/Student/upload/${bean.timage02 }" alt="timage02" class="d-block" style="width: 100%">
							</c:if>
						</div>
						<div class="carousel-item">
							<c:if test="${bean.timage03 == null }">
								<img src="/Student/upload/empty.jpg" alt="timage03" class="d-block" style="width: 100%">
							</c:if>
							<c:if test="${bean.timage03 != null }">
								<img src="/Student/upload/${bean.timage03 }" alt="timage03" class="d-block" style="width: 100%">
							</c:if>
						</div>
					</div>

					<!-- Left and right controls/icons -->
					<button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
						<span class="carousel-control-prev-icon"></span>
					</button>
					<button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
						<span class="carousel-control-next-icon"></span>
					</button>
				</div>
			</div>
			<div class="main-info-div">
				<div class="info-div">
					<p id="trlocation" style="width:530px; height:10px; margin-bottom: 0; margin-top: 50px;">${bean.location }
					<div class="title" style="width:530px; height:auto; margin-bottom: 0;">
						<h2 align="left" style="width:530px; margin-bottom: 50px;"id="title">${bean.tname }</h2>
					</div>
					<div>
						<h3>가격 : ${bean.tprice}원</h3>
					</div>
					<button type="button" class="btn btn-lg btn-danger purchasebtn">구매</button>
				</div>
			</div>
		</div>
		<div class="bottom-info-div">
			<div class="detail-info-div">
				<h4 class="detail-info">사용 가능 일자 : ${bean.tusedate }</h4>
				<h4 class="detail-info">제한 연령 : ${bean.tage }</h4>
				<p class="detail-info">${bean.tcontent }</p>
				<img class="detail-info-big" alt="jsp" src="/Student/image/la.jpg">
				9월 14, 2023 2:29:54 오후 org.apache.catalina.core.StandardContext reload
정보: 이름이 [/Student]인 컨텍스트를 다시 로드하는 작업이 시작되었습니다.
9월 14, 2023 2:29:54 오후 org.apache.catalina.loader.WebappClassLoaderBase clearReferencesJdbc
경고: 웹 애플리케이션 [Student]이(가) JDBC 드라이버 [oracle.jdbc.OracleDriver]을(를) 등록했지만, 웹 애플리케이션이 중지될 때, 해당 JDBC 드라이버의 등록을 제거하지 못했습니다. 메모리 누수를 방지하기 위하여, 등록을 강제로 제거했습니다.
9월 14, 2023 2:29:55 오후 org.apache.jasper.servlet.TldScanner scanJars
정보: 적어도 하나의 JAR가 TLD들을 찾기 위해 스캔되었으나 아무 것도 찾지 못했습니다. 스캔했으나 TLD가 없는 JAR들의 전체 목록을 보시려면, 로그 레벨을 디버그 레벨로 설정하십시오. 스캔 과정에서 불필요한 JAR들을 건너뛰면, 시스템 시작 시간과 JSP 컴파일 시간을 단축시킬 수 있습니다.
9월 14, 2023 2:29:55 오후 org.apache.catalina.core.StandardContext reload
정보: 이름이 [/Student]인 컨텍스트를 다시 로드하는 것을 완료했습니다.
txtSetting is /WEB-INF/setting.txt
todoList is /WEB-INF/tourcommand.txt
txtSettingFile is C:\Users\user\Desktop\qwer\jsp\eclipse workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Student\WEB-INF\setting.txt
todoListFile is C:\Users\user\Desktop\qwer\jsp\eclipse workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Student\WEB-INF\tourcommand.txt
prop
{phone=0212349876, uploadPath=upload, company=IT êµì¡ ì¼í°, product_list_column_size=3, ceo=ê¹ëí, email=itcompany@naver.com}
setting file element size = 6
imageUploadWebPath is C:\Users\user\Desktop\qwer\jsp\eclipse workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Student\upload
prop
{tourInsert=tour.TourInsertController, tourList=tour.TourListController, tourDetail=tour.TourDetailController}
tourInsert/tour.TourInsertController
tourList/tour.TourListController
tourDetail/tour.TourDetailController
todolist file element size = 3
file upload event invoked
command is tourInsert
class tourServlet.TourFrontController post method called
gotoPage : tour/tourList.jsp
file upload event invoked
command is tourInsert
class tourServlet.TourFrontController post method called
gotoPage : tour/tourList.jsp
command is tourList
class tourServlet.TourFrontController get method called
gotoPage : tour/tourList.jsp
command is tourList
class tourServlet.TourFrontController get method called
gotoPage : tour/tourList.jsp
command is tourList
class tourServlet.TourFrontController get method called
gotoPage : tour/tourList.jsp
command is tourList
class tourServlet.TourFrontController get method called
gotoPage : tour/tourList.jsp
command is tourList
class tourServlet.TourFrontController get method called
gotoPage : tour/tourList.jsp
command is tourList
class tourServlet.TourFrontController get method called
gotoPage : tour/tourList.jsp
command is tourDetail
class tourServlet.TourFrontController get method called
gotoPage : tour/tourDetail.jsp
command is tourDetail
class tourServlet.TourFrontController get method called
gotoPage : tour/tourDetail.jsp
command is tourDetail
class tourServlet.TourFrontController get method called
gotoPage : tour/tourDetail.jsp
txtSetting is /WEB-INF/setting.txt
todoList is /WEB-INF/todolist.txt
txtSettingFile is C:\Users\user\Desktop\qwer\jsp\eclipse workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Student\WEB-INF\setting.txt
todoListFile is C:\Users\user\Desktop\qwer\jsp\eclipse workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Student\WEB-INF\todolist.txt
prop
{phone=0212349876, uploadPath=upload, company=IT êµì¡ ì¼í°, product_list_column_size=3, ceo=ê¹ëí, email=itcompany@naver.com}
setting file element size = 6
imageUploadWebPath is C:\Users\user\Desktop\qwer\jsp\eclipse workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Student\upload
prop
{prInsert=com.shopping.controller.product.ProductInsertController, prUpdate=com.shopping.controller.product.ProductUpdateController, prList=com.shopping.controller.product.ProductListController, boEmoticon=com.shopping.controller.board.BoardEmoticonController, meDetail=com.shopping.controller.member.MemberDetailController, cmDelete=com.shopping.controller.comment.CommentDeleteController, vwExam05=com.shopping.controller.view.ViewExam05Controller, vwExam04=com.shopping.controller.view.ViewExam04Controller, vwExam03=com.shopping.controller.view.ViewExam03Controller, vwExam02=com.shopping.controller.view.ViewExam02Controller, vwExam01=com.shopping.controller.view.ViewExam01Controller, prDelete=com.shopping.controller.product.ProductDeleteController, boUpdate=com.shopping.controller.board.BoardUpdateController, maInsert=com.shopping.controller.mall.MallInsertController, boReply=com.shopping.controller.board.BoardReplyController, meList=com.shopping.controller.member.MemberListController, maList=com.shopping.controller.mall.MallListController, prDetail=com.shopping.controller.product.ProductDetailController, boDetail=com.shopping.controller.board.BoardDetailController, home=com.shopping.controller.HomeController, meLogout=com.shopping.controller.member.MemberLogoutController, boList=com.shopping.controller.board.BoardListController, cmInsert=com.shopping.controller.comment.CommentInsertController, meLogin=com.shopping.controller.member.MemberLoginController, vwList=com.shopping.controller.view.ViewListController, boInsert=com.shopping.controller.board.BoardInsertController, meInsert=com.shopping.controller.member.MemberInsertController, cmList=com.shopping.controller.comment.CommentListController}
prInsert/com.shopping.controller.product.ProductInsertController
prUpdate/com.shopping.controller.product.ProductUpdateController
prList/com.shopping.controller.product.ProductListController
boEmoticon/com.shopping.controller.board.BoardEmoticonController
meDetail/com.shopping.controller.member.MemberDetailController
cmDelete/com.shopping.controller.comment.CommentDeleteController
vwExam05/com.shopping.controller.view.ViewExam05Controller
vwExam04/com.shopping.controller.view.ViewExam04Controller
vwExam03/com.shopping.controller.view.ViewExam03Controller
vwExam02/com.shopping.controller.view.ViewExam02Controller
vwExam01/com.shopping.controller.view.ViewExam01Controller
prDelete/com.shopping.controller.product.ProductDeleteController
boUpdate/com.shopping.controller.board.BoardUpdateController
maInsert/com.shopping.controller.mall.MallInsertController
boReply/com.shopping.controller.board.BoardReplyController
meList/com.shopping.controller.member.MemberListController
maList/com.shopping.controller.mall.MallListController
prDetail/com.shopping.controller.product.ProductDetailController
boDetail/com.shopping.controller.board.BoardDetailController
home/com.shopping.controller.HomeController
meLogout/com.shopping.controller.member.MemberLogoutController
boList/com.shopping.controller.board.BoardListController
cmInsert/com.shopping.controller.comment.CommentInsertController
meLogin/com.shopping.controller.member.MemberLoginController
vwList/com.shopping.controller.view.ViewListController
boInsert/com.shopping.controller.board.BoardInsertController
meInsert/com.shopping.controller.member.MemberInsertController
cmList/com.shopping.controller.comment.CommentListController
todolist file element size = 28
command is prList
class com.shopping.myservlet.FrontController get method called
gotoPage : product/prList.jsp
command is tourList
class tourServlet.TourFrontController get method called
gotoPage : tour/tourList.jsp
command is tourDetail
class tourServlet.TourFrontController get method called
gotoPage : tour/tourDetail.jsp
command is tourDetail
class tourServlet.TourFrontController get method called
gotoPage : tour/tourDetail.jsp
command is tourDetail
class tourServlet.TourFrontController get method called
gotoPage : tour/tourDetail.jsp
command is tourDetail
class tourServlet.TourFrontController get method called
gotoPage : tour/tourDetail.jsp
command is tourDetail
class tourServlet.TourFrontController get method called
gotoPage : tour/tourDetail.jsp
				
				
			</div>
			<div class="side-pannel">
				<div class="side-pannel-inner">
					<h1>test</h1>
				</div>
			</div>
		</div>
		<div>
			
		</div>
	</div>
</body>
</html>
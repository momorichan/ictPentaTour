<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>


<%@ include file="./../common/bootstrap5.jsp"%>
<%@ include file="./../common/common.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.search {
	display: flex;
	padding: 80px;
}

/* .from, .to, .depart, .arrive, .btn, .people {
	margin: auto;
}

.froms, .tos, .departs, .arrives, .btn2, .peoples {
	margin: auto;
}
 */
#qty {
	margin: -10px;
	border: 0px;
	font-size: 1rem;
}

.plus, .minus {
	font-size: 1rem;
}

#cqty {
	margin: -10px;
	border: 0px;
	font-size: 1rem;
}

.cplus, .cminus {
	font-size: 1rem;
}

img {
	height: 150px;
	width: 100%;
}

div [class^="col-"] {
	padding-left: 5px;
	padding-right: 5px;
}

.card {
	transition: 0.5s;
	cursor: pointer;
}

.card-title {
	font-size: 15px;
	transition: 1s;
	cursor: pointer;
}

.card-title i {
	font-size: 15px;
	transition: 1s;
	cursor: pointer;
	color: #ffa710
}

.card-title i:hover {
	transform: scale(1.25) rotate(100deg);
	color: #18d4ca;
}

.card:hover {
	transform: scale(1.05);
	box-shadow: 10px 10px 15px rgba(0, 0, 0, 0.3);
}

.card-text {
	height: 80px;
}

.card::before, .card::after {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	transform: scale3d(0, 0, 1);
	transition: transform .3s ease-out 0s;
	background: rgba(255, 255, 255, 0.1);
	content: '';
	pointer-events: none;
}

.card::before {
	transform-origin: left top;
}

.card::after {
	transform-origin: right bottom;
}

.card:hover::before, .card:hover::after, .card:focus::before, .card:focus::after
	{
	transform: scale3d(1, 1, 1);
}
</style>

<script type="text/javascript">
	$(document).ready(function() {
		
			$('.tripB').hide();
		
		
			$('#keyword').val('${requestScope.pageInfo.keyword}');

						var myOptionList = $('#mode option');
						for (var i = 0; i < myOptionList.length; i++) {
							if (myOptionList[i].value == '${requestScope.pageInfo.mode}')
								myOptionList[i].selected = true;
						}

						var maxPurchaseSize = 10;

						// ��ư Ŭ�� ��
						$('.plus').click(function() {
							var qty = $('#qty').val();
							if (qty == maxPurchaseSize) {
								alert('�ִ�10��');
								return;
							}
							// Number ��ü�� Integer.parseInt() �� ������ ȿ�� 
							var newQty = Number(qty) + 1;
							if (qty == '') {
								$('#qty').val('1');
							} else {
								$('#qty').val(newQty);
							}
						});

						$('.minus').click(function() {
							var qty = $('#qty').val();
							if (qty == '0') {
								alert('�ּ��ο�0��');
								return;
							}
							// Number ��ü�� Integer.parseInt() �� ������ ȿ�� 
							var newQty = Number(qty) - 1;
							if (qty == '') {
								$('#qty').val('');
								$('#qty').val('0');
							} else {
								$('#qty').val(newQty);
							}
						});

						//------------------------------------------------------------

						// ��ư Ŭ�� ��
						$('.cplus').click(function() {
							var qty = $('#cqty').val();
							if (qty == maxPurchaseSize) {
								alert('�ִ�10��');
								return;
							}
							// Number ��ü�� Integer.parseInt() �� ������ ȿ�� 
							var newQty = Number(qty) + 1;
							if (qty == '') {
								$('#cqty').val('1');
							} else {
								$('#cqty').val(newQty);
							}
						});

						$('.cminus').click(function() {
							var qty = $('#cqty').val();
							if (qty == '0') {
								alert('�ּ��ο�0��');
								return;
							}
							// Number ��ü�� Integer.parseInt() �� ������ ȿ�� 
							var newQty = Number(qty) - 1;
							if (qty == '') {
								$('#cqty').val('');
								$('#cqty').val('0');
							} else {
								$('#cqty').val(newQty);
							}
						});
		
					});
	
	
	
	
	function setDisplay(){
	    if($('input:radio[id=oneway]').is(':checked')){
	        $('.arriveday').hide();
	    }else{
	        $('.arriveday').show();
	    }
	    
	    
	    if($('input:radio[id=checkinfo]').is(':checked'))
	    {
	    	$('.tripA').hide();	
	    	$('.tripB').show();	
	    }
	    else
	    {
	    	$('.tripA').show();	
	    	$('.tripB').hide();	
	    }
	}
		
	
	
</script>

</head>
<body>


	<div class="main" align="center">
		<input type="radio" id="roundway" name="show" value="1" checked="checked" onchange="setDisplay()"/> 
		<input type="radio" id="oneway" name="show" value="2" onchange="setDisplay()" /> 
		<input type="radio" id="checkinfo" name="show" value="3" onchange="setDisplay()"/>

		<div class="tab" align="center">
			<label for="roundway">�պ�</label> <label for="oneway">��</label> <label
				for="checkinfo">üũ��</label>
		</div>

		<div class="tripA">
			<div class="container">
				<div>
					<form name="" action="<%=withFormTag%>" method="get">
						<input type="hidden" name="command" value="airList">
						<div class="search justify-content-center">
							<div class="from">
								<h3>From</h3>
								<input class="form-control" type="hidden" id="mode" name="mode" value="depart"> 
									<select class="city1" id="keyword" name="keyword">
									<option value="all" selected="selected">�����
									<option value="����">����
									<option value="�Ϻ�">�Ϻ�
									<option value="�߱�">�߱�
									<option value="�븸">�븸
								</select>
							</div>

							<div class="to">
								<h3>To</h3>
								<input class="form-control" type="hidden" id="mode2" name="mode2"value="arrive"> 
								<select class="city2" id="keyword2" name="keyword2">
									<option value="all" selected="selected">������
									<option value="�Ϻ�">�Ϻ�
									<option value="�븸">�븸
									<option value="�߱�">�߱�
									<option value="��">��
									</option>
								</select>
							</div>

							<div class="departday">
								<h3>���� ��</h3>
								<input class="departdate" type="date" id="departuretime"
									name="departuretime">
							</div>

							<div class="arriveday">
								<h3>���� ��</h3>
								<input class="arrivedate" type="date" id="arrivaltime"
									name="arrivaltime">
							</div>

							<div class="people">
								<h3>����</h3>
								<ul class="pagination">
									<li class="people-man"><a class="page-link minus" href="#">-</a></li>

									<li class="people-man"><a class="page-link" href="#">
											<input type="text" name="qty" id="qty" value="0"
											data-bs-trigger="hover" data-bs-toggle="popover" title="�ο���">
									</a></li>

									<li class="people-man"><a class="page-link plus" href="#">+</a></li>
								</ul>

								<h3>�Ƶ�</h3>
								<ul class="pagination">
									<li class="people-child"><a class="page-link cminus"
										href="#">-</a></li>

									<li class="people-child"><a class="page-link" href="#">
											<input type="text" name="cqty" id="cqty" value="0"
											data-bs-trigger="hover" data-bs-toggle="popover" title="�ο���">
									</a></li>

									<li class="people-child"><a class="page-link cplus"
										href="#">+</a></li>
								</ul>


							</div>

						</div>
						<div class="find">
							<button type="submit" class="search_btn btn-primary">�˻�</button>
						</div>
					</form>
				</div>
			</div>
		</div>

		<div class="tripB">
				<div class="container">
				<div>
					<form name="" action="<%=withFormTag%>" method="get">
						<input type="hidden" name="command" value="airCheck">
						<div class="search justify-content-center">
							<div class="from">
								<h3>�����ȣ</h3>
								<input class="form-control" type="text" id="regid" name="regid" placeholder="�����ȣ"> 
							</div>
						<div class="find_checkin">
							<button type="submit" class="search_btn btn-primary">��ȸ</button>
						</div>
							
						</div>
						
					</form>
				</div>
			</div>
				
		
		</div>


		<div class="container mt-2">
			<div class="row">
				<div class="col-md-3 col-sm-6">
					<div class="card card-block">
						<h4 class="card-title text-right">
							<i class="material-icons"></i>
						</h4>
						<a href="<%=notWithFormTag%>airList&mode=depart&keyword=all&mode2=arrive&keyword2=�Ϻ�"> <img
							src="https://image.hanatour.com/usr/cms/resize/400_0/2022/09/05/10000/4d34420c-7d47-4835-becf-f04454a99d20.jpeg"
							alt="Photo of sunset">
						</a>
						<h5 class="card-title mt-3 mb-3">�Ϻ�</h5>
						<p class="card-text">����ī</p>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="card card-block">
						<h4 class="card-title text-right">
							<i class="material-icons"></i>
						</h4>
						<a href="<%=notWithFormTag%>airList&mode=depart&keyword=all&mode2=arrive&keyword2=�߱�"> <img
							src="https://image.hanatour.com/usr/cms/resize/400_0/2023/04/06/10000/49738def-cc04-494b-a597-d86128ef9a38.jpg"
							alt="Photo of sunset">
						</a>
						<h5 class="card-title  mt-3 mb-3">�߱�</h5>
						<p class="card-text">This is a company that builds websites,
							web .</p>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="card card-block">
						<h4 class="card-title text-right">
							<i class="material-icons"></i>
						</h4>
						<a href="<%=notWithFormTag%>airList&mode=depart&keyword=all&mode2=arrive&keyword2=�븸"> <img
							src="https://image.hanatour.com/usr/cms/resize/400_0/2019/07/04/10000/a895c128-729e-448b-a9f2-ba66e6ce3503.jpg"
							alt="Photo of sunset">
						</a>
						<h5 class="card-title  mt-3 mb-3">�븸</h5>
						<p class="card-text">This is a company that builds websites,
							web apps and e-commerce solutions.</p>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="card card-block">
						<h4 class="card-title text-right">
							<i class="material-icons"></i>
						</h4>
						<a href="<%=notWithFormTag%>airList&mode=depart&keyword=all&mode2=arrive&keyword2=��"> <img
							src="https://image.hanatour.com/usr/cms/resize/400_0/2022/10/12/10000/2a3c5702-2f0e-4438-934e-0ce5e696deb7.jpg"
							alt="Photo of sunset">
						</a>
						<h5 class="card-title  mt-3 mb-3">��</h5>
						<p class="card-text">This is a company that builds websites,
							web apps and e-commerce solutions.</p>
					</div>
				</div>
			</div>

		</div>
</body>
</html>
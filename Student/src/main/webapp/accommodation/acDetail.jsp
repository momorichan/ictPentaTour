<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="./../common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.rounded-pill {
	opacity: 0.9;
}

.mode, .keyword, .col {
	margin: auto;
}

/* 좌측 div 설정 */
.left-div {
	float: left; /* 왼쪽으로 부유(floating) */
	width: 58.4%; /* 가로 공간의 58.4% 차지 */
	padding: 0px;
	justify-content: center;
}

/* 우측 div 설정 */
.right-div {
	float: left; /* 왼쪽으로 부유(floating) */
	width: 41.6%; /* 가로 공간의 41.6% 차지 */
	padding: 0px;
}

.p1 {
	float: left;
	width: 48%;
	height: 225px;
	display: block;
	margin-bottom: 3px;
	margin-left: 1px;
	margin-right: 3px;
}

.p2 {
	float: left;
	width: 32%;
	height: 174px;
	margin-left: 1px;
	margin-right: 1px;
}

img {
	width: 100%;
	height: 100%;
}

.price {
	font-size: 32px;
}
.popup-layer {
    display: none;
    position: absolute; /* absolute로 변경 */
    width: 80%; /* 팝업의 너비 */
    z-index: 9999;
    background-color: white;  /* 하얀색 배경 추가 */
    border: 1px solid black; /* 검은색 테두리 추가 */
}

.popup-content {
    padding: 20px;
    max-height: 300px;
    overflow-y: auto; /* 내용이 많으면 스크롤 */
}

#select_room_guest {
    max-width: 300px;
    /* 필요한 나머지 스타일 코드... */
}
.btn_purple_hover {
    background-color: #9370DB; /* 보라색 배경 */
    color: #FFFFFF; /* 텍스트는 흰색으로 */
    border: none; /* 테두리 제거 */
    padding: 10px 20px; /* 버튼 내부 패딩 */
    border-radius: 5px; /* 둥근 모서리 효과 */
    font-size: 16px; /* 글자 크기 */
    cursor: pointer; /* 마우스를 올렸을 때 손가락 모양으로 바뀌게 */
}

.btn_purple_hover:hover {
    background-color: #7B68EE; /* 마우스를 올렸을 때 조금 더 진한 보라색 */
    color: #FFFFFF; /* 텍스트는 흰색으로 */
}

/* +와 - 버튼의 공통 스타일 */
.plus, .minus {
    width: 30px;  /* 버튼의 너비 */
    height: 30px;  /* 버튼의 높이 */
    line-height: 30px;  /* 버튼 내부의 텍스트 위치를 중앙으로 설정 */
    border-radius: 50%;  /* 동그라미 모양으로 만들기 위해 */
    background-color: #f2f6f9;  /* 연한 회색 배경 */
    color: #696969;  /* 진한 회색 글자 */
    font-size: 20px;  /* 글자 크기 */
    border: none;  /* 기본 테두리 제거 */
    text-align: center;  /* 텍스트 중앙 정렬 */
    vertical-align: middle;  /* 세로 중앙 정렬 추가 */
}

/* +와 - 버튼에 마우스를 올렸을 때의 스타일 (옵션) */
.plus:hover, .minus:hover {
    background-color: #f2f6f9;  /* 연한 회색 배경 */
    color: #696969;  /* 진한 회색 글자 */
}

.btn_gray_hover {
    display: inline-block;
    padding: 10px 20px;
    border: 1px solid #e0e0e0; /* 미세한 회색 테두리 */ 
    border-radius: 5px;
    background-color: #3498db; /* 연한 파란색 배경 */
    color: #ffffff; /* 흰색 글자 */
    text-decoration: none; /* 밑줄 제거 */
    font-weight: bold; /* 굵은 글자 */
    box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.2); /* 그림자 효과 */
    transition: background-color 0.3s, transform 0.3s; /* 부드러운 색상 및 크기 변화 효과 */
    cursor: pointer; /* 마우스를 올렸을 때 손가락 모양으로 바뀌게 */
}

.btn_gray_hover span {
    margin-right: 5px; /* span 태그 사이에 간격 추가 */
}

.btn_gray_hover:hover {
    background-color: #3498db; 
    transform: scale(1.05); /* 버튼을 약간 확대 */
    backface-visibility: hidden; /* 흐림 현상 방지 */
}

.btn_gray_hover::-webkit-input-placeholder {
    color: #ffffff;
}

</style>
<script type="text/javascript">

$(function() {

	$('#datepicker').daterangepicker({
		autoUpdateInput : false,
		locale : {
			cancelLabel : 'Clear'
		}
	});

	$('#datepicker').on(
			'apply.daterangepicker',
			function(ev, picker) {
				$(this).val(
						picker.startDate.format('YYYY/MM/DD') + ' - '
								+ picker.endDate.format('YYYY/MM/DD'));
			});

	$('#datepicker').on('cancel.daterangepicker',
			function(ev, picker) {
				$(this).val('');
			});
});

function getRoomDetail(roid){
	$('#roomDetail').empty();
	//$.ajax() 함수를 이용하여 데이터 보여주기 
	$.ajax({
		url:'<%=notWithFormTag%>roDetail',
			data : 'roid=' + roid,
			type : 'get',
			//dataType:'json', 
			dataType : 'html',
			success : function(result) {
				$('#roomDetail').html(result);
			}
		});
	}
	
function getAmenities(){
	$('#amList').empty();
	//$.ajax() 함수를 이용하여 데이터 보여주기 
	$.ajax({
		url:'<%=notWithFormTag%>amList',
			data : 'acid=' + '${requestScope.acbean.acid}',
			type : 'get',
			//dataType:'json', 
			dataType : 'html',
			success : function(result) {
				$('#amList').html(result);
			}
		});
	}

	$(document).ready(function() {

		getAmenities();
		$('td[data-bs-toggle="modal"]').on('click', function() {
			var roid = $(this).data('roid'); // 클릭된 td의 data-roid 속성 가져오기
			getRoomDetail(roid); // 가져온 roid 값을 사용하여 함수 호출
		});

		
		$('.reserve-button').click(function(e) {
			
			
			
	        e.preventDefault(); // 기본 동작 방지

	        var datepickerId = $(this).data('datepicker'); // datepicker 필드의 ID 가져오기
	        var dateRange = $(datepickerId).val(); // 선택한 날짜 범위 가져오기
	        var roid = $(this).data('roid'); // 선택한 방의 roid 가져오기
	        var acid = ${requestScope.acbean.acid};

	        // 날짜 범위를 시작 날짜와 끝 날짜로 분리
	        var dateParts = dateRange.split(' - ');
	        var startDate = dateParts[0].trim(); // 시작 날짜
	        var endDate = dateParts[1].trim();   // 끝 날짜

	        const exampleData = { room: 1, guests: 4 };
	        const result = `room${exampleData.room}=${exampleData.guests}`;
	        console.log(result);

	        
	     	// 객실 및 인원 정보 가져오기
	        const guestData = collectRoomGuestData();
    		const guestParams = guestDataToURLParams(guestData);
    		
	        // 예약 페이지 URL 생성 및 이동
	        var reservationUrl = '<%=notWithFormTag%>roReservation';
    					reservationUrl += '&startDate=' + startDate;
    					reservationUrl += '&endDate=' + endDate;
    					reservationUrl += '&acid=' + acid;
    					reservationUrl += '&roid=' + roid;
    					reservationUrl += '&' + guestParams; // 추가된 부분

						// 생성된 URL로 페이지 이동
						window.location.href = reservationUrl;
					});
		
		function collectRoomGuestData() {
		    const guestData = [];

		    const rooms = document.querySelectorAll('#roomList .guest-configuration'); // '.guest-configuration' 클래스를 포함한 li만 선택합니다.

		    rooms.forEach((room, index) => {
		        
		        const guestQtyElem = room.querySelector(`span[name^="guest"][name$="Qty"]`); // Starts with 'guest' and ends with 'Qty'
		        if (guestQtyElem) {
		            guestData.push({
		                room: index + 1,
		                guests: parseInt(guestQtyElem.textContent, 10)
		            });
		        } else {
		        }
		    });
		    return guestData;
		}


		function guestDataToURLParams(data) {
		    console.log("Input Data for URL Params:", data);
		    
		    const urlParamArray = data.map(entry => {
		    	const roomKey = "room" + entry.room;
		    	const roomValue = entry.guests;
		    	return roomKey + "=" + roomValue;
		    });
		    
		    console.log("Generated URL Param Array:", urlParamArray);

		    const urlParams = urlParamArray.join('&');
		    console.log("Joined URL Params:", urlParams);
		    return urlParams;
		}


});
</script>
<script>
//페이지의 모든 내용이 로드된 후 실행합니다.
document.addEventListener("DOMContentLoaded", function () {
    
    // 객실과 인원 수 관련 정보를 저장하고 표시하는 요소를 선택합니다.
    const roomList = document.getElementById("roomList");
    const roomTotal = document.getElementById("roomTotal");
    const guestTotal = document.getElementById("guestTotal");
    
    // 초기 객실 수를 설정합니다.
    let roomCounter = 2;

    // 전체 인원 수를 업데이트하는 함수
    function updateGuestTotal() {
        let totalGuests = 0; // 총 인원 수를 저장하기 위한 변수를 초기화합니다.
        
        // 속성이 "guest"로 시작하는 모든 요소를 선택합니다.
        const guestElems = document.querySelectorAll('[name^="guest"][name$="Qty"]'); 
        // 각 요소의 텍스트를 파싱하여 총 인원 수에 더합니다.
        guestElems.forEach(elem => {
        	totalGuests += parseInt(elem.textContent);
        });
        
        // 총 인원 수 요소를 업데이트합니다.
        guestTotal.textContent = totalGuests;
    }

    // 페이지 내 모든 클릭 이벤트에 대해 리스너를 추가합니다.
    document.addEventListener("click", function (event) {
        
        // 객실 추가 버튼이 클릭되었을 때와 객실 수가 8 미만일 때 실행
        if (event.target.classList.contains("add-room") && roomCounter <= 8) {
            // 새로운 객실 항목을 생성합니다.
            const roomItem = document.createElement("li");
            roomItem.classList.add('guest-configuration'); // 클래스 추가
            roomItem.innerHTML = '<div class=""><strong class="">객실 선택</strong></div><div class=""><p class="">'
                + '<span class=""></span> 객실 ' + roomCounter + '</p></div><div class="">'
                + '<span class="">인원</span>'
                + '<button class="minus" data-type="guest' + roomCounter + '">-</button>'
                + '&nbsp;<span name="guest' + roomCounter + 'Qty" class="guest' + roomCounter + 'Qty" >2</span>'
                + '&nbsp;<button class="plus" data-type="guest' + roomCounter + '">+</button>'
                + '</div>';
            roomList.appendChild(roomItem);  // 새 객실을 리스트에 추가합니다.

            roomCounter++;  // 객실 수를 증가시킵니다.
            roomTotal.textContent = roomCounter - 1; // 실제 표시되는 객실 수를 업데이트합니다.
            updateGuestTotal();  // 인원 수를 업데이트합니다.
        }

        // 객실 제거 버튼이 클릭되었을 때와 객실 수가 1보다 클 때 실행
        if (event.target.classList.contains("subtract-room") && roomCounter > 1) {
            const lastRoomItem = roomList.lastChild;  // 마지막 객실 항목을 선택합니다.
            if (lastRoomItem) {
                roomList.removeChild(lastRoomItem);  // 마지막 항목을 삭제합니다.

                roomCounter--;  // 객실 수를 감소시킵니다.
                roomTotal.textContent = roomCounter - 1;  // 객실 수를 업데이트합니다.
            }
            updateGuestTotal();  // 인원 수를 업데이트합니다.
        }

        // '-' 버튼이 클릭되었을 때의 동작을 정의합니다.
        if (event.target.classList.contains("minus")) {
            const type = event.target.getAttribute("data-type");  // data-type 속성 값을 가져옵니다.
            const baseType = type.replace(/\d+$/, '');  // type에서 숫자를 제거합니다.
            
            // 해당 type에 맞는 요소를 선택합니다.
            const qtyElement = document.querySelector('[name=' + type + 'Qty]');
            
            // 선택된 요소의 값을 파싱하고, 감소시킨 후 업데이트합니다.
            if (qtyElement) {
                let qty = parseInt(qtyElement.textContent);
                qty = Math.max(1, qty - 1);
                qtyElement.textContent = qty;
            } else {
                console.log('Element with name=' + type + 'Qty not found');
            }
            updateGuestTotal();  // 인원 수를 업데이트합니다.
        }

        // '+' 버튼이 클릭되었을 때의 동작을 정의합니다.
        if (event.target.classList.contains("plus")) {
            const type = event.target.getAttribute("data-type");  // data-type 속성 값을 가져옵니다.
            const baseType = type.replace(/\d+$/, '');  // type에서 숫자를 제거합니다.
            
            // 해당 type에 맞는 요소를 선택합니다.
            const qtyElement = document.querySelector('[name=' + type + 'Qty]');
            
            // 선택된 요소의 값을 파싱하고, 증가시킨 후 업데이트합니다.
            if (qtyElement) {
                let qty = parseInt(qtyElement.textContent);
                if(qty < 8 ) {
                    qty += 1;
                    qtyElement.textContent = qty;
                }
            } else {
                console.log('Element with name=' + type + 'Qty not found');
            }
            updateGuestTotal();  // 인원 수를 업데이트합니다.
        }
    });
    
    
    
    const popup = document.getElementById("select_room_guest");
    const openBtn = document.querySelector(".open-popup");
    const closeBtn = document.querySelector(".close-popup");

    function updatePopupPosition() {
        const rect = openBtn.getBoundingClientRect();
        popup.style.top = rect.bottom + "px";
        popup.style.left = (rect.right - popup.offsetWidth) + "px";
    }
    
    openBtn.addEventListener("click", function (e) {
        e.preventDefault(); // 기본 이벤트(이 경우, 앵커 태그의 이동)를 막습니다.
        e.stopPropagation(); // 이벤트 전파 막기
        popup.style.display = "block"; // 팝업 표시
        
        updatePopupPosition();

        
    });

    window.addEventListener("resize", function() {
        // 팝업이 표시 중일 때만 위치 업데이트
        if (popup.style.display === "block") {
            updatePopupPosition();
        }
    });
    
    document.addEventListener("click", function(e) {
        console.log("Document clicked"); // 이 부분이 출력되는지 확인

        if (e.target === popup || e.target === closeBtn || !popup.contains(e.target)) {
            console.log("Closing popup"); // 이 부분이 출력되는지 확인
            popup.style.display = "none";
        }
    });

    // "선택완료" 버튼 클릭 이벤트
    $(".complete-selection").click(function(){
        // 객실과 인원 정보 가져오기
        var roomCount = $("#roomTotal").text();
        var guestCount = $("#guestTotal").text();

        // 해당 정보를 다른 버튼의 텍스트로 설정
        $(".btn_gray_hover span:nth-child(1)").text('객실' + roomCount);
        $(".btn_gray_hover span:nth-child(2)").text('인원' + guestCount + '명');

        // 필요한 경우, 팝업창 닫기 로직 추가
        $("#select_room_guest").hide();
    });
    
});





</script>
</head>
<body>
	<div class="container">
		<div class="left-div">

			<c:forEach items="${requestScope.randomimage}" var="image"
				varStatus="loop" begin="0" end="4">
				<span class="p${loop.index < 2 ? '1' : '2'}"> <img
					src="${pageContext.request.contextPath}/upload/${image}"
					style="width: 100%;" data-src="" alt="">
				</span>
			</c:forEach>

		</div>
		<div class="right-div">
			<table class="table table-borderless">
				<thead>
					<tr>
						<td>
							<h2 align="right">${requestScope.acbean.name}</h2>
							<p align="right">${requestScope.acbean.description}</p>
						</td>
					</tr>
					<tr>
						<td>리뷰 정보</td>
					</tr>
					<tr>
						<td class="col-6"><p class="tit">1박 요금 최저가</p></td>
						<td class="col-6" align="right"><strong class="price">
								<fmt:formatNumber>
						${requestScope.minprice}
						</fmt:formatNumber>
						</strong> 원~</td>
					</tr>
				</thead>
			</table>
		</div>
		<div>
			<table class="table">
				<tbody>
					<tr>
						<td>주소 : ${requestScope.acbean.address}</td>
						<td align="right">
						<input class="btn_gray_hover" type="text" name="date" id="datepicker" placeholder="날짜를 선택하세요." readonly > 
						<a href="#select_room_guest" class="btn_gray_hover open-popup"> 
						<span>객실1</span>
						<span>인원2명</span>
						</a>
							<button class="btn_gray_hover">객실 검색</button></td>
					</tr>
				</tbody>
			</table>
		</div>

		<div id="select_room_guest" class="popup-layer">
	    <div class="popup-content">
	        <ul id="roomList">
	            <!-- 객실 수량 관련 코드 -->
	            <li>
	                <div class="">
	                    <strong class="">객실 선택</strong>
	                </div>
	                <div class="">
	                        <span class="">객실</span>
	                    <span class="">
	                        <button class="minus subtract-room" data-type="room">-</button> 
	                        <span name="roomQty" class="roomQty" id="roomQty">1</span>
	                        <button class="plus add-room" data-type="room">+</button>
	                    </span>
	                </div>
	            </li>
	            <!-- 인원 수량 관련 코드 -->
	            <li class="guest-configuration">
	                <div class="">
	                    <strong class="">객실별 인원 설정</strong>
	                </div>
	                <div class="">
	                    <p class="">
	                        <span class=""></span> 객실 1
	                    </p>
	                </div>
	                <div class="">
	                        <span class="">인원</span>
	                    <button class="minus" data-type="guest1">-</button> 
	                    <span name="guest1Qty" class="guest1Qty" >2</span>
	                    <button class="plus" data-type="guest1">+</button>
	                </div>
	            </li>
	        </ul>
	    </div>
	    <br>
	    <div class="">
	        객실<span class="roomTotal" name="roomTotal" id="roomTotal">1</span> 
	        인원<span class="guestTotal" name="guestTotal" id="guestTotal">2 </span>
	        <span class="">
	            <button class="btn_purple_hover complete-selection">선택완료</button>
	        </span>
	    </div>
	</div>



		<table class="table">
			<tbody>
				<c:forEach var="bean" items="${requestScope.roomlists}">
					<tr>
						<td class="col-6" data-bs-toggle="modal" data-bs-target="#myModal"
							data-roid="${bean.roid}" data-zxc="zxc">${bean.room}</td>
						<td class="col-3">조식 ${bean.breakfast}</td>
						<td class="col-1">1박<br> <fmt:formatNumber
								value="${bean.price}"></fmt:formatNumber>원
						</td>
						<td class="col-2"><a href="#"
							class="btn_gray_hover reserve-button"
							data-datepicker="#datepicker" data-roid="${bean.roid}"> 예약하기
						</a></td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
		<table class="table table-borderless" id="amList">
		</table>
	</div>
	<!-- The Modal -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content" id="roomDetail"></div>
		</div>
	</div>
</body>
</html>
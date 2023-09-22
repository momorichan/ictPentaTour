<%@page import="java.net.URLConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>렌터카 렌터카</title>	
</head>
<script type="text/javascript">
$(document).ready(function(){
	var xhr = new XMLHttpRequest();
	var url = 'http://api.data.go.kr/openapi/tn_pubr_public_car_rental_api'; /*URL*/
	var queryParams = '?' + encodeURIComponent('serviceKey') + '='+ 'KmSD%2BU%2B3R4TTLX%2B%2BBJTTSzxPmO3apldl6NfCAD7H8LjCXk2Jd0q24cVBwygkKOYyH50C%2BXNnt%2Flj3Vh5vCZ7HQ%3D%3D'; /*Service Key*/
	queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /*페이지 번호*/
	queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('100'); /*한 페이지 결과 수*/
	queryParams += '&' + encodeURIComponent('type') + '=' + encodeURIComponent('json'); /**/
	queryParams += '&' + encodeURIComponent('entrpsNm') + '=' + encodeURIComponent(''); /*업체명*/
	queryParams += '&' + encodeURIComponent('bplcType') + '=' + encodeURIComponent(''); /*사업장구분*/
	queryParams += '&' + encodeURIComponent('rdnmadr') + '=' + encodeURIComponent(''); /*소재지도로명주소*/
	queryParams += '&' + encodeURIComponent('lnmadr') + '=' + encodeURIComponent(''); /* 소재지 지번주소*/
	queryParams += '&' + encodeURIComponent('latitude') + '=' + encodeURIComponent(''); /* 위도*/
	queryParams += '&' + encodeURIComponent('longitude') + '=' + encodeURIComponent(''); /* 경도*/
	queryParams += '&' + encodeURIComponent('garageRdnmadr') + '=' + encodeURIComponent(''); /* 차고지 도로명주소 */
	queryParams += '&' + encodeURIComponent('garageLnmadr') + '=' + encodeURIComponent(''); /* 차고지 지번주소*/
	queryParams += '&' + encodeURIComponent('garageAceptncCo') + '=' + encodeURIComponent(''); /* 보유 차고지 수용능력*/
	queryParams += '&' + encodeURIComponent('vhcleHoldCo') + '=' + encodeURIComponent(''); /* 자동차 총 보유대수*/
	queryParams += '&' + encodeURIComponent('carHoldCo') + '=' + encodeURIComponent(''); /* 승용차보유대수*/
	queryParams += '&' + encodeURIComponent('vansHoldCo') + '=' + encodeURIComponent(''); /* 승합차보유대수*/
	queryParams += '&' + encodeURIComponent('eleCarHoldCo') + '=' + encodeURIComponent(''); /* 전기승용차보유대수*/
	queryParams += '&' + encodeURIComponent('eleVansCarHoldCo') + '=' + encodeURIComponent(''); /* 전기승합차보유대수*/
	queryParams += '&' + encodeURIComponent('lghvhclChrge') + '=' + encodeURIComponent(''); /* 경차요금 */
	queryParams += '&' + encodeURIComponent('cmhvhclChrge') + '=' + encodeURIComponent(''); /* 소형차요금 */
	queryParams += '&' + encodeURIComponent('mdhvhclChrge') + '=' + encodeURIComponent(''); /* 중형차요금 */
	queryParams += '&' + encodeURIComponent('lgshvhclChrge') + '=' + encodeURIComponent(''); /* 대형차요금 */
	queryParams += '&' + encodeURIComponent('vahvhclChrge') + '=' + encodeURIComponent(''); /* 승합차요금 */
	queryParams += '&' + encodeURIComponent('lshvhclChrge') + '=' + encodeURIComponent(''); /* 레저용차요금 */
	queryParams += '&' + encodeURIComponent('imhvhclChrge') + '=' + encodeURIComponent(''); /* 수입차요금 */
	queryParams += '&' + encodeURIComponent('weekdayOperOpenHhmm') + '=' + encodeURIComponent(''); /* 평일운영시작시간*/
	queryParams += '&' + encodeURIComponent('weekdayOperColseHhmm') + '=' + encodeURIComponent(''); /* 평일운영종료시간*/
	queryParams += '&' + encodeURIComponent('wkendOperOpenHhmm') + '=' + encodeURIComponent(''); /* 주말운영시작시간*/
	queryParams += '&' + encodeURIComponent('wkendOperCloseHhmm') + '=' + encodeURIComponent(''); /* 주말운영종료시간*/
	queryParams += '&' + encodeURIComponent('holidayOperOpenHhmm') + '=' + encodeURIComponent(''); /* 공휴일운영시작시간*/
	queryParams += '&' + encodeURIComponent('holidayCloseOpenHhmm') + '=' + encodeURIComponent(''); /* 공휴일운영종료시간*/
	queryParams += '&' + encodeURIComponent('rstde') + '=' + encodeURIComponent(''); /* 휴무일*/
	queryParams += '&' + encodeURIComponent('homepageUrl') + '=' + encodeURIComponent(''); /**/
	queryParams += '&' + encodeURIComponent('rprsntvNm') + '=' + encodeURIComponent(''); /**/
	queryParams += '&' + encodeURIComponent('phoneNumber') + '=' + encodeURIComponent(''); /* 전화번호*/
	queryParams += '&' + encodeURIComponent('referenceDate') + '=' + encodeURIComponent(''); /* 데이터기준일자*/
	queryParams += '&' + encodeURIComponent('instt_code') + '=' + encodeURIComponent(''); /* 제공기관코드*/
	xhr.open('GET', url + queryParams);
	xhr.onreadystatechange = function () {
	    if (this.readyState == 4) {
	        alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
	    }
	};
	xhr.send('');
	)};
</script>
<script type="text/javascript">
	$(function){
	$.ajax({
		method: "GET",
		url: "http://api.data.go.kr/openapi/tn_pubr_public_car_rental_api",
		data: {
			pageNo: 1,
			numOfRows: 100,
			type: "json",
		}	
	})
	.done(function(msg){
		cosole.log(msg);
	});
	
	};

</script>
<body>





</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휠체어 - 예약확인</title>
<style>
	#reservationInfo{
		background-color: lightgray; margin: 20px;
	}
	.oneReservationDiv{
		background-color: gray; margin: 20px;
	}
</style>
</head>
<body>
	<div id="userheader"><%@ include
			file="/WEB-INF/views/include/userheader.jsp"%></div>

	<div id="reservationInfo">
	</div>

	<div id="userfooter"><%@ include
			file="/WEB-INF/views/include/userfooter.jsp"%></div>
</body>
<script type="text/javascript">
	//예약 내역
	let uReserveList = ${uReserveList};
	let str = "";
	console.log(uReserveList);
	
	for (let i = 0; i < uReserveList.length; i++) {
		str += "<div class='oneReservationDiv'>"
		str += uReserveList[i].ur_date + '<br>'; //예약일자
		str += uReserveList[i].b_no + '<br>'; //버스번호
		str += uReserveList[i].s_namestart + '['+uReserveList[i].s_nostart+']<br>'; //출발지
		str += uReserveList[i].s_namelast + '['+uReserveList[i].s_nolast+']<br>';//도착지
		str += "</div>"
	}
	$("#reservationInfo").empty();
	$("#reservationInfo").append(str);
	
	
</script>
</html>
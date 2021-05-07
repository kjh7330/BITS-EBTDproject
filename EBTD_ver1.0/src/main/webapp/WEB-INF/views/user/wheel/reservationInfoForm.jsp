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
	let uReserveBean = ${uReserveBean};
	let str = "";
	
	/* for (let i = 0; i < uList.length; i++) {
		//0,1을 --> 휠체어, 시각으로 바꾸어 출력
		if (uList[i].u_type == 0) {
			uList[i].u_type = '휠체어';
		} else
			uList[i].u_type = '시각'; */
	
		//예약일시
		str += uReserveBean.ur_date + '<br>';
		//버스번호
		str += uReserveBean.b_no + '<br>';
		//출발지
		str += uReserveBean.s_nostart + '<br>';
		//출발지
		str += uReserveBean.s_nolast + '<br>';
	
	$("#reservationInfo").empty();
	$("#reservationInfo").append(str);
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휠체어 - 예약확인</title>
<style>
	#reservationInfo{
		background-color: lightgray; margin: 20px; padding: 10px;
	}
	.oneReservationDiv{
		background-color: gray; margin: 20px; padding: 10px;
	}
	
	
</style>
</head>
<body>
	<div id="userheader"><%@ include
			file="/WEB-INF/views/include/userheader.jsp"%></div>
	<form id="reservationForm" name="reservationForm" action="/user/getReservationDetail" method="get">
	</form>
	<div id="reservationInfo">	
	</div>

	<div id="userfooter"><%@ include
			file="/WEB-INF/views/include/userfooter.jsp"%></div>
</body>
<script type="text/javascript">
	//예약 내역
	let uReserveList = ${uReserveList};
	let str = "";
	
	for (let i = 0; i < uReserveList.length; i++) {
		str += "<div class='oneReservationDiv'>"
		str += '예약일자: <input type="text" class="ur_date" name="ur_date" value="'+uReserveList[i].ur_date+'"><br>' //예약일자
		str += '버스번호: <input type="text" class="b_no" name="b_no" value="'+uReserveList[i].b_no+'"><br>' //버스번호
		str += '출   발: <input type="text" class="s_nostart" name="s_nostart" value="'+uReserveList[i].s_namestart +'"><br>' //출발지
		//str += '<input type="text" class="s_nostart" name="s_nostart" value="'+uReserveList.s_namestart + '['+uReserveList[i].s_nostart+'">' //출발지
		str += '도   착: <input type="text" class="s_namelast" name="s_namelast" value="'+uReserveList[i].s_namelast +'">' //도착지
		//str += '<input type="text" class="s_namelast" name="s_namelast" value="'+uReserveList.s_namelast + '['+uReserveList[i].s_nolast+'">' //도착지
		str += '<input type="hidden" class="ur_no" name="ur_no" value="'+uReserveList[i].ur_no +'"><br>' //예약넘버	
		//str += '<input type="button" class="cancelBtn" value="예약취소">'
		str += "</div>"
	}
	$("#reservationInfo").empty();
	$("#reservationInfo").append(str);
	
	//내역 div 클릭
	$(".oneReservationDiv").click(function(){
		$('#reservationForm').html('<input name = "ur_no" type = "hidden" value = '+$(this).children('.ur_no').val()+'>');
		$('#reservationForm').append('<input name = "b_no" type = "hidden" value = '+$(this).children('.b_no').val()+'>');
		
		$('form').trigger('submit');
		
	});
	
	//예약취소 버튼
	$(".cancelBtn").click(function(){
		let ur_no = $(this).parent().children('.ur_no').val();
		console.log(ur_no);
	});
	
</script>
</html>
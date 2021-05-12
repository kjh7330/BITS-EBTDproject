<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EBTD - 예약 확인</title>
<style>
	#reservationInfo{
		background-color: lightgray; margin: 20px; padding: 10px;
	}
	.oneReservationDiv{
		background-color: gray; margin: 9px; padding: 10px;
	}
.mainview {
	position: relative;
	top: 120px;
	color: black;
	padding: 20px;
	padding-bottom: 120px; /*footer여백*/
	z-index: 1;
	font-size: 18px;
	background-color : #f6f4f4;
	height: 100vh;
}

#userheader {
	position: absolute;
	z-index: 3;
}
.oneReservationDiv{
	cursor: pointer;
}
input{
	font-size: 18px;
	cursor: pointer;
}
input:focus{
	outline: none;
}

</style>
</head>
<body>
	<div id="userheader"><%@ include
			file="/WEB-INF/views/include/userheader.jsp"%></div>
	<div class="mainview">
		<form id="reservationForm" name="reservationForm" action="/user/getReservationDetail" method="get">
		</form>
		<div id="reservationInfo">	
		</div>
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
		str += '예약일자 : <input readonly type="text" class="ur_date" name="ur_date" value="'+uReserveList[i].ur_date+'"><br>' //예약일자
		str += '버스번호 : <input readonly type="text" class="b_no" name="b_no" value="'+uReserveList[i].b_no+'"><br>' //버스번호
		str += '출&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;발 : <input readonly type="text" class="s_nostart" name="s_nostart" value="'+uReserveList[i].s_namestart +'" style="margin-left:3px;"><br>' //출발지
		//str += '<input type="text" class="s_nostart" name="s_nostart" value="'+uReserveList.s_namestart + '['+uReserveList[i].s_nostart+'">' //출발지
		str += '도&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;착 : <input readonly type="text" class="s_namelast" name="s_namelast" value="'+uReserveList[i].s_namelast +'" style="margin-left:3px;">' //도착지
		//str += '<input type="text" class="s_namelast" name="s_namelast" value="'+uReserveList.s_namelast + '['+uReserveList[i].s_nolast+'">' //도착지
		str += '<input readonly type="hidden" class="ur_no" name="ur_no" value="'+uReserveList[i].ur_no +'"><br>' //예약넘버	
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
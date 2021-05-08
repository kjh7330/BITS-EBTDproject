<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휠체어 - 예약 상세보기</title>
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

	<form name="reservationCancel" id="reservationCancel" action="/user/reservationCancel" method="post"></form>
	<div id="reserveDetail" style="color:black">
	</div>

	<div id="userfooter"><%@ include
			file="/WEB-INF/views/include/userfooter.jsp"%></div>
</body>
<script type="text/javascript">
	//예약 내역
	let reserveDetail = ${reserveDetail};
	let str = "";
	console.log(reserveDetail);
	
		str += "<div class='reservation'>"
		str += reserveDetail.ur_date + '<br>'; //예약일자
		str += reserveDetail.b_no + '<br>'; //버스번호
		str += reserveDetail.s_namestart + '['+reserveDetail.s_nostart+']<br>'; //출발지
		str += reserveDetail.s_namelast + '['+reserveDetail.s_nolast+']<br>';//도착지
		str += '<input type="hidden" class="ur_no" name="ur_no" value="'+reserveDetail.ur_no +'"><br>'; //예약넘버	
		str += '<input type="button" class="cancelBtn" value="예약취소">';
		str += "</div>";
	
	$("#reserveDetail").empty();
	$("#reserveDetail").append(str);
	
	//예약취소버튼 누르면
	$(".cancelBtn").click(function(){
		let ur_no = $(this).parent().children('.ur_no').val();
		console.log(ur_no);

		$('#reservationCancel').append('<input type="hidden" class="ur_no" name="ur_no" value="'+reserveDetail.ur_no +'">');
		$('form').trigger('submit');
	});
	
	
</script>
</html>
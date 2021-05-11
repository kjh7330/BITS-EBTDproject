<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사 - 고객 센터</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="resources/js/jquery.serializeObject.js"></script>

<style type="text/css">
#userHistoryHeader {
	position: absolute;
	left: 50%;
	transform: translate(-50%, 7%);
	color: black;
	width: 800px;
	text-align: center;
	padding-bottom: 140px;
}
.maininput {
	border: none;
	background-color: #f9eb99;
	font-size: 20px;
	font-weight: bold;
	width: 800px;
	height: 50px;
	text-align: center;
	margin-bottom: 20px;
	border-radius: 10px;
}

#userHistory {
	border: 1px solid;
}

th, td {
	border: 1px solid;
}
.maintable{
	margin-left: auto;
	margin-right: auto;
	font-size: 18px;
}
</style>
</head>
<body>
<div id="companyheader"><%@ include file="/WEB-INF/views/include/companyheader.jsp" %>

</div>
	<div id="userHistoryHeader">
		<div><input class="maininput" value="당사 고객 이용 현황" readonly></div>
		<table class="maintable">
			<thead>
			<tr>
				<th>예약 번호</th>
				<th>유저 아이디</th>
				<th>출발 정류장</th>
				<th>도착 정류장</th>
				<th>이용 버스 번호</th>
				<th>이용 일시</th>
				<th>고객 유형</th>
			</tr>
			</thead>
			<tbody id="userHistory">
			</tbody>
		</table>
	</div>

<div id="companyfooter"><%@ include file="/WEB-INF/views/include/companyfooter.jsp" %>

</div>
</body>
<script type="text/javascript">
console.log(${uhList});
var uhList = ${uhList};
$(document).ready(function() {
	for(var i=0; i<uhList.length; i++) {
		$('#userHistory').append('<tr>');
		$('#userHistory').append('<td>'+uhList[i].ur_no+'</td>');
		$('#userHistory').append('<td>'+uhList[i].u_userName+'</td>');
		$('#userHistory').append('<td>'+uhList[i].s_nostart+'</td>');
		$('#userHistory').append('<td>'+uhList[i].s_nolast+'</td>');
		$('#userHistory').append('<td>'+uhList[i].b_no+'</td>');
		$('#userHistory').append('<td>'+uhList[i].ur_date+'</td>');
		if(uhList[i].u_type==0)
			$('#userHistory').append('<td>휠체어</td></tr>');
		else if(uhList[i].u_type==1)
			$('#userHistory').append('<td>시각장애인</td></tr>');
	}
}); 
</script>
</html>
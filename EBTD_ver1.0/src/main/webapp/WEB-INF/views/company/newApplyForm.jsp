<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사 - 노선 관리</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript"></script>
<style type="text/css">
#newApplyListHeader {
	position: absolute;
	left: 50%;
	transform: translate(-50%, 40%);
	color: black;
	width: 800px;
	text-align: center;
	padding-bottom: 140px;
}

#newApplyList {
	border: 1px solid;
}

th, td {
	border: 1px solid;
	height: 37px;
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
.maintable{
	width: 500px;
	margin-left: auto;
	margin-right: auto;
	font-size: 18px;
}
</style>
</head>
<body>
	<div id="companyheader"><%@ include file="/WEB-INF/views/include/companyheader.jsp"%></div>
	<div id="newApplyListHeader">
	<div><input class="maininput" value="신규 신청 내역" readonly></div>
		<table class="maintable">
			<thead>
			<tr style="background-color: lightgray">
				<th>버스 번호</th>
				<th>신청 일시</th>
				<th>신청 상황</th>
				<th>세부 정보</th>
			</tr>
			</thead>
			<tbody id="newApplyList">
			</tbody>
		</table>
	</div>


	<div id="companyfooter"><%@ include file="/WEB-INF/views/include/companyfooter.jsp"%></div>
</body>
<script type="text/javascript">
var aList = ${aList};
console.log(aList.length)
$(document).ready(function() {
		for (var i=0; i<aList.length; i++) {
			$('#newApplyList').append('<tr>'); 
			$('#newApplyList').append('<td>'+aList[i].ap_b_no+'</td>');
			$('#newApplyList').append('<td>'+aList[i].ap_date+'</td>');
			 if(aList[i].ap_state == 0) {
				$('#newApplyList').append('<td>대기</td><td>없음</td></tr>');			
			} else if(aList[i].ap_state == 1) {
				$('#newApplyList').append('<td>승인</td><td>없음</td></tr>');			
			} else if(aList[i].ap_state == 2) {
				$('#newApplyList').append('<td>반려</td>');
				$('#newApplyList').append('<td>'+aList[i].ap_reject+'</td></tr>');			
			};  
		};
	});
</script>
</html>
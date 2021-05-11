<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사 - 고객 센터</title>
<style type="text/css">
.main-container {
	position: absolute;
	left: 50%;
	transform: translate(-50%, 57%);
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
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="resources/js/jquery.serializeObject.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
<div id="companyheader"><%@ include file="/WEB-INF/views/include/companyheader.jsp" %></div>
<div class="main-container"><br>
	<div><input class="maininput" value="현재 탑승인원" readonly></div>

	<select id = "busNumber">
	</select>
</div>
<div id="companyfooter"><%@ include file="/WEB-INF/views/include/companyfooter.jsp" %></div>
</body>
<script type="text/javascript">
console.log(${busNum}.B_NO);
</script>
</html>
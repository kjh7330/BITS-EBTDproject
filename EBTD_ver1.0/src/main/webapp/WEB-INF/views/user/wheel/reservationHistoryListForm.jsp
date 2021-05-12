<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"   %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EBTD - 이용 내역</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/v4-shims.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
	.main-container{
		color: black;
		
	}
	.maintable{
		width: 410px;
		height: 100px;
		font-size: 15px;
		text-align: center;
		margin-left: 20px;
		background-color : #f6f4f4;
	}
.maindiv{
	position: relative;
	top: 130px;
	color: black;
	padding-bottom: 120px; /*footer여백*/
	z-index: 1;
}
#userheader {
	position: absolute;
	z-index: 3;
}
.btn{
	width: 90px;
	height: 30px;
	font-size: 15px;
	border-radius:8px; 
}

	
</style>
</head>
<body>
<div id="userheader"><%@ include file="/WEB-INF/views/include/userheader.jsp"%></div>
<div class="main-container">
	<div class="maindiv">
		<table class="maintable">
			<tr style="font-size: 18px; background-color: #f9eb99; height: 35px;">
				<td>이용일자</td><td>노선번호</td><td>상세보기</td>
			</tr>
			<c:forEach var="ub" items="${ubList}">
			<tr>
				<td>${ub.ur_date}</td><td>${ub.b_no}</td><td><button class="btn" onclick="location.href='/user/getReservationHistoryDetail?ur_no=${ub.ur_no}'">상세</button></td>
			</tr>
			</c:forEach>
		</table>
	</div>
 
</div>
<div id="userfooter"><%@ include file="/WEB-INF/views/include/userfooter.jsp"%></div>
<script>

	
</script>
</body>
</html>
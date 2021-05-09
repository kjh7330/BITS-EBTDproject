<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"   %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용 내역</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/v4-shims.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
	.main-container{
		color: black;
		margin: 15px;
	}
	.maintable{
		width: 410px;
		height: 500px;
		font-size: 23px;
		text-align: center;
		background-color: #f9eb99;
		
	}

	
</style>
</head>
<body>
<div id="userheader"><%@ include file="/WEB-INF/views/include/userheader.jsp"%></div>
<div class="main-container">
	<div class="maindiv">
		<table class="maintable">
			<c:forEach var="ubd" items="${ubdList}">
			<tr>
				<td>버스번호</td><td>${ubd.b_no}</td>
			</tr>
			<tr>
				<td>출발지</td><td>${ubd.s_nameStart}</td>
			</tr>
			<tr>
				<td>도착지</td><td>${ubd.s_nameLast}</td>
			</tr>
			<tr>
				<td>이용시간</td><td>${ubd.ur_date}</td>
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
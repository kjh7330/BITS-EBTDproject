<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.main-container {
	position: absolute;
	left: 50%;
	transform: translate(-50%, 42%);
	color: black;
	width: 800px;
	text-align: center;
	padding-bottom: 140px;
	font-size: 20px;
}

.maindivinput {
	border: none;
	border-radius: 8px;
	text-align: center;
	width: 800px;
	background-color: pink;
	height: 50px;
	font-weight: bold;
	font-size: 20px;
}
#table1{
	margin-left: auto;
	margin-right: auto;
	font-size: 18px;
	width: 800px;
}
</style>
</head>
<body>
<div id="adminheader"><%@ include file="/WEB-INF/views/include/adminheader.jsp" %></div>
	<div class="main-container">
	<div><br><input type="text" class="maindivinput" value="정류장 등록 및 신청 리스트" readonly><br></div><br>
	<table id="table1" border="1px solid black" style="color: black;text-align:center;">
	<tr style="background-color: lightgray;">
		<th>신청회사</th>
		<th>정류장 이름</th>
		<th>위치</th>
		<th>동 이름</th>
		<th>신청일</th>
		<th>상태(1.승인 2.반려)</th>
	</tr>
	<c:forEach var="sa" items="${saList}">
		<tr>
			<td>${sa.c_UserName}</td><td>${sa.sa_Name}</td><td>( ${sa.sa_X}, ${sa.sa_Y} )</td><td>${sa.t_Name}</td><td>${sa.sa_Date}</td><td>${sa.sa_State}</td>
		</tr>
	</c:forEach>
	</table>
</div>
<div id="adminfooter"><%@ include file="/WEB-INF/views/include/adminfooter.jsp" %></div>
</body>

<script type="text/javascript">
console.log(${saList})
</script>
</html>
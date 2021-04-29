<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="adminheader"><%@ include file="/WEB-INF/views/include/adminheader.jsp" %></div>
<div id="adminfooter"><%@ include file="/WEB-INF/views/include/adminfooter.jsp" %></div>

	<table id="table1" border="1px solid black" style="color: black;text-align:center;">
	<tr>
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
</body>

<script type="text/javascript">
console.log(${saList})
</script>
</html>
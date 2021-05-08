<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="resources/js/jquery.serializeObject.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
<div id="companyheader"><%@ include file="/WEB-INF/views/include/companyheader.jsp" %>
</div>
<h1>현재 탑승인원</h1>
<select id = "busNumber">
</select>
<div id="companyfooter"><%@ include file="/WEB-INF/views/include/companyfooter.jsp" %>
</div>
</body>
<script type="text/javascript">
console.log(${busNum}.B_NO);
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>시각 - 메인</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<p>${sessionScope.u_username}</p>님 환영합니다~!
	
	시각 - 메인
	
	<div class="menudetail" id="logout"><a>로그아웃</a></div>
</body>
<script type="text/javascript">
$('#logout').click(function () {
	location.href = '/user/logout';
});
</script>
</html>
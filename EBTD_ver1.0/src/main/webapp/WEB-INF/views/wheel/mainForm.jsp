<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<body>
	휠체어 메인 임시페이지
	<button id="logout">로그아웃</button>
</body>
<script type="text/javascript">
	$('#logout').click(function () {
			location.href = '/user/logout';
	});
</script>
</html>

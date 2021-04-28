<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<body>

	<h1>이용자 분류</h1>

	<button id="login">로그인</button>
	<button id="admin">관리자</button>
	<button id="user">유저</button>
	<button id="company">회사</button>
	<button id="driver">기사</button>

	<script type="text/javascript">
		$('#login').click(function () {
			location.href = 'loginForm';
		});	
		$('#admin').click(function () {
			location.href = 'admin';
		});
		$('#user').click(function () {
			location.href = 'user/joinForm';
		});
		$('#userlogin').click(function () {
			location.href = 'user/loginForm';
		});
		$('#company').click(function () {
			location.href = 'company/companyindexForm';
		});
		$('#driver').click(function () {
			location.href = 'driver/getCompanyList';
		});
	</script>
</body>
</html>
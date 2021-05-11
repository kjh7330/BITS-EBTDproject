<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EBTD</title>
<style type="text/css">
	button{
		width: 110px;
		height: 40px;
		font-size: 15px;
		font-weight: bold;
		border-radius: 8px;
		cursor: pointer;
	}
	button:hover{
		background-color: #0c3d6a;
		color: #f9eb99;
	}
.divs{
	width: 100%;
	margin-top: 100px;
	text-align: center;
}
h1{
	margin-bottom: 50px;
}
.div{
	margin-left: auto;
	margin-right: auto;
}
</style>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<body>
	
	<div class="divs">
	<h1>이용자 분류</h1>
		<div class="div">
			<button id = "login">회사 로그인</button>
			<button id = "userlogin">유저 로그인</button>
			<button id = "admin">관리자</button>
			<!-- button id = "company">회사</button-->
			<button id = "driver">기사</button>
		</div>
	</div>
	<script type="text/javascript">
	$('#login').click(function () {
	   location.href = 'loginForm';
	});   
   
	$('#admin').click(function () {
	      location.href = 'admin';
	});
	$('#userlogin').click(function () {
	   location.href = 'user/logout';
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

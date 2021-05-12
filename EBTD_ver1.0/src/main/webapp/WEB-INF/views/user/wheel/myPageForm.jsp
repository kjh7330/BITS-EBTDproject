<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EBTD - 마이페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<style>
	.mypageBtn button{
		margin-left: 26px;
		margin-top: 70px;
		border-radius: 40px;
		width: 400px;
		height: 100px;
		font-size: 30px;
		cursor: pointer;
	}
	.mypageBtn button:hover {
		background-color: #f9eb99;
	}
.mainview {
	position: relative;
	top: 90px;
	color: black;
	padding-bottom: 120px; /*footer여백*/
	z-index: 1;
}
#userheader {
	position: absolute;
	z-index: 3;
}

</style>
<body>
	<div id="userheader"><%@ include file="/WEB-INF/views/include/userheader.jsp"%></div>
	<div class="mainview">
	<main class="mypageBtn">
	<button onclick="location.href='/user/getReservationHistoryList'">이용 내역</button>
	<button onclick="location.href='/user/getMyQuestionList'">고객 소리함</button>
	<button onclick="location.href='/user/getUserMyInfo'">내 정보 확인</button>
	
	</main>
	</div>		
	<div id="userfooter"><%@ include file="/WEB-INF/views/include/userfooter.jsp"%></div>

</body>
<script type="text/javascript">
$('#logout').click(function () {
	location.href = '/user/logout';
});
</script>
</html>
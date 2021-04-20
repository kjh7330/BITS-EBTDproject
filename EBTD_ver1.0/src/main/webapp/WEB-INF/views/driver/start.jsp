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

	<h1>기사 시작화면</h1>
	아무곳이나 터치해주세요.


	<script type="text/javascript">
		$('body').css('width','100%');
		$('body').css('height','800px');
		$('body').click(function () {
			location.href = 'driver/getCompanyList';
		});
	</script>
</body>
</html>
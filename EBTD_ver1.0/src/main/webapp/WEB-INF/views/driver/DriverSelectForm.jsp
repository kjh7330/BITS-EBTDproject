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
	<h1>EBTD 기사 선택 화면</h1><br>
	<select id = 'sel' name = 'd_name'>
		<option value = "">기사선택</option>
	</select>
	
	<button id = 'btn'>선택</button>
	<button id = 'back'>뒤로가기</button>
	
	<script type="text/javascript">
		$('#btn').click(function () {
			if( $('#sel').val() == '')	alert("운행 기사님을 선택해주세요");
			else						location.href = 'getBusRouteList?d_name='+$('#sel').val().substring(6)+'&d_no='+$('#sel').val().substring(0,6);
		});
		$('#back').click(function () {
			location.href = 'getBusList?c_username=${c_username}'
		});
		let tx = '';
		console.log(${d_list});
		$.each(${d_list}, function (i, data) {
			tx += '<option value = "'+data['d_no'] + data['d_name'] + '">' + data['d_name']+'</option>';
		});
		$('#sel').append(tx);
	</script>
</body>
</html>
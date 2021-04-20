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
	<h1>EBTD 버스 선택 화면</h1><br>
	<select id = 'sel' name = 'ab_no'>
		<option value = "">버스선택</option>
	</select>
	
	<button id = 'btn'>선택</button>
	<button id = 'back'>뒤로가기</button>
	
	<script type="text/javascript">
		$('#btn').click(function () {
			if( $('#sel').val() == '')	alert("버스번호를 선택해주세요");
			else						location.href = 'getDriverList?ab_no=' + $('#sel').val().substring(0,4) + '&b_type='+$('#sel').val().substring(4,5) + '&b_no=' + $('#sel').val().substring(5);
		});
		$('#back').click(function () { 
			location.href = 'getCompanyList';
		});
		let tx = '';
		console.log(${b_list});
	 	$.each(${b_list}, function (i, data) {
			tx += '<option value = "'+ data['ab_no'] + data['ab_type'] + data['b_no'] + '">' + data['b_no'] + ' / ' + data['ab_no'] + ' / '+ (( data['ab_type'] == 1 ) ? '저상' : '일반') + '</option>';
		});
	 	console.log(${b_list});
		$('#sel').append(tx);
	</script>
</body>
</html>
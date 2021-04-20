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
	<h1>EBTD 기사 회사 선택 화면</h1><br>
	<select id = 'sel' name = 'c_username'>
		<option value = "">회사선택</option>
	</select>
	
	<button id = 'btn'>선택</button>
	
	<script type="text/javascript">
		$('#btn').click(function () {
			if( $('#sel').val() == '')	alert("회사를 선택해주세요");
			else						location.href = 'getBusList?c_username='+$('#sel').val();
		});
		
		let tx = '';
		console.log(${c_list});
		$.each(${c_list}, function (i, data) {
			tx += '<option value = "' + data['c_username'] + '">' + data['c_username']+'</option>';
		});
		$('#sel').append(tx);
		
	</script>
</body>
</html>
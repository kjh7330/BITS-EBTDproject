<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업체 선택 화면</title>
<style type="text/css">
	body{
		margin : 0;
	}#logo_table{
		width : 100%;
		background-color: #0C3D6a;
		background-color: #0C3D6a;
		text-align : center;
	}#logo_table td{
		width : 33%;
	}.logo_td{
		font-size : 11px;
		color : #f9eb99;
		font-weight : bold;
	}
	.logo{
		width: 50px;
	}table{
		margin-left : auto;
		margin-right : auto;
	}button{
            text-align: center;
            background-color: #f9eb99;
            border-radius: 8px;
            width : 80px;
            height : 30px;
            border: none;
            margin: 5px;
	}
	button:hover{
	   background-color: #cec380;
	   cursor : pointer;
	}
</style>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<body>
	<header>
		<table id = 'logo_table'>
			<tr>
				<td/>
				<td  class = 'logo_td'> <img class="logo" alt="logo" src="/resources/image/mainlogo.png">
				</td>
				<td style = 'color : #f9eb99;'>
					업체 선택
				</td>
			</tr>
		</table>
	</header>
	
	<table>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>
				<select id = 'sel' name = 'c_username'>
					<option value = "">회사선택</option>
				</select>
			</td>
			<td>
				<button id = 'btn'>선택</button>
			</td>
		</tr>
	</table>
	
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
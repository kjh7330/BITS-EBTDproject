<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body{
		margin : 0;
	}#logo_table{
		width : 100%;
		background-color: #0C3D6a;
		background-color: #0C3D6a;
		text-align : center;
	}.logo_td{
		font-size : 11px;
		color : #f9eb99;
		font-weight : bold;
	}
	.logo{
		width: 50px;
	}#logo_table td{
		width : 33%;
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
					운행 노선 선택
				</td>
			</tr>
		</table>
	</header>
	<table id = 'contents_table'>
	<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td></td>
			<td>
				<select id = 'sel' name = 'ab_no'>
					<option value = "">버스선택</option>
				</select>
				
				<button id = 'btn'>선택</button>
				<button id = 'back'>뒤로가기</button>
			</td>
		</tr>
	</table>
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
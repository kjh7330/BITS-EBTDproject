<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사 관리 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
		.main-container{
		    position: absolute;
		    top: 13%;
            left: 50%;
            transform: translate(-56%,12%);
			color: black;
			width: 700px;
            text-align: center;
			padding-bottom: 140px;
		}
		.maininput{
			border: none;
			background-color: #f9eb99;
			font-size: 20px;
			width: 400px;
			font-weight: bold;
			width: 800px;
			height: 50px;
			text-align: center;
			margin-bottom: 20px;
			border-radius: 10px;
		}
		.maininput:focus{
			outline:none;
		}
		.maintable1, .maintable2{
			border: none;
            text-align: center;
            width: 600px;
            height: 50px;
            font-size: 18px;
            border: 1px solid black;
            margin-left: auto;
            margin-right: auto;
		}
		.maintable1{
			background-color: #fff9d4;
		}
		tr, td{
			border: 1px solid black;
		}
		.main-table{
			width: 800px;
		}
		.maintable3{
			border: none;
            text-align: center;
            width: 700px;
            height: 50px;
            background-color: violet;
            top: 0;
            font-size: 18px;
            margin-left: auto;
            margin-right: auto;
		}
		#adminfooter{
			display: block;
			bottom: 100px;
		}

    </style>
</head>
<body>
<div id="adminheader"><%@ include file="/WEB-INF/views/include/adminheader.jsp" %></div>

<div class="main-container">
	<div>
		<input class="maininput" value="노선 반려 상세" readonly>
	</div>
	<div class="main-table">
		<table class="maintable1"></table>
		<br>
		
		<table class="maintable2"></table>
		<br>
		<table class="maintable3"></table>
	</div>
</div>


<div id="adminfooter"><%@ include file="/WEB-INF/views/include/adminfooter.jsp" %></div>

<script type="text/javascript">
	let rList = ${rList};
	console.log(rList);
	
 	$('.maintable1').html('');
	let pine = '';
		pine += '<tr>';
		pine += '<td>'+ rList[0]["c_name"]+'</td>';
		pine += '<td>'+ rList[0]["ap_b_no"]+'번 노선</td>';
		pine += '</tr>';
	$('.maintable1').append(pine);
		
	$('.maintable2').html('');
	let apple = '';
		apple += '<tr>';
		apple += '<td style="border-bottom: 1px solid black; background-color:skyblue;">순번</td>';
		apple += '<td style="border-bottom: 1px solid black; background-color:skyblue;">정류장번호</td>';
		apple += '<td style="border-bottom: 1px solid black; background-color:skyblue;">정류장이름</td>';
		apple += '</tr>';
	for(i in rList){
		apple += '<tr>';
		apple += '<td>'+ rList[i]["apde_turn"]+'</td>';
		apple += '<td>'+ rList[i]["s_no"]+'</td>';
		apple += '<td>'+ rList[i]["s_name"]+'</td>';
		apple += '</tr>';
	}
	$('.maintable2').append(apple);
	
 	$('.maintable3').html('');
	let good = '';
		good += '<tr>';
		good += '<td>반려 사유 : '+ rList[0]["ap_reject"]+'</td>';
		good += '</tr>';
	$('.maintable3').append(good);

	$('#maintable2').css('border-radius','8px'); 
	
	
	
</script>
</body>
</html>
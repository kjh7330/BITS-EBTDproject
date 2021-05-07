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
            transform: translate(-50%,10%);
			color: black;
			width: 700px;
            text-align: center;
            height:	100%;
		}
		.maininput{
			border: none;
			background-color: pink;
			font-size: 30px;
			width: 400px;
			height: 80px;
			text-align: center;
			margin-bottom: 20px;
			border-radius: 10px;
		}
		.maininput:focus{
			outline:none;
		}
		.maintable1, .maintable2{
			border: none;
            border-radius: 8px;
            text-align: center;
            width: 700px;
            background-color: pink;
            font-size: 18px;
		}
		.maintable1{
			font-size: 20px;
			height: 50px;
		}
		.maintable3{
			border: none;
            border-radius: 8px;
            text-align: center;
            width: 700px;
            height: 50px;
            background-color: violet;
            top: 0;
            font-size: 18px;
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
	
	<table class="maintable1"></table>
	<br>
	
	<table class="maintable2"></table>
	<br>
	<table class="maintable3"></table>
<div>
 	<h3>&nbsp;</h3>
 	<h3>&nbsp;</h3>
 	<h3>&nbsp;</h3>
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

</script>
</body>
</html>
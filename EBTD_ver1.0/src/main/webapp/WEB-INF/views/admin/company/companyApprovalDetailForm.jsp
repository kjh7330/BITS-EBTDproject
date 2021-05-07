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
            height: 100%;
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
            text-align: center;
            width: 700px;
            background-color: skyblue;
            height: 50px;
            font-size: 18px;
		}
		.maintable:focus{
			outline:none;
		}

    </style>
</head>
<body>
<div id="adminheader"><%@ include file="/WEB-INF/views/include/adminheader.jsp" %></div>

<div class="main-container">
	<div>
		<input class="maininput" value="노선 승인 상세" readonly>
	</div>
	<table class="maintable1">
	
	</table>
	<br>

	<table class="maintable2">
	
	</table>
</div>


<div id="adminfooter"><%@ include file="/WEB-INF/views/include/adminfooter.jsp" %></div>

<script type="text/javascript">
	let aList = ${aList};
	console.log(aList);
	
 	$('.maintable1').html('');
	let pine = '';
		pine += '<tr>';
		pine += '<td>'+ aList[0]["c_name"]+'</td>';
		pine += '<td>'+ aList[0]["ap_b_no"]+'번 노선</td>';
		pine += '</tr>';
	$('.maintable1').append(pine);
		
	$('.maintable2').html('');
	let apple = '';
		apple += '<tr>';
		apple += '<td style="border-bottom: 1px solid black; background-color:pink;">순번</td>';
		apple += '<td style="border-bottom: 1px solid black; background-color:pink;">정류장번호</td>';
		apple += '<td style="border-bottom: 1px solid black; background-color:pink;">정류장이름</td>';
		apple += '</tr>';
	for(i in aList){
		apple += '<tr>';
		apple += '<td>'+ aList[i]["apde_turn"]+'</td>';
		apple += '<td>'+ aList[i]["s_no"]+'</td>';
		apple += '<td>'+ aList[i]["s_name"]+'</td>';
		apple += '</tr>';
	}
	$('.maintable2').append(apple);

</script>
</body>
</html>
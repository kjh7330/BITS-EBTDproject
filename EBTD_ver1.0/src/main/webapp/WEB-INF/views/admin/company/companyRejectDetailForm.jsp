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
            left: 50%;
            transform: translate(-50%,10%);
			color: black;
			width: 700px;
            text-align: center;
		
		}
		.maintable1, .maintable2, .maintable3{
			border: none;
            border-radius: 8px;
            width: 700px;
            background-color: pink;
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
		<input value="노선 승인 상세" readonly>
	</div>
	<table class="maintable1">
	
	</table>
	<br>
	<table class="maintable2">
	
	</table>
	<br>
	<table class="maintable3">
	
	</table>
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
		apple += '<td>순번</td>';
		apple += '<td>정류장번호</td>';
		apple += '<td>정류장이름</td>';
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
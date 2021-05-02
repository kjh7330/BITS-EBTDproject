<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"   %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용 내역</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/v4-shims.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
	.main-container{
		color: black;
		margin: 15px;
	}
	.category{
		text-align: center;
	}
	#category{
		font-size: 20px;
	}
	.maintable{
		width: 410px;
		height: 100px;
		font-size: 15px;
	}

	
</style>
</head>
<body>
<div id="userheader"><%@ include file="/WEB-INF/views/include/userheader.jsp"%></div>
<div class="main-container">
	<div class="category">
		<select id="category" onchange="fnCtg()">
			<option value="all" selected>전체</option>
			<option value="all" selected>일주일</option>
			<option value="all" selected>1개월</option>
			<option value="all" selected>3개월</option>
		</select>
	</div><br>
	<div class="maindiv">
		<table class="maintable">
			<tr>
				<td>탑승일</td><td>ubList[i]["urh_date"]</td>
			</tr>
			<tr>
				<td>[ubList[i]["b_no"]]</td><td></td>
			</tr>
		</table>
	</div>

</div>
<div id="userfooter"><%@ include file="/WEB-INF/views/include/userfooter.jsp"%></div>
<script>
	let ubList = ${ubList};
	
	$('.maindiv').html('');
	let apple = '';
	for(i in ubList){
		apple += '<input class="maininput" type="text" value="탑승일'+ ubList[i]["urh_date"];
		apple += '">';
	}
	$('.maindiv').append(apple);
	
</script>
</body>
</html>
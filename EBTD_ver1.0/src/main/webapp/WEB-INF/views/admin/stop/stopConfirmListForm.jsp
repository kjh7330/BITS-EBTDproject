<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#main-container{
		position: absolute;
		left: 50%;
		transform: translate(-50%,32%);
		color: black;
		width: 800px;
		text-align: center;
	}
	.maindivinput{
		border: none;
        border-radius: 8px;
        text-align: center;
        width: 800px;
        background-color: pink;
        height: 50px;
        font-weight: bold;
        font-size: 20px;
	}
	#table1{
		color: black;
	}
    .cbtn{
		text-align: center;
		width: 800px;
		height: 40px;
		background-color: lightgray;
		margin-bottom: 10px;
		font-weight: bold;
		border-radius: 10px;
		border: none;
	}
	.cbtn:hover{
		background-color: pink;
	}
	.submitbtn{
		width: 200px;
		height: 45px;
		font-size: 20px;
		border-radius: 10px;
		background-color: lightgray;
	}
	.submitbtn:hover{
		background-color: #ff8197;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<div id="adminheader"><%@ include file="/WEB-INF/views/include/adminheader.jsp" %></div>
<div id="main-container">
	<div><br><input type="text" class="maindivinput" value="정류장 등록 및 신청 리스트" readonly><br></div>
	<br>
	<form action="stopList"><input class="submitbtn" type="submit" value="정류장 등록"></form>
	<br>
	<table id="table1"></table>
</div>
<div id="adminfooter"><%@ include file="/WEB-INF/views/include/adminfooter.jsp" %></div>
</body>
<script type="text/javascript">
console.log(${saList});
let i=0;
let str="<tr>"
for(i; i < ${saList}.length; i++){
	str+='<td><a href=/admin/stop/getStopConfirmDetail?sa_No='+${saList}[i]["sa_No"]+'>';
	str+='<input class="cbtn" type="button" value="'+ ${saList}[i]['sa_Name']+'"></a>';
	str+="</td>";
	str+="</tr>";
}
$("#table1").append(str); 
</script>
</html>
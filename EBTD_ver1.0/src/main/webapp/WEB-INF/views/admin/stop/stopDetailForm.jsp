<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 정류장 관리</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
#stoptable {
	width: 500px;
	height: 400px;
	margin-left: auto;
	margin-right: auto;
	font-size: 18px;
}

#sNoinput {
	border: none;
	text-align: center;
}

#textbox {
	display: none;
	color: black;
	margin-top: 10px;
	margin-left: auto;
	margin-right: auto;
}

#commentvalue {
	width: 200px;
}

#main-container {
	position: absolute;
	left: 50%;
	transform: translate(-50%, 24%);
	color: black;
	width: 800px;
	text-align: center;
	font-size: 15px;
	padding-bottom: 140px;
}

.maindivinput {
	border: none;
	border-radius: 8px;
	text-align: center;
	width: 800px;
	background-color: pink;
	height: 50px;
	font-weight: bold;
	font-size: 20px;
}

#ondisplay { 
	text-align:center;
	background-color: lightgray;
	border-radius: 8px;
	border: none;
	margin: 10px;
	width: 100px;
	height: 40px;
}
#ondisplay:hover {
	background-color: gray;
}
</style>
</head>
<body>
<div id="adminheader"><%@ include file="/WEB-INF/views/include/adminheader.jsp" %></div>
<div id="adminfooter"><%@ include file="/WEB-INF/views/include/adminfooter.jsp" %></div>
<div id="main-container">
	<div><br><input type="text" class="maindivinput" value="정류장 전체 리스트" readonly><br></div><br>
	<form action="addStopComment">
		<table id="stoptable" border="1px solid black" style="color: black"></table>
	</form>
</div>
</body>
<script type="text/javascript">
console.log(${sList});
let i=0;
let str="<tr>"
	str+='<td style="width:160px">정류장 번호</td><td><input id="sNoinput" name="s_NO" readonly=true value='+${sList}[i]["s_NO"]+'></td>';
	str+="</tr>";
	str+="<tr>"
	str+='<td>동 이름</td><td>'+${sList}[i]["t_NAME"]+'</td>';
	str+="</tr>";
	str+="<tr>"
	str+='<td>정류장 이름</td><td>'+${sList}[i]["s_NAME"]+'</td>';
	str+="</tr>";
	str+="<tr>"
	str+='<td>위치</td><td>'+${sList}[i]["s_X"]+', '+${sList}[i]["s_Y"]+'</td>';
	str+="</tr>";
	str+="<tr>"
	str+='<td style="height:110px;">상세정보</td><td id="stopDetail">';
	if(${sList}[i]["s_DETAIL"] != null)	str += ${sList}[i]["s_DETAIL"];
	str+='<input id="ondisplay" type="button" value="수정하기">';
	str+='<div id ="textbox"><input id="commentvalue" name="S_DETAIL"><input type="submit" value="전송"></div>';
	str+="</td></tr>";
$("#stoptable").append(str); 

$(function() {
	$("#ondisplay").click(function () {
		if($("#textbox").css("display")=="none"){
			$("#textbox").show();
		}else{
			$("#textbox").hide();
		}
	});	
}); 
</script>
</html>
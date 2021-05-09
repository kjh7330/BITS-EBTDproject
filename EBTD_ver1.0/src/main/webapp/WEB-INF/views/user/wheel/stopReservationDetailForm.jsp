<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
#stoptitle{
	text-align: center;
	background-color: blue;
	height: 80px;
	padding-top: 10px;
}
#stopinfo{
	float : left;
	color: black;
	border: 1px solid black;
	width: 100%;
	font-size: 20px;
}
#s_name{
	text-align: center;
	font-size: 30px;
	background-color: blue;
	color : white;
	border: none;
}
#s_no{
	text-align: center;
	font-size: 18px;
	background-color: blue;
	color : white;
	border: none;
}
</style>
</head>
<body>

<div id="userheader"><%@ include file="/WEB-INF/views/include/userheader.jsp"%></div>

	<div id="stoptitle"></div>
	<div id="stopno"></div>
	<br>
	
	<table id="stopinfo" style="border: 1px solid black">
	</table>
	
<div id="userfooter"><%@ include file="/WEB-INF/views/include/userfooter.jsp"%></div>

</body>
<script type="text/javascript">
console.log(${brList})
$("<input id='s_name' readonly='readonly'>").appendTo("#stoptitle");
$("<input id='s_no' readonly='readonly'>").appendTo("#stoptitle");
$('#s_name').val(${brList}[0]["s_name"]);
$('#s_no').val("("+${brList}[0]["s_no"]+")");

let i=0;
let str='';
for (i; i<${brList}.length; i++){
	str+='<tr>';
	str+='<td class="info"><a href=/user/getBusDetail?b_No='+${brList}[i]["b_no"]+'>'
	str+=${brList}[i]["b_no"]+'</a></td>'	
	str+='</tr>'; 
};
$("#stopinfo").append(str);
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<div id="adminheader"><%@ include file="/WEB-INF/views/include/adminheader.jsp" %></div>
<div id="adminfooter"><%@ include file="/WEB-INF/views/include/adminfooter.jsp" %></div>

<table id="table1" border="1px solid black" style="color: black">
		
</table>

<form action="addStopForm"><input type="submit" value="정류장 등록"></form>
</body>
<script type="text/javascript">
console.log(${saList});
let i=0;
let str="<tr>"
for(i; i < ${saList}.length; i++){
	str+='<td><a href=/admin/stop/getStopConfirmDetail?sa_No='+${saList}[i]["sa_No"]+'>';
	str+=${saList}[i]['sa_Name']+'</a>';
	str+="</td>";
	str+="</tr>";
}
$("#table1").append(str); 
</script>
</html>
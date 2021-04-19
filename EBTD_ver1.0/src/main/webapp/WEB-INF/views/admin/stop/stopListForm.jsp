<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
#table1{
	width : 200px;
	height : 200px;
}
</style>
</head>
<body>
<div id="adminheader"><%@ include file="/WEB-INF/views/include/adminheader.jsp" %></div>
<div id="adminfooter"><%@ include file="/WEB-INF/views/include/adminfooter.jsp" %></div>

<table id="table1" border="1px solid black" style="color: black">
		
</table>
</body>

<script type="text/javascript">
console.log(${sList});
let i=0;
let str="<tr>"
for(i; i < ${sList}.length; i++){
	str+='<td><a href=/ebtd/ac/admin/stop/getStopDetail?s_No='+${sList}[i]["s_No"]+'>';
	str+=${sList}[i]['s_Name']+'</a>';
	str+="</td>";
	str+="</tr>";
}
$("#table1").append(str); 
</script>

</html>
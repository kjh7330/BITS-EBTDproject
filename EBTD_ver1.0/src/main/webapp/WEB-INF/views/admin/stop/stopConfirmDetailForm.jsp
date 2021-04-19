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

</body>
<script type="text/javascript">
console.log(${saList});
let i=0;
let str="<tr>"
	str+='<td>신청번호</td><td>'+${saList}[i]["sa_No"]+'</td>';
	str+="</tr>";
	str+="<tr>"
	str+='<td>x축</td><td>'+${saList}[i]["sa_X"]+'</td>';
	str+="</tr>";
	str+="<tr>"
	str+='<td>y축</td><td>'+${saList}[i]["sa_Y"]+'</td>';
	str+="</tr>";
	str+="<tr>"
	str+='<td>정류장 이름</td><td>'+${saList}[i]["sa_Name"]+'</td>';
	str+="</tr>";
	str+="<tr>"
	str+='<td>동 이름</td><td>'+${saList}[i]["t_Name"]+'</td>';
	str+="</tr>";
	str+="<tr>"
	str+='<td>신청 회사 이름</td><td id="Detail">'+${saList}[i]["c_UserName"]+'</td>';
	str+="</tr>";
	str+="<tr>"
	str+='<td>신청 사유</td><td id="Detail">'+${saList}[i]["sa_Reason"]+'</td>';
	str+="</tr>";
	str+="<tr>"
	str+='<td>상태</td><td id="Detail">'+${saList}[i]["sa_Status"]+'</td>';
	str+="</tr>";
$("#table1").append(str); 
</script>
</html>
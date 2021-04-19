<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
#table1{
	width : 500px;
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
	str+='<td>정류장 번호</td><td>'+${sList}[i]["s_No"]+'</td>';
	str+="</tr>";
	str+="<tr>"
	str+='<td>동 이름</td><td>'+${sList}[i]["t_Name"]+'</td>';
	str+="</tr>";
	str+="<tr>"
	str+='<td>정류장 이름</td><td>'+${sList}[i]["s_Name"]+'</td>';
	str+="</tr>";
	str+="<tr>"
	str+='<td>x축</td><td>'+${sList}[i]["s_X"]+'</td>';
	str+="</tr>";
	str+="<tr>"
	str+='<td>y축</td><td>'+${sList}[i]["s_Y"]+'</td>';
	str+="</tr>";
	str+="<tr>"
	str+='<td>상세정보</td><td id="Detail">'+${sList}[i]["s_Detail"]+'</td>';
	str+="</tr>";
	str+="<tr>"
	str+='<td colspan="2"><button onclick="comment()">등록 및 수정</button></td>';
	str+="</tr>";
$("#table1").append(str); 

function comment() {
	location.href='/ebtd/ac/admin/stop/getComment?s_No='+${sList}[0]["s_No"];
}
</script>
</html>
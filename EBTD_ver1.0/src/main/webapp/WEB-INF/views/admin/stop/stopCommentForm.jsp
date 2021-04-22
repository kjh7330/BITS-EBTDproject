<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
#stoptable{
	width : 500px;
	height : 200px;
	text-align: center;
}

#stoptable td{
	width: 250px;
}
</style>
</head>

<body>
<div id="adminheader"><%@ include file="/WEB-INF/views/include/adminheader.jsp" %></div>
<div id="adminfooter"><%@ include file="/WEB-INF/views/include/adminfooter.jsp" %></div>

<table id="stoptable" border="1px solid black" style="color: black">
</table>

</body>

<script type="text/javascript">
console.log(${sList});
let str="<tr>"
	str+='<td>정류장 이름</td><td>'+${sList}[0]["s_NAME"]+'</td>';
	str+="</tr>";
	str+="<tr>"
	str+='<td>상세정보</td><td><input type = "text"></td>';
	str+="</tr>";
	str+="<td colspan='2'><button>등록 및 수정</button></td>"	
$("#stoptable").append(str); 
</script>
</html>
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
#stoptable{
	width : 500px;
	height : 200px;
}
#textbox{
	display : none;
	border: 1px solid black;
	color : black;
	width : 500px;
}
#commentvalue{
	width : 400px;
}

</style>
</head>
<body>
<div id="adminheader"><%@ include file="/WEB-INF/views/include/adminheader.jsp" %></div>
<div id="adminfooter"><%@ include file="/WEB-INF/views/include/adminfooter.jsp" %></div>
<table id="stoptable" border="1px solid black" style="color: black">
</table>
<div id ="textbox">
<form action="addStopComment">
<input id="commentvalue" name="S_DETAIL">
<input type="submit" value="전송">
</form>
</div>
</body>
<script type="text/javascript">
console.log(${sList});
let i=0;
let str="<tr>"
	str+='<td>정류장 번호</td><td>'+${sList}[i]["s_NO"]+'</td>';
	str+="</tr>";
	str+="<tr>"
	str+='<td>동 이름</td><td>'+${sList}[i]["t_NAME"]+'</td>';
	str+="</tr>";
	str+="<tr>"
	str+='<td>정류장 이름</td><td>'+${sList}[i]["s_NAME"]+'</td>';
	str+="</tr>";
	str+="<tr>"
	str+='<td>x축</td><td>'+${sList}[i]["s_X"]+'</td>';
	str+="</tr>";
	str+="<tr>"
	str+='<td>y축</td><td>'+${sList}[i]["s_Y"]+'</td>';
	str+="</tr>";
	str+="<tr>"
	str+='<td>상세정보</td><td id="stopDetail">';
	if(${sList}[i]["s_DETAIL"] != null)	str += ${sList}[i]["s_DETAIL"];
	str+='<input id="ondisplay" type="button" value="수정하기"></td>';
	str+="</tr>";
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

/* $(function() {
	let value=$("#commentvalue").val();
	
	$("#submit").click(function (value) {
		if($("#stopDetail").val()==''){
			location.href = '/admin/stop/addStopComment?s_No='+${sList}[i]["s_NO"]+value;
		}else{
			location.href = '/admin/stop/updateComment?s_No='+${sList}[i]["s_NO"]+value;
		}
	});	
}); */
</script>
</html>
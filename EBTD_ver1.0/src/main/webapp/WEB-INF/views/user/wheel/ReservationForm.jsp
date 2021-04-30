<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ReservationForm</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<div id="userheader"><%@ include
			file="/WEB-INF/views/include/userheader.jsp"%></div>
	<input type="text" id="search">
	<div>
		<span><input type="button" id="bus" value="버스"> </span>
		<span><input type="button" id="stop" value="정류장"></span>
	</div>
	
	<table id="result">
	
	</table>	
	
			
	<div id="userfooter"><%@ include
			file="/WEB-INF/views/include/userfooter.jsp"%></div>
</body>


<script type="text/javascript">
console.log(${bList});
let i=0;
let str='';
for(i; i<${bList}.length; i++){
	str+='<tr class="line">';
	
	str+='<td class="busNo"><a href=/user/wheel/getBusDetail?s_No='+${bList}[i]["b_no"]+'>'
	str+=${sList}[i]['b_no']+'</a></td>'

	str+="</tr>";
};
$("#result").append(str); 

//정류장 검색기능
function filter(){
	let value/* 인풋창에 입력하는 데이터 */, busNo/* <td>클래스명 */, line/* <tr>클래스명 */, i;
	value = document.getElementById("value").value.toUpperCase();
	line = document.getElementsByClassName("line");
	for(i=0;i<line.length;i++){
  		busNo = line[i].getElementsByClassName("busNo");
	if(busNo[0].innerHTML.toUpperCase().indexOf(value) > -1){
 	    line[i].style.display='';
  	}else{
    line[i].style.display = "none";
 	 }
   }
} 
</script>
</html>
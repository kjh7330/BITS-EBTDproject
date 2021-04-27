<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
#stoptable{
	width : 100%;
	height : 200px;
}
td{
	text-align: center;
	}
</style>
<script type="text/javascript">

</script>
</head>
<body>
<div id="adminheader"><%@ include file="/WEB-INF/views/include/adminheader.jsp" %></div>
<div id="adminfooter"><%@ include file="/WEB-INF/views/include/adminfooter.jsp" %></div>

<div id="inputForm"><input type="text" id="value" placeholder="정류장을 검색하세요." onkeyup="filter()"/></div>

<br><br>

<table id="stoptable" style="color: black" border="1px solid black">
	<tr>
		<td>정류장 번호</td>
		<td>정류장 이름</td>
		<td>동 이름</td>	
	</tr>
</table>
</body>

<script type="text/javascript">
console.log(${sList});
let i=0;
let str='';
for(i; i<${sList}.length; i++){
	str+='<tr class="line">';
	
	str+='<td>'+${sList}[i]["s_NO"]+'</td>'
	
	str+='<td class="stopName"><a href=/admin/stop/getStopDetail?s_No='+${sList}[i]["s_NO"]+'>'
	str+=${sList}[i]['s_NAME']+'</a></td>'
	
	str+='<td>'+${sList}[i]["t_NAME"]+'</td>';
	
	str+="</tr>";
};
$("#stoptable").append(str); 

//정류장 검색기능
function filter(){
  let value/* 인풋창에 입력하는 데이터 */, stopName/* <td>클래스명 */, line/* <tr>클래스명 */, i;

  value = document.getElementById("value").value.toUpperCase();
  line = document.getElementsByClassName("line");

  for(i=0;i<line.length;i++){
    stopName = line[i].getElementsByClassName("stopName");
    if(stopName[0].innerHTML.toUpperCase().indexOf(value) > -1){
   	  line[i].style.display = "visible";
    }else{
      line[i].style.display = "none";
    }
  }
} 
</script>

</html>
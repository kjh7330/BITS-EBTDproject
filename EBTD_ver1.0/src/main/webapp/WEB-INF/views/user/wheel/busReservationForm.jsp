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
	<input type="text" id="search" onkeyup="filter()">
	<div>
		<span><input type="button" id="busBtn" value="버스"> </span>
		<span><input type="button" id="stopBtn" value="정류장"></span>
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
	
	str+='<td class="info"><a href=/user/getBusDetail?b_No='+${bList}[i]["b_no"]+'>'
	str+=${bList}[i]['b_no']+'</a></td>'

	str+="</tr>";
};
$("#result").append(str); 

//검색기능
function filter(){
	let value/* 인풋창에 입력하는 데이터 */, info/* <td>클래스명 */, line/* <tr>클래스명 */, i;
	value = document.getElementById("search").value.toUpperCase();
	line = document.getElementsByClassName("line");
	for(i=0;i<line.length;i++){
		info = line[i].getElementsByClassName("info");
	if(info[0].innerHTML.toUpperCase().indexOf(value) > -1){
 	    line[i].style.display='';
  	}else{
    	line[i].style.display = "none";
 	 }
   }
} 

$('#busBtn').click(function(){
		$.ajax({
			type : 'get',
			url : 'busList',
			success : function(data) {

				console.log("ajax통신 성공");
				let Obj = JSON.parse(data);	//문자열을 Json 객체로 변환
				console.log(Obj);
				$("#result").empty();
				str = '';
				for (let i = 0; i < Obj.length; i++){
					
					str+='<tr class="line">';
					
					str+='<td class="info"><a href=/user/getBusDetail?b_No='+Obj[i]["b_no"]+'>'
					
					str+=Obj[i]['b_no']+'</a></td>'

					str+="</tr>";
				};
				console.log(str);

				$("#result").append(str);
			},
			error : function(err) {
				console.log("err.status : ", err.status);
			}
		}); //ajax End
}); //on End 

$('#stopBtn').click(function(){
	$.ajax({
		type : 'get',
		url : 'stopList',
		success : function(data) {

			console.log("ajax통신 성공");
			let Obj = JSON.parse(data);	//문자열을 Json 객체로 변환
			console.log(Obj);
			$("#result").empty();
			str = '';
			for (let i = 0; i < Obj.length; i++){
				
				str+='<tr class="line">';
				
				str+='<td class="info"><a href=/user/getStopDetail?s_No='+Obj[i]["s_NO"]+'>'
				
				str+=Obj[i]['s_NAME']+'</a></td>'

				str+="</tr>";
			};

			$("#result").append(str);
		},
		error : function(err) {
			console.log("err.status : ", err.status);
		}
	}); //ajax End
}); //on End 


</script>
</html>
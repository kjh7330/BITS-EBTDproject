<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"   %> 
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<head>
<meta charset="UTF-8">
<title>회사 관리 페이지</title>

    <style>
		#main-container{
		    position: absolute;
            left: 50%;
            transform: translate(-50%,10%);
			color: black;
			width: 800px;
            text-align: center;
		}
		.maindivinput{
			border: none;
            border-radius: 8px;
            text-align: center;
            width: 800px;
            background-color: pink;
            height: 60px;
            font-weight: bold;
            font-size: 20px;
		}
		.maindivinput:focus{
			outline:none;
		}
		.maintableinput{
            border: none;
            border-radius: 8px;
            text-align: center;
            width: 798px;
            height: 40px;
            font-size: 18px;
		}
		.maintableinput:hover{
			background-color: #fe83ab;
		}
		.maintableinput:focus{
			outline:none;
		}
		#inputForm {
			text-align: right;	
		}

    </style>
</head>
<body>
<div id="adminheader"><%@ include file="/WEB-INF/views/include/adminheader.jsp" %></div>
	<div id="main-container">

		<div>
			<br> <input type="text" class="maindivinput" value="버스 회사 리스트"
				readonly> <br>
		</div>
		<br>
		<div id="inputForm">
			회사 이름 : 
			<input type="text" id="value" placeholder="검색어를 입력하세요."
				onkeyup="filter()" />
		</div>
		<br>
		<div class="maindivtable">
			<table id="stoptable" style="color: black">
			</table>
		</div>
	</div>
<script>

let i=0;
let str='';
for(i; i < ${cList}.length; i++){
	str+='<tr class="line">';
	str+='<td class="stopName"><a href=/admin/company/getCompanyDetail?c_username='+${cList}[i]["c_username"]+'>';
	str+='<input type="button" class="maintableinput" value="'+${cList}[i]['c_name']+'"readonly></a>';
	str+="</td>";
	str+="</tr>";
};
$("#stoptable").append(str); 

//정류장 검색기능
function filter(){
  let value/* 인풋창에 입력하는 데이터 */, stopName/* <tr>클래스명 */, line/* <td>클래스명 */, i;

  value = document.getElementById("value").value.toUpperCase();
  line = document.getElementsByClassName("line");

  for(i=0;i<line.length;i++){
    stopName = line[i].getElementsByClassName("stopName");
    if(stopName[0].innerHTML.toUpperCase().indexOf(value) > -1){
   	  line[i].style.display = "block";
    }else{
      line[i].style.display = "none";
    }
  }
} 

</script>
	<div id="adminfooter"><%@ include file="/WEB-INF/views/include/adminfooter.jsp" %></div>

</body>
</html>
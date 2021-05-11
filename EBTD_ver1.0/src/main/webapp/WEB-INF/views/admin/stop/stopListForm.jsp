<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 정류장 관리</title>
<style>
	#main-container{
		position: absolute;
        left: 50%;
        transform: translate(-50%,26%);
		color: black;
		width: 800px;
        text-align: center;
        font-size: 15px;
		padding-bottom: 140px;
	}
	.maindivinput{
		border: none;
        border-radius: 8px;
        text-align: center;
        width: 800px;
        background-color: pink;
        height: 50px;
        font-weight: bold;
        font-size: 20px;
	}
</style>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<body>
	<div id="adminheader"><%@ include
			file="/WEB-INF/views/include/adminheader.jsp"%>
	</div>
<div id="main-container">
		
	<div><br><input type="text" class="maindivinput" value="정류장 전체 리스트" readonly><br></div>
	
	<br>
	<table class="table table-striped" style="color: black">  
		<thead>
			<tr>
				<th>정류장 번호</th>
				<th>동 이름</th>
				<th>정류장 이름</th>
			</tr>
		</thead>
		<tbody id="stopList">
		</tbody>
	</table>
		<br>
		<div style="color: black; text-align: center">
			정류장 이름 검색 <input id="search" name="search" value = "${search}">
			<button id="searchStop">조회</button>
		</div>
	
		<div align="center">
		${paging}
		</div>

</div>

	<div id="adminfooter"><%@ include
			file="/WEB-INF/views/include/adminfooter.jsp"%>

</div>
</body>

<script src="http://code.jquery.com/jquery-latest.js">
</script>
<script type="text/javascript">
let sList = ${sList};
var html = '';

//console.log(sList);

 for(let i = 0 ; i<sList.length; i++){
	 html += '<tr>';
	 html += '<td>'+sList[i].s_NO+'</td>';
	 html += '<td>'+sList[i].t_NAME+'</td>';
	 html += '<td>'+'<a href=/admin/stop/getStopDetail?s_No='+sList[i].s_NO+'>';
	 html += sList[i].s_NAME+'</a>';
	 html += '</tr>';
	}
   
 $("#stopList").empty();
 $("#stopList").append(html);

//조회 버튼 클릭시 알림창 띄우고 해당 정류장 정보만 보여주기
	$('#searchStop').click(function () {
		location.href = "/admin/stop/getStopList?search="+$('#search').val();
	});

</script>
</html>
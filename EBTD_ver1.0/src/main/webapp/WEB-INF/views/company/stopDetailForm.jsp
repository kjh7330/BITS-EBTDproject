<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사 - 정류장 관리 페이지</title>
<style type="text/css">
.main-container {
	text-align: center;
	            width: 800px;
            color: black;
            left: 50%;
            padding-top:170px;
            margin-left: auto;
            margin-right: auto;
            padding-bottom: 140px;
}

.maininput {
	border: none;
	background-color: #b6e8fc;
	font-size: 20px;
	font-weight: bold;
	width: 800px;
	height: 50px;
	text-align: center;
	margin-bottom: 20px;
	border-radius: 10px;
}
#maintable{
	font-size: 18px;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<body>
<div>
	<div id="companyheader"><%@ include
			file="/WEB-INF/views/include/companyheader.jsp"%>
	</div>
<div class="main-container">
	<div><input class="maininput" value="정류장 상세 보기" readonly></div>

	<table id="maintable" class="table table-striped" style="color: black">
		<thead>
			<tr>
				<th>정류장 번호</th>
				<th>동 이름</th>
				<th>정류장 이름</th>
 				<th>X값</th>
				<th>Y값</th>
				<th>상세내용</th>
			</tr>
		</thead>
		<tbody id="stopDetail">
		</tbody>
	</table>

</div>

	<div id="companyfooter"><%@ include
			file="/WEB-INF/views/include/companyfooter.jsp"%>

	</div>
</div>
</body>

<script src="http://code.jquery.com/jquery-latest.js">
</script>
<script type="text/javascript">
let dList = ${dList};
var html = '';
console.log(dList);


 for(let i = 0 ; i<dList.length; i++){
	 html += '<tr>';
	 html += '<td>'+dList[i].s_NO+'</td>';
	 html += '<td>'+dList[i].t_NAME+'</td>';
	 html += '<td>'+dList[i].s_NAME+'</td>';
 	 html += '<td>'+dList[i].s_X+'</td>';
	 html += '<td>'+dList[i].s_Y+'</td>';
	 html += '<td>'+dList[i].s_DETAIL+'</td>'; 
	 html += '</tr>';
	}
   
 $("#stopDetail").empty();
 $("#stopDetail").append(html);

	
</script>
</html>
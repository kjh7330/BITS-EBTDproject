<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<body>
	<div id="companyheader"><%@ include
			file="/WEB-INF/views/include/companyheader.jsp"%>
	</div>
	
	
	<table class="table table-striped" style="color: black">
		<thead>
			<tr>
				<th>기사 번호</th>
				<th>회사 이름</th>
				<th>기사 이름</th>
				<th>이미지</th>
				<th>전화번호</th>
				<th>입사일</th>
				<th>버스번호</th>
			</tr>
		</thead>
		<tbody id="driverDetail">
		</tbody>
		<a href="/company/updateDriverForm">정보 수정하기</a>
	</table>

	

	<div id="companyfooter"><%@ include
			file="/WEB-INF/views/include/companyfooter.jsp"%>

	</div>
</body>
<script src="http://code.jquery.com/jquery-latest.js">
</script>
<script type="text/javascript">
let rList = ${rList};
var html = '';

console.log(rList);
//기사 상세정보 가져오기
 for(let i = 0 ; i<rList.length; i++){
	 
	 html += '<tr>';
	 html += '<td>'+rList[i].d_no+'</td>';
	 html += '<td>'+rList[i].c_userName+'</td>';
	 html += '<td>'+rList[i].d_name+'</td>';
	 html += '<td>'+rList[i].d_imgExtention+'</td>';
	 html += '<td>'+rList[i].d_phoneNum+'</td>';
	 html += '<td>'+rList[i].d_enterDate+'</td>';
	 html += '<td>'+rList[i].b_no+'</td>';
	 html += '</tr>';
	}
   
 $("#driverDetail").empty();
 $("#driverDetail").append(html);

</script>
</html>
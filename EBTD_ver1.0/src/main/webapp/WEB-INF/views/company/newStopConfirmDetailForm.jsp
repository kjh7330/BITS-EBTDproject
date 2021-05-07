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
				<th>신청 번호</th>
				<!-- <th>회사이름</th> -->
				<th>동 이름</th>
				<th>정류장 이름</th>
  				<th>X값</th>
				<th>Y값</th> 
				<th>신청사유</th> 
				<th>신청상태</th>
			</tr>
		</thead>
		<tbody id="newStopConfirmDeail">
		</tbody>
	</table>

	<div id="companyfooter"><%@ include
			file="/WEB-INF/views/include/companyfooter.jsp"%>

	</div>

</body>

<script src="http://code.jquery.com/jquery-latest.js">
</script>
<script type="text/javascript">
let aList = ${aList};
var html = '';
//정류장 신청 정보 가져오기
 for(let i = 0 ; i<aList.length; i++){
	 
	 html += '<tr>';
	 html += '<td>'+aList[i].sa_No+'</td>'; //신청 번호
	/*  html += '<td>'+aList[i].c_UserName+'</td>'; //회사 아이디 */
	 html += '<td>'+aList[i].t_Name+'</td>'; //동 이름
	 html += '<td>'+aList[i].sa_Name+'</td>'; //정류장 이름
	 html += '<td>'+aList[i].sa_X+'</td>'; //X값
	 html += '<td>'+aList[i].sa_Y+'</td>'; //Y값 
 	 html += '<td>'+aList[i].sa_Reason+'</td>'; //신청사유 
	 //신청상태(0, 1, 2, 3)에 따라 상태 나타내기
	 if(aList[i].sa_State==0) aList[i].sa_State='대기'; 
	 else if (aList[i].sa_State==1) aList[i].sa_State='승인';
	 else if (aList[i].sa_State==2) aList[i].sa_State='반려';
	 else if (aList[i].sa_State==3) aList[i].sa_State='수정';
	 html += '<td>'+aList[i].sa_State+'</td>';
	 html += '</tr>';

 }
 //$("#newStopConfirmDeail").empty();
 $("#newStopConfirmDeail").append(html);

 
 
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<div id="companyheader"><%@ include
			file="/WEB-INF/views/include/companyheader.jsp"%>
	</div>
<!-- <div style="color: black; text-align: center">
		정류장 번호 또는 이름 입력<br> <input id="search">&nbsp;
		정류장 정보 입력하는 input 박스
		<button onclick="searchStop()">조회</button>
	</div>
 -->
	<table style="color: black">
		<thead>
			<tr>
				<th>신청 번호</th>
				<th>회사이름</th>
				<th>동 이름</th>
				<th>정류장 이름</th>
<!--  				<th>X값</th>
				<th>Y값</th> 
				<th>신청사유</th> -->
				<th>신청상태</th>
			</tr>
		</thead>
		<tbody id="newStopConfirmList">
		</tbody>
	</table>

	<div id="companyfooter"><%@ include
			file="/WEB-INF/views/include/companyfooter.jsp"%>

	</div>

</body>

<script src="http://code.jquery.com/jquery-latest.js">
</script>
<script type="text/javascript">
let nList = ${nList};
var html = '';
//정류장 신청 정보 가져오기
 for(let i = 0 ; i<nList.length; i++){
	 
	 html += '<tr>';
	 html += '<td>'+nList[i].sa_No+'</td>'; //신청 번호
	 html += '<td>'+nList[i].c_UserName+'</td>'; //회사 아이디
	 html += '<td>'+nList[i].t_Name+'</td>'; //동 이름
	 html += '<td>'+nList[i].sa_Name+'</td>'; //정류장 이름
/* 	 html += '<td>'+nList[i].sa_X+'</td>'; //X값
	 html += '<td>'+nList[i].sa_Y+'</td>'; //Y값 */
/* 	 html += '<td>'+nList[i].sa_Reason+'</td>'; //신청사유 */
	 //신청상태(0, 1, 2, 3)에 따라 상태 나타내기
	 if(nList[i].sa_Status==0) nList[i].sa_Status='대기'; 
	 else if (nList[i].sa_Status==1) nList[i].sa_Status='승인';
	 else if (nList[i].sa_Status==2) nList[i].sa_Status='반려';
	 else if (nList[i].sa_Status==3) nList[i].sa_Status='수정';
	 html += '<td>'+'<a href=/company/getStopApplyDetail?sa_No='+nList[i].sa_No+'>';
	 html += nList[i].sa_Status+'</a>'; //신청 상태
	 html += '</tr>';

 }
 //$("#newStopConfirmList").empty();
 $("#newStopConfirmList").append(html);

 
 
</script>
</html>
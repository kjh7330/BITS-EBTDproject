<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<body>
	<div id="companyheader"><%@ include
			file="/WEB-INF/views/include/companyheader.jsp"%>
	</div>


	<table class="table table-striped" style="color: black">
		<thead>
			<tr>
				<th>기사 번호</th>
				<!-- <th>회사 이름</th> -->
				<th>기사 이름</th>
				<th>전화번호</th>
				<th>입사일</th>
				<th>노선번호</th>
				<th>수정하기</th>
				<th>삭제하기</th>
			</tr>
		</thead>
		<tbody id="driverList">
		</tbody>
	</table>



	<div id="companyfooter"><%@ include
			file="/WEB-INF/views/include/companyfooter.jsp"%>

	</div>
</body>
<script src="http://code.jquery.com/jquery-latest.js">
</script>
<script type="text/javascript">
var dList = ${dList};
var html = '';
//기사 정보 가져오기
 for(let i = 0 ; i<dList.length; i++){
	 html += '<tr>';
	 html += '<td>'+dList[i].d_no+'</td>';
//	 html += '<td>'+dList[i].c_userName+'</td>';
	 html += '<td>'+dList[i].d_name+'</td>';
	 html += '<td>'+dList[i].d_phoneNum+'</td>';
	 html += '<td>'+dList[i].d_enterDate+'</td>';
	 html += '<td>'+dList[i].b_no+'</td>';
	 html += '<td>'+'<a href=/company/getDriverDetail?d_no='+dList[i].d_no+'>';
	 html += "수정"+'</a>';
	//html += '<td>'+'<button id="deleteDriver" onclick="deleteDriver()">'+'삭제'+'</button>'+'</td>';
	 html += '<td>'+'<a id=delDriver href=/company/deleteDriver?d_no='+dList[i].d_no+'>';
 	// html += '<td>'+'<a id=deleteDriver href=#>';
	 html += "삭제"+'</a>';
	 html += '</tr>';
	}
   
 $("#driverList").empty();
 $("#driverList").append(html);
 
 //기사 삭제
  function deleteDriver(){
	
	 $.ajax({
			url : '/company/deleteDriver?d_no=' + "",
			type : 'post',
			dataType : 'json',
			success : function(data) {		
					console.log("기사 삭제 성공");
					}, error : function(err) {
							console.log("기사 삭제 실패");
						}
					}); //ajax End

 } 

</script>
</html>
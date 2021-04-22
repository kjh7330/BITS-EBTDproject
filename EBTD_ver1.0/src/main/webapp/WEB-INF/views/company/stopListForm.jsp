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

		<div style="color: black; text-align: center">
			정류장 이름 검색 <input id="search" name="search">
			<!-- <select>
				<option value="all">전체</option>
				<option value="stopNumber">정류장 번호</option>
				<option value="stopName">정류장 이름</option>
			</select> <input id="search" name="search">&nbsp; -->
			<button onclick="searchStop()">조회</button>
		</div>

	<table style="color: black">
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
		<tbody id="stopList">
		</tbody>
	</table>



	<div id="companyfooter"><%@ include
			file="/WEB-INF/views/include/companyfooter.jsp"%>

	</div>

</body>

<script src="http://code.jquery.com/jquery-latest.js">
</script>
<script type="text/javascript">
let sList = ${sList};
var html = '';
//console.log(sList);

//정류장 정보 가져오기
 for(let i = 0 ; i<sList.length; i++){
	 html += '<tr>';
	 html += '<td>'+sList[i].s_NO+'</td>';
	 html += '<td>'+sList[i].t_NAME+'</td>';
	 html += '<td>'+sList[i].s_NAME+'</td>';
	 html += '<td>'+sList[i].s_X+'</td>';
	 html += '<td>'+sList[i].s_Y+'</td>';
	 html += '<td>'+sList[i].s_DETAIL+'</td>';
	 html += '</tr>';
	}
   
 $("#stopList").empty();
 $("#stopList").append(html);

//조회 버튼 클릭시 알림창 띄우고 해당 정류장 정보만 보여주기
	
  	function searchStop() {
		var sValue = $('#search').val(); //input 박스 입력한 값
		alert(sValue + '정류장 정보 조회');
		
 		$.ajax({
			url : '/company/searchStop?S_NAME=' + sValue,     
			type : 'get',
			dataType : 'json',
			success : function(data) {
				alert('검색성공');
				var html = '';
				
				console.log(data);
				console.log(data[0].s_NO);
				console.log(data[0].t_NAME);
				//var obj = JSON.parse(data);
				//console.log(obj.s_NAME);
				for(let i = 0 ; i<data.length; i++){
					 html += '<tr>';
					 html += '<td>'+data[i].s_NO+'</td>';
					 html += '<td>'+data[i].t_NAME+'</td>';
					 html += '<td>'+data[i].s_NAME+'</td>';
					 html += '<td>'+data[i].s_X+'</td>';
					 html += '<td>'+data[i].s_Y+'</td>';
					 html += '<td>'+data[i].s_DETAIL+'</td>';
					 html += '</tr>';
					}
				   
				 $("#stopList").empty();
				 $("#stopList").append(html);
			},
			error : function(err) {
				alert('검색실패');
				console.log(err);
			}

		}); //ajax End  

	} //searhStop End  
	
</script>
</html>
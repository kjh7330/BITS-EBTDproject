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
<div>
	<div id="companyheader"><%@ include
			file="/WEB-INF/views/include/companyheader.jsp"%>
	</div>
		
		<form action="/company/getSearchStopList"></form>
		<div style="color: black; text-align: center">
			정류장 이름 검색 <input id="search" name="search" value = "${search}">
			<button id="searchStop">조회</button>
		</div>
	
		<div align="center">
		${paging}
		</div>
	
	
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



	<div id="companyfooter"><%@ include
			file="/WEB-INF/views/include/companyfooter.jsp"%>

	</div>
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
	 html += '<td>'+'<a href=/company/getStopDetail?S_NO='+sList[i].s_NO+'>';
	 html += sList[i].s_NAME+'</a>';
	 html += '</tr>';
	}
   
 $("#stopList").empty();
 $("#stopList").append(html);

//조회 버튼 클릭시 알림창 띄우고 해당 정류장 정보만 보여주기
	$('#searchStop').click(function () {
		location.href = "/company/getStopList?search="+$('#search').val();
	});


 	function searchStop() {
				
	
	var sValue = $('#search').val(); //input 박스 입력한 값
			alert(sValue + ' 관련 정류장 정보 조회');
			
	 		$.ajax({
				url : '/company/searchStop?S_NAME=' + sValue,     
				type : 'get',
				dataType : 'json',
				success : function(data) {
					//alert('검색성공');
					var html = '';
		
					for(let i = 0 ; i<data.length; i++){
						 html += '<tr>';
						 html += '<td>'+data[i].s_NO+'</td>';
						 html += '<td>'+data[i].t_NAME+'</td>';
						 html += '<td>'+'<a href=/company/getStopDetail?S_NO='+data[i].s_NO+'>';
						 html += data[i].s_NAME+'</a>';
						 html += '</tr>';
						}
					   
					 $("#stopList").empty();
					 $("#stopList").append(html);
				},
				error : function(err) {
					alert('관련 정류장이 없습니다');
					console.log(err);
				}

			}); //ajax End  

		} //searhStop End 

</script>
</html>
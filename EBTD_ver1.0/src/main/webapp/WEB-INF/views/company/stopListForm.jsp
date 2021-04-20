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
		정류장 번호 또는 이름 입력<br> <input id="search">&nbsp;
		<!-- 정류장 정보 입력하는 input 박스 -->
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
//정류장 정보 가져오기
 for(let i = 0 ; i<sList.length; i++){
	 html += '<tr>';
	 html += '<td>'+sList[i].s_no+'</td>';
	 html += '<td>'+sList[i].t_name+'</td>';
	 html += '<td>'+sList[i].s_name+'</td>';
	 html += '<td>'+sList[i].s_x+'</td>';
	 html += '<td>'+sList[i].s_y+'</td>';
	 html += '<td>'+sList[i].s_detail+'</td>';
	 html += '</tr>';
	}
   
 $("#stopList").empty();
 $("#stopList").append(html);

//조회 버튼 클릭시 알림창 띄우고 해당 정류장 정보만 보여주기

	function searchStop(){
		var sNum = $('#search').val(); //input 박스 입력한 값
      // location.reload(); //페이지 새로고침
      	alert(sNum +'번 정보');
       
       		
       	//$("#stopList").empty();
      	
      	//if(sNum==sList.s_no)
      	
       	 /* html += '<tr>';
    	 html += '<td>'+sList[i].s_no+'</td>';
    	 html += '<td>'+sList[i].s_no+'</td>';
    	 html += '<td>'+sList[i].s_no+'</td>';
    	 html += '<td>'+sList[i].s_no+'</td>';
    	 html += '<td>'+sList[i].s_y+'</td>';
    	 html += '<td>'+sList[i].s_detail+'</td>';
    	 html += '</tr>';
 */
       
       	//$("#stopList").append(html);

     } //searchStop End
 
</script>
</html>
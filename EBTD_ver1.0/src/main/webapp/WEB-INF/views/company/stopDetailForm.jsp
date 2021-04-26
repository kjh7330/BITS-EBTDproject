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
		<tbody id="stopDetail">
		</tbody>
	</table>



	<div id="companyfooter"><%@ include
			file="/WEB-INF/views/include/companyfooter.jsp"%>

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
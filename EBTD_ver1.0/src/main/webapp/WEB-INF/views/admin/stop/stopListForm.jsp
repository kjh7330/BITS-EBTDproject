<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
#stoptable {
	width: 99.9%;
	height: 200px;
	text-align: center;
}

th {
	width: 33.3%;
}

.stopName {
	width: 33.3%;
}
</style>

</head>
<body>
	<div id="adminheader"><%@ include
			file="/WEB-INF/views/include/adminheader.jsp"%></div>
	<div id="adminfooter"><%@ include
			file="/WEB-INF/views/include/adminfooter.jsp"%></div>

	<div id="inputForm">
		<input type="text" id="search" placeholder="정류장을 검색하세요." /><input id="searchBtn" type="button" value="검색">
	</div>

	<br>
	<br>

	<table id="stoptable" style="color: black" border="1px solid black">
		<thead>
			<tr>
				<th>정류장 번호</th>
				<th>정류장 이름</th>
				<th>동 이름</th>
			</tr>
		</thead>
		
		<tbody id="result">
		
		</tbody>
	</table>
	<br>
	<div align="center">${paging}</div>
</body>

<script type="text/javascript">
console.log(${sList});
let i=0;
let str='';
for(i; i<${sList}.length; i++){
	str+='<tr class="line">';
	
	str+='<td>'+${sList}[i]["s_NO"]+'</td>'
	
	str+='<td class="stopName"><a href=/admin/stop/getStopDetail?s_No='+${sList}[i]["s_NO"]+'>'
	str+=${sList}[i]['s_NAME']+'</a></td>'
	
	str+='<td>'+${sList}[i]["t_NAME"]+'</td>';
	
	str+="</tr>";
};
$("#result").append(str); 


//검색기능 작업중입니다.

$('#searchBtn').click(function(){
	str = '';			
	//입력받은 userName
	let search = $('#search').val();
	console.log( search );
	if(search != ''){
		$('#result').html('');
		// 입력된 값이 있으면 비동기로 입력된 조건으로 데이터 가지러?
		$.ajax({
			url: '/admin/stop/search?search='+search,
					type: 'Get',
					success: function(data){
						console.log("ajax통신 성공 - 아이디");
						let Obj = JSON.parse(data);	//문자열을 Json 객체로 변환
						console.log(Obj);
						
						for (let i = 0; i < Obj.length; i++){
							str += '<tr>';
							//정류장 번호
							str+='<td>'+${sList}[i]["s_NO"]+'</td>'
							//정류장 이름
							str+='<td><a href=/admin/stop/getStopDetail?s_No='+${sList}[i]["s_NO"]+'>'
							str+=${sList}[i]['s_NAME']+'</a></td>'
							//동 이름
							str+='<td>'+${sList}[i]["t_NAME"]+'</td>';
							str += "</tr>";
							
							$("#result").empty();	
							$("#result").append(str);
						}	
					},
					fail: function(err){
						console.log(err);
					}
				});
			}
		}); 
</script>

</html>
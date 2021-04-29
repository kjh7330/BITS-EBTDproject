<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
#stoptable{
	width : 99.9%;
	height : 200px;
	text-align: center;
}
th{
	width: 33.3%;
	}
.stopName{
	width : 33.3%;
}
</style>

</head>
<body>
<div id="adminheader"><%@ include file="/WEB-INF/views/include/adminheader.jsp" %></div>
<div id="adminfooter"><%@ include file="/WEB-INF/views/include/adminfooter.jsp" %></div>

<div id="inputForm"><input type="text" id="search" placeholder="정류장을 검색하세요."/></div>

<br><br>

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
	
	<!-- 페이징 -->
	<br><div align="center">${paging}</div>
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
$("#stoptable").append(str); 

//정류장 검색기능
//function filter(){
//  let value/* 인풋창에 입력하는 데이터 */, stopName/* <td>클래스명 */, line/* <tr>클래스명 */, i;
//  value = document.getElementById("value").value.toUpperCase();
//  line = document.getElementsByClassName("line");
//   for(i=0;i<line.length;i++){
//    stopName = line[i].getElementsByClassName("stopName");
//    if(stopName[0].innerHTML.toUpperCase().indexOf(value) > -1){
//   	  line[i].style.display='';
//    }else{
//      line[i].style.display = "none";
//    }
//  }
//} 

//검색기능 작업중입니다.

/* $('#searchBtn').click(function(){
	str = '';			
	//입력받은 userName
	let inputUserName = $('#secrchInputUserName').val();
	console.log( inputUserName );
	//만약 입력된 값이 없으면
	if(inputUserName == ''){
		alert("아이디를 입력해주세요.");
			}else{
				
				$('#result').html('');
				// 입력된 값이 있으면 비동기로 입력된 조건으로 데이터 가지러?
				$.ajax({
					url: '/admin/user/getUserSearchUserName?u_userName='+inputUserName,
					type: 'Get',
					success: function(data){
						console.log("ajax통신 성공 - 아이디");
						let Obj = JSON.parse(data);	//문자열을 Json 객체로 변환
						console.log(Obj);
						
						for (let i = 0; i < Obj.length; i++){
							//0,1을 --> 휠체어, 시각으로 바꾸어 출력
							if (Obj[i].u_type == 0) {
								Obj[i].u_type = '휠체어';
							} else Obj[i].u_type = '시각';	
							console.log(Obj[i].u_type);
				
							str += '<tr>';
							str += '<th>' + (i + 1) + '</th>'
							//아이디
							str += '<td><a href="/admin/user/getUserDetail?u_userName=' + Obj[i].u_userName + '">'+Obj[i].u_userName+'</a></td>';
							//이름
							str += '<td>' + Obj[i].u_name + '</td>';
							//장애유형
							str += '<td>' + Obj[i].u_type + '</td>';
							//주소
							str += '<td>' + Obj[i].u_address + '</td>';
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
		}); */
</script>

</html>
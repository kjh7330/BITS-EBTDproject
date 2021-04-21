<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 김아름 -->
<title>관리자 - 이용자 보기</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
 
#selectSortDetail {
	display: none
}

#searchInput{
	display: none
}
</style>
</head>
<body>
	<div id="adminheader"><%@ include
			file="/WEB-INF/views/include/adminheader.jsp"%></div>

	<div style="color: black">
		<br> 정렬:<select id="selectSort">
			<option>전체</option>
			<option id="u_type">장애유형</option>
			<option id="u_id">아이디</option>
		</select>

		<!-- selectSort에서 장애유형 선택하면 얘네 선택할수있게 -->
		<div id="selectSortDetail">
			상세:<select>
				<option>시각</option>
				<option>휠체어</option>
			</select>
		</div>

		<!-- 아이디 선택하면 검색할수있게 -->
		<div id="searchInput">
		아이디를 입력하세요: <input type="text">
		<button id="searchBtn">검색</button>
		</div>
		
		<br>
	</div>

	<!-- 부트스트랩 -->
	<table class="table table-sm">
		<thead>
			<tr>
				<!--이용자아이디 누르면 이용자 상세정보 띄우기-->
				<th scope="col">NO</th>
				<th scope="col">아이디</th>
				<th scope="col">이름</th>
				<th scope="col">장애유형</th>
				<th scope="col">주소</th>
			</tr>
		</thead>
		<tbody id="result">
		</tbody>

	</table>

	<script type="text/javascript">
			let uList = ${uList};
			let str = "";
			console.log(uList[0].u_userName);

			for (let i = 0; i < uList.length; i++) {
				//0,1을 --> 휠체어, 시각으로 바꾸어 출력
				if (uList[i].u_type == 0) {
					uList[i].u_type = '시각';
				} else uList[i].u_type = '휠체어';
	
				str += '<tr>';
				str += '<th>' + (i+1) + '</th>'
				//아이디
				str += '<td><a href="/admin/user/getUserDetail?u_userName=' + uList[i].u_userName + '">'+uList[i].u_userName+'</a></td>';
				//이름
				str += '<td>' + uList[i].u_name + '</td>';
				//장애유형
				str += '<td>' + uList[i].u_type + '</td>';
				//주소
				str += '<td>' + uList[i].u_address + '</td>';
				str += "</tr>";
			}
			$("#result").empty();
			$("#result").append(str);
			
			
			//정렬에서 장애유형 선택하면 정렬상세에 시각이랑,휠체어 선택할수 있게 띄워줘야 함
			let selectUType = $($('#u_type')).val();
			console.log(selectUTyle);
			if(selectUType =='장애유형'){
				$('#selectSortDetail').show();
			}else{
				$('#selectSortDetail').hide();
			}
			
			
			//정렬에서 아이디 클릭하면 검색창띄워줘야 함
			
			
			//검색버튼 누르면
			$('#searchBtn').click(function(){
				//입력받은 ID
				let inputId = $('#searchInput').val();
				console.log( inputId );
				/* 
				if(inputId == ''){
					alert("아이디를 입력해주세요.");
				}else if(){
					
				} */
			});
		</script>

	<div id="adminfooter"><%@ include
			file="/WEB-INF/views/include/adminfooter.jsp"%></div>
</body>


</html>
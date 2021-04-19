<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 김아름 -->
<title>관리자 - 이용자 히스토리 보기</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
</style>
</head>
<body>
	<div id="adminheader"><%@ include
			file="/WEB-INF/views/include/adminheader.jsp"%></div>

	버스회사, 버스번호, 출발지, 목적지, 탑승시간, 하차시간, 이용일, 유저아이디, 장애유형
	<!-- id 입력하고 검색버튼 누르면 출력.. -->
	<div style="color: black">
		아이디를 입력하세요: <input type="text" id="searchInput">
		<button id="searchBtn">검색</button>
		<br>
	</div>
	<div>
		<br> 정렬:<select id="selectSort">
			<option>전체</option>
			<option>버스회사</option>
			<option>버스번호</option>
			<option>출발지</option>
			<option>목적지</option>
			<option>장애유형</option>	
		</select>
	</div>
	<!-- 정렬상세:<select>
		<option disabled>시각</option>
		<option disabled>휠체어</option>
		</select> -->

	<!-- 부트스트랩 -->
	<table class="table table-sm">
		<thead>
			<tr>
				<!-- 리스트 띄운 다음에 이용자아이디 누르면 이용자 상세정보 띄우기-->
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
			let urhList = ${urhList};
			let str = "";

			for (let i = 0; i < urhList.length; i++) {
				//0,1을 --> 휠체어, 시각으로 바꾸어 출력
				if (urhList[i].u_type == 0) {
					urhList[i].u_type = '시각';
				} else urhList[i].u_type = '휠체어';
	
				str += '<tr>';
				str += '<th>' + (i+1) + '</th>'
				//아이디
				str += '<td><a href="#">' + urhList[i].u_userName + '</a></td>';
				//이름
				str += '<td>' + urhList[i].u_name + '</td>';
				//장애유형
				str += '<td>' + urhList[i].u_type + '</td>';
				//주소
				str += '<td>' + urhList[i].u_address + '</td>';
				str += "</tr>";
			}
			$("#result").empty();
			$("#result").append(str);
			
			
			//검색버튼 누르면
			$('#searchBtn').click(function(){
				//입력받은 ID
				let inputId = $('#searchInput').val();
				console.log( inpytId );
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
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

	<div style="color: black">
		<br> 정렬:<select id="selectSort">
			<option>전체</option>
			<option>이용일</option>
			<option>버스회사</option>
			<option>버스번호</option>
			<option>출발지</option>
			<option>목적지</option>
			<option>장애유형</option>	
			<option>아이디</option>	
		</select>
		
		<!-- selectSort에서 선택하면 그거에 맞춰서 선택할수있게 -->
		상세:<select id="selectSortDetail">
			<!-- 이용일 -->
			<option>1주일</option>
			<option>1개월</option>
			<option>3개월</option>
			<option>6개월</option>
			<option>1년</option>
			<!-- 장애유형 -->
			<option>시각</option>
			<option>휠체어</option>
			
		</select> 
		<!-- 버스회사 버스번호 버스정류장 아이디 -->
		아이디를 입력하세요: <input type="text" id="searchInput">
		<button id="searchBtn">검색</button>
	</div>


	<!-- 부트스트랩 -->
	<table class="table table-sm">
		<thead>
			<tr>
				<!--이용자아이디 누르면 이용자 상세정보 띄우기-->
				<th scope="col">NO</th>
				<th scope="col">이용일</th>
				<th scope="col">버스번호</th>
				<th scope="col">버스회사</th>
				<th scope="col">출발지</th>
				<th scope="col">목적지</th>
				<th scope="col">장애유형</th>
				<th scope="col">유저아이디</th>
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
				//NO
				str += '<th>' + (i+1) + '</th>'
				//이용일
				str += '<td>' + urhList[i].urh_date + '</td>';
				//버스번호
				str += '<td>' + urhList[i].b_no + '</td>';
				//버스회사 
				str += '<td>' + urhList[i].c_userName + '</td>';
				//출발지
				str += '<td>' + urhList[i].s_nostart + '</td>';
				//목적지
				str += '<td>' + urhList[i].s_nolast + '</td>';
				//장애유형
				str += '<td>' + urhList[i].u_type + '</td>';
				//아이디
				str += '<td><a href="#">' + urhList[i].u_userName + '</a></td>';
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
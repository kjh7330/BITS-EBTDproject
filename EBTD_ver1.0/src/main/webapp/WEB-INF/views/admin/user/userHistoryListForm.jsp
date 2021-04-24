<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 김아름 -->
<title>관리자 - 이용자 히스토리 보기</title>
<style>
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
</style>
</head>
<body>
	<div id="adminheader"><%@ include
			file="/WEB-INF/views/include/adminheader.jsp"%></div>

	<!-- 정렬에서 이용일, 장애유형 선택하면 상세에 그에 맞는 정보 선택가능하게 하기 -->
	<div style="color: black">
		<br> 정렬:<select id="selectSort" onchange="categoryChange(this);">
			<option value="1">정렬기준을 선택해주세요</option>
			<option value="2">이용일</option>
			<option value="3">장애유형</option>	
			<option value="4">아이디</option>
			<option value="5">버스회사</option>
			<option value="6">버스번호</option>
			<option value="7">출발지</option>
			<option value="8">목적지</option>
		</select>
		
		<!-- selectSort에서 선택하면 그거에 맞춰서 선택할수있게 -->
		상세:<select id="selectSortDetail" name="selectSortDetail" style="width:120px; display:none">	
		</select> 
		<!-- 버스회사 버스번호 버스정류장 아이디 -->
		아이디를 입력하세요: <input type="text" id="searchInput" style="width:120px; display:none">
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
		<tbody id="userHistoryList">
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
				str += '<td><a href="/admin/user/getUserDetail?u_userName=' + urhList[i].u_userName + '">'+urhList[i].u_userName+'</a></td>';

			}
			$("#userHistoryList").empty();
			$("#userHistoryList").append(str);
			
			
			//selectbox
			function categoryChange(e){
				
				let detail_period = ["1주일", "1개월", "3개월", "6개월", "1년"];
				let u_type = ["시각", "휠체어"];
				let target = document.getElementById("selectSortDetail");
				
				$('#selectSortDetail').html("");
				
				if(e.value == "2"){		//이용일
					let detail = detail_period;
					
					for (let x in detail) {
						let opt = document.createElement("option");
						opt.value = detail[x];
						opt.innerHTML = detail[x];
						target.appendChild(opt);
					}	
				}
				if(e.value == "3"){ 		//장애유형
					let detail = u_type;
					
					for (let x in detail) {
						let opt = document.createElement("option");
						opt.value = detail[x];
						opt.innerHTML = detail[x];
						target.appendChild(opt);
					}	
				}
				$('#selectSortDetail').show();

			} //function categoryChange end 
			
			
			
			
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
			}); //searchBtn click end
		</script>


	<div id="adminfooter"><%@ include
			file="/WEB-INF/views/include/adminfooter.jsp"%></div>
</body>
</html>
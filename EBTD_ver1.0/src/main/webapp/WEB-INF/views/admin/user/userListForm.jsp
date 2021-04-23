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

#searchInput {
	display: none
}
</style>
</head>
<body>
	<div id="adminheader"><%@ include
			file="/WEB-INF/views/include/adminheader.jsp"%></div>

	<div style="color: black">
		<br> 정렬:<select id="selectSort" onchange="selectSortClick(this)">
			<option>정렬기준을 선택해주세요</option>
			<option id="u_type">장애유형</option>
			<option id="u_id">아이디</option>
		</select>

		<!-- 정렬에서 장애유형 선택하면 시각/휠체어 선택할수 있게 -->
		<div id="selectSortDetail">
			상세:<select id="selectSortUType">
					<option class="selectType">장애유형을 선택해주세요</option>
					<option id="blind" class="selectType">시각</option>
					<option id="wheel" class="selectType">휠체어</option>
				</select>
		</div>

		<!-- 아이디 선택하면 검색할수있게 -->
		<div id="searchInput">
			아이디를 입력하세요: <input type="text" id="secrchInputUserName">
			<button id="searchBtn">검색</button>
		</div>

		<br>
	</div>

	<!-- 부트스트랩 테이블 -->
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
		//이용자 리스트 출력
		let uList = ${uList};
		let str = "";
		//console.log(uList[0].u_userName);

		for (let i = 0; i < uList.length; i++) {
			//0,1을 --> 휠체어, 시각으로 바꾸어 출력
			if (uList[i].u_type == 0) {
				uList[i].u_type = '시각';
			} else
				uList[i].u_type = '휠체어';

			str += '<tr>';
			str += '<th>' + (i + 1) + '</th>'
			//아이디
			str += '<td><a href="/admin/user/getUserDetail?u_userName='
					+ uList[i].u_userName + '">' + uList[i].u_userName
					+ '</a></td>';
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

		//정렬에서 장애유형 클릭하면 상세에 시각이랑,휠체어 선택할수 있게 셀렉박스 띄워주기
		function selectSortClick(e) {
			//let selectUType = $('#u_type').val();
			//console.log(selectUType);	//장애유형

			//만약 정렬에 장애유형을 클릭했다면
			//밸류가 장애유형이면 인데, 왜 맞게 작동할까...?
			if (e.value == '장애유형') {
				//상세를 보여줘라
				$('#selectSortDetail').show();
			} else {
				$('#selectSortDetail').hide();
			}

			//정렬에서 아이디 클릭하면 아이디 검색창 띄워주기
			if (e.value == '아이디') {
				//상세를 보여줘라
				$('#searchInput').show();
			} else {
				$('#searchInput').hide();
			}
		} //selectSortClick end

		
		//정렬상세에서 시각or휠체어 클릭하면 --> ajax 사용
		$('#selectSortUType').change(function(){
			
			let selectSortUType = $('#selectSortUType').val();
			console.log(selectSortUType);
			
			//장애유형을 선택해주세요를 선택한 경우
			if( selectSortUType == "장애유형을 선택해주세요" ){
				alert("장애유형을 선택해주세요");
				
			//시각이나 휠체어를 선택한 경우
			}else if( selectSortUType == "시각" || selectSortUType == "휠체어" ){
				$.ajax({
					url: '/admin/user/getUserSearchUType='+selectSortUType, //필수입력값
					type: 'Get',
					dataType: 'json', //통신 결과로 넘어올 데이터 종류
					success: function(data){ //통신 성공시 호출해야하는 함수 지정
						let Obj = JSON.parse(data);	//문자열을 Json 객체로 변환
						console.log(Obj);
						
						for (let i = 0; i < Obj.length; i++){
							//0,1을 --> 휠체어, 시각으로 바꾸어 출력
							if (Obj[i].u_type == 0) {
								Obj[i].u_type = '시각';
							} else Obj[i].u_type = '휠체어';	
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
					
				});	//ajax end 
			}	//if end
			
		}); //시각or휠체어 change end
	 
		
		//아이디 검색버튼 누르면 --> ajax 사용
		$('#searchBtn').click(function(){
			
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
						
						let Obj = JSON.parse(data);	//문자열을 Json 객체로 변환
						console.log(Obj);
						
						for (let i = 0; i < Obj.length; i++){
							//0,1을 --> 휠체어, 시각으로 바꾸어 출력
							if (Obj[i].u_type == 0) {
								Obj[i].u_type = '시각';
							} else Obj[i].u_type = '휠체어';	
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
				}); //ajax end
			} //if문 end
			
		}); //아이디 검색 버튼 click end
		 
	</script>

	<div id="adminfooter"><%@ include
			file="/WEB-INF/views/include/adminfooter.jsp"%></div>
</body>


</html>
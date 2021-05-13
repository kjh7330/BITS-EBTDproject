<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 김아름 -->
<title>관리자 - 이용자 관리 페이지</title>
<style>
.maininput {
	border: none;
	background-color: skyblue;
	font-size: 20px;
	font-weight: bold;
	width: 800px;
	height: 50px;
	text-align: center;
	margin-bottom: 20px;
	border-radius: 10px;
	margin-left: 100px;
}

.maininput:focus {
	outline: none;
}

.maindiv {
	width: 1000px;
	font-size: 15px;
	color: black;
	left: 50%;
	padding-top: 170px;
	margin-left: auto;
	margin-right: auto;
	padding-bottom: 140px;
}
.arrow {
	border: 1px solid black;
	height: 35px;
	margin-bottom: 10px;
}
.arrow:hover {
	border: 1px solid #aaa;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
</style>
</head>
<body>
	<div id="adminheader"><%@ include
			file="/WEB-INF/views/include/adminheader.jsp"%></div>
	<div class="maindiv">
	<div>
	<input class="maininput" value="이용자 전체 히스토리" readonly>	</div>
	<!-- 정렬에서 이용일, 장애유형 선택하면 상세에 그에 맞는 정보 선택가능하게 하기 -->
	<div style="color: black">
		<br> <a style="margin-left:250px;">정렬:</a>&nbsp;<select class="arrow" id="selectSort" onchange="categoryChange(this)">
			<option value="1">정렬기준을 선택해주세요</option>
			<option value="2">이용일</option>
			<option value="3">장애유형</option>	
			<option value="4">아이디</option>
			<option value="5">버스회사</option>
			<option value="6">버스번호</option>
			<option value="7">출발지</option>
			<option value="8">목적지</option>
			<option value="9">이용상태</option>
		</select>
		
		<!-- selectSort에서 선택하면 그거에 맞춰서 선택할수있게 -->
		&nbsp;&nbsp;상세:&nbsp;<select class="arrow" id="selectSortDetail" name="selectSortDetail" style="display:none">	
		</select> 
		<!-- 버스회사 버스번호 버스정류장 아이디 -->
		<input type="text" id="searchInput" style="width:220px; display:none" placeholder="">
		<button id="searchBtn" style="display:none">검색</button>
	</div>

	<!-- 부트스트랩 -->
	<table class="table table-sm">
		<thead>
			<tr>
				<!--이용자아이디 누르면 이용자 상세정보 띄우기-->
				<th scope="col" style="width:30px;">NO</th>
				<th scope="col" style="width:80px;">예약번호</th>
				<th scope="col" style="width:160px;">이용일</th>
				<th scope="col" style="width:80px;">버스번호</th>
				<th scope="col" style="width:80px;">버스회사</th>
				<th scope="col">출발지</th>
				<th scope="col">목적지</th>
				<th scope="col" style="width:80px;">장애유형</th>
				<th scope="col" style="width:90px;">유저아이디</th>
				<th scope="col" style="width:80px;">이용상태</th>
			</tr>
		</thead>
		<tbody id="userHistoryList">
		</tbody>

	</table>
</div>
	<script type="text/javascript">
			let urhList = ${urhList};
			let str = "";
			//이용자 전체 히스토리 출력
			for (let i = 0; i < urhList.length; i++) {
				
				//0,1을 --> 휠체어, 시각으로 바꾸어 출력
				if (urhList[i].u_type == 0) {
					urhList[i].u_type = '휠체어';
				} else urhList[i].u_type = '시각';
				
				//현 이용상태(0:예약중, 1:탑승중, 2:취소, 3:완료)
				if (urhList[i].ur_state == 2) {
					urhList[i].ur_state = '취소';
				} else if(urhList[i].ur_state == 3){
					urhList[i].ur_state = '완료';
				}else if(urhList[i].ur_state == 0){
					urhList[i].ur_state = '예약중'
				}else if(urhList[i].ur_state == 1){
					urhList[i].ur_state = '탑승중'
				}
	
				str += '<tr>';
				str += '<th>' + (i+1) + '</th>' //NO
				str += '<td>' + urhList[i].ur_no + '</td>'; //예약번호
				str += '<td>' + urhList[i].ur_date + '</td>'; //이용일
				str += '<td>' + urhList[i].b_no + '</td>'; //버스번호	
				str += '<td><a href="/admin/company/getCompanyDetail?c_username='+urhList[i].c_username+'">'+urhList[i].c_username+'</a></td>'; 	
				str += '<td><a href="/admin/stop/getStopDetail?s_No='+urhList[i].s_nostart+'">' + urhList[i].s_namestart + '</a></td>'; //출발지	
				str += '<td><a href="/admin/stop/getStopDetail?s_No='+urhList[i].s_nolast+'">' + urhList[i].s_namelast + '</a></td>'; //도착지	
				str += '<td>' + urhList[i].u_type + '</td>'; //장애유형
				//아이디
				str += '<td><a href="/admin/user/getUserDetail?u_userName=' + urhList[i].u_userName + '">'+urhList[i].u_userName+'</a></td>';
				str += '<td>' + urhList[i].ur_state + '</td>';		 //이용상태	
			}
			$("#userHistoryList").empty();
			$("#userHistoryList").append(str);
			
		
			//selectbox click event
			function categoryChange(e){
				
				let detail_period = ["조회기간을 선택해주세요","1주일", "1개월", "3개월", "6개월", "1년"];
				let u_type = ["장애유형을 선택해주세요","시각", "휠체어"];
				let u_state = ["이용상태를 선택해주세요","예약중", "탑승중", "예약취소", "완료"];
				let targetSelect = document.getElementById("selectSortDetail");
				
				$('#selectSortDetail').html("");
				
				if(e.value == "2"){		//이용일
					let detail = detail_period;
					
					for (let index in detail) {
						let opt = document.createElement("option");
						opt.value = detail[index];
						opt.innerHTML = detail[index];
						targetSelect.appendChild(opt);
						$('#selectSortDetail').show();
						$('#searchInput').hide();
						$('#searchBtn').hide();
					}	
				}
				if(e.value == "3"){ 		//장애유형
					let detail = u_type;
					
					for (let index in detail) {
						let opt = document.createElement("option");
						opt.value = detail[index];
						opt.innerHTML = detail[index];
						targetSelect.appendChild(opt);
						$('#selectSortDetail').show();
						$('#searchInput').hide();
						$('#searchBtn').hide();
					}	
				}
				if(e.value == "9"){ 		//이용상태
					let detail = u_state;
					
					for (let index in detail) {
						let opt = document.createElement("option");
						opt.value = detail[index];
						opt.innerHTML = detail[index];
						targetSelect.appendChild(opt);
						$('#selectSortDetail').show();
						$('#searchInput').hide();
						$('#searchBtn').hide();
					}	
				}
				
				//click event 인풋박스 생기게
				let targetInput = document.getElementById("searchInput");
				
				if(e.value == "4"){		//아이디
					$('#searchInput').val("");
					$('#searchInput').focus();
					$('#searchInput').attr("placeholder","아이디를 입력해주세요");
					$('#searchInput').show();
					$('#selectSortDetail').hide();
				}
				if(e.value == "5"){		//버스회사
					$('#searchInput').val("");
					$('#searchInput').focus();
					$('#searchInput').attr("placeholder","버스회사명을 입력해주세요");
					$('#searchInput').show();
					$('#selectSortDetail').hide();
				}
				if(e.value == "6"){		//버스번호
					$('#searchInput').val("");
					$('#searchInput').focus();
					$('#searchInput').attr("placeholder","버스번호를 입력해주세요");
					$('#searchInput').show();
					$('#selectSortDetail').hide();
				}
				if(e.value == "7"){		//출발지
					$('#searchInput').val("");
					$('#searchInput').focus();
					$('#searchInput').attr("placeholder","출발지를 입력해주세요");
					$('#searchInput').show();
					$('#selectSortDetail').hide();
				}
				if(e.value == "8"){		//목적지
					$('#searchInput').val("");
					$('#searchInput').focus();
					$('#searchInput').attr("placeholder","목적지를 입력해주세요");
					$('#searchInput').show();
					$('#selectSortDetail').hide();
				}
			} //function categoryChange end 
			
			//인풋창에 검색할거 치면
			$('#searchInput').on("change keyup paste", function(){
				$('#searchBtn').show();
			}); //searchInput keyup end
			
			//상세 클릭값 바뀌면
			$('#selectSortDetail').change(function(){
				var val = $('#selectSortDetail option:selected').val();

				switch(val){
					case "시각":
						search_u_type(1);
						break;
						
					case "휠체어":
						search_u_type(0);
						break;
					
					case "1주일":
						date_search("1주일");
						break;
					case "1개월":
						date_serch("1개월");
						break;
					case "3개월":
						date_search("3개월");
						break;
					case "6개월":
						date_search("6개월");
						break;
					case "1년":
						date_search("1년");
						break;
						
					case "예약중":
						state_search(0);
						break;
					case "탑승중":
						state_search(1);
						break;
					case "예약취소":
						state_search(2);
						break;
					case "완료":
						state_search(3);
						break;
				}	//switch end
				
			}); //selectSortDetail change end
			
			function search_u_type(u_type){
				$.ajax({
					url : "/admin/user/getHistorySearchUType",
					data : { 'u_type' : u_type },
					dataType : 'json',
				}).done(function (data) {
					console.log(data);
					let urhList = data;
					let str = "";
					
					for (let i = 0; i < urhList.length; i++) {
						//0,1을 --> 휠체어, 시각으로 바꾸어 출력
						if (urhList[i].u_type == 0) {
							urhList[i].u_type = '휠체어';
						} else urhList[i].u_type = '시각';
						
						//현 이용상태(0:예약중, 1:탑승중, 2:취소, 3:완료)
						if (urhList[i].ur_state == 2) {
							urhList[i].ur_state = '취소';
						} else if(urhList[i].ur_state == 3){
							urhList[i].ur_state = '완료';
						}else if(urhList[i].ur_state == 0){
							urhList[i].ur_state = '예약중'
						}else if(urhList[i].ur_state == 1){
							urhList[i].ur_state = '탑승중'
						}
			
						str += '<tr>';
						str += '<th>' + (i+1) + '</th>' //NO
						str += '<td>' + urhList[i].ur_no + '</td>';  //예약번호
						str += '<td>' + urhList[i].ur_date + '</td>'; //이용일
						str += '<td>' + urhList[i].b_no + '</td>'; //버스번호
						str += '<td><a href="/admin/company/getCompanyDetail?c_username='+urhList[i].c_username+'">'+urhList[i].c_username+'</a></td>'; 	
						str += '<td><a href="/admin/stop/getStopDetail?s_No='+urhList[i].s_nostart+'">' + urhList[i].s_namestart + '</a></td>'; //출발지	
						str += '<td><a href="/admin/stop/getStopDetail?s_No='+urhList[i].s_nolast+'">' + urhList[i].s_namelast + '</a></td>'; //도착지	
						str += '<td>' + urhList[i].u_type + '</td>'; //장애유형
						str += '<td><a href="/admin/user/getUserDetail?u_userName=' + urhList[i].u_userName + '">'+urhList[i].u_userName+'</a></td>';
						str += '<td>' + urhList[i].ur_state + '</td>';	 //이용상태
					}
					$("#userHistoryList").empty();
					$("#userHistoryList").append(str);
					
				}).fail(function(err) {
					console.log(err,"!!!!!!!!!!");
				});
			}
			
			function state_search(state){
				$.ajax({
					url : "/admin/user/getState",
					data : { 'ur_state' : state },
					dataType : 'json',
				}).done(function (data) {
					console.log(data);
					let urhList = data;
					let str = "";
					
					for (let i = 0; i < urhList.length; i++) {
						//0,1을 --> 휠체어, 시각으로 바꾸어 출력
						if (urhList[i].u_type == 0) {
							urhList[i].u_type = '휠체어';
						} else urhList[i].u_type = '시각';
						
						//현 이용상태(0:예약중, 1:탑승중, 2:취소, 3:완료)
						if (urhList[i].ur_state == 2) {
							urhList[i].ur_state = '취소';
						} else if(urhList[i].ur_state == 3){
							urhList[i].ur_state = '완료';
						}else if(urhList[i].ur_state == 0){
							urhList[i].ur_state = '예약중'
						}else if(urhList[i].ur_state == 1){
							urhList[i].ur_state = '탑승중'
						}
			
						str += '<tr>';
						str += '<th>' + (i+1) + '</th>' //NO
						str += '<td>' + urhList[i].ur_no + '</td>';  //예약번호
						str += '<td>' + urhList[i].ur_date + '</td>'; //이용일
						str += '<td>' + urhList[i].b_no + '</td>'; //버스번호
						str += '<td><a href="/admin/company/getCompanyDetail?c_username='+urhList[i].c_username+'">'+urhList[i].c_username+'</a></td>'; 	
						str += '<td><a href="/admin/stop/getStopDetail?s_No='+urhList[i].s_nostart+'">' + urhList[i].s_namestart + '</a></td>'; //출발지	
						str += '<td><a href="/admin/stop/getStopDetail?s_No='+urhList[i].s_nolast+'">' + urhList[i].s_namelast + '</a></td>'; //도착지	
						str += '<td>' + urhList[i].u_type + '</td>'; //장애유형
						str += '<td><a href="/admin/user/getUserDetail?u_userName=' + urhList[i].u_userName + '">'+urhList[i].u_userName+'</a></td>';
						str += '<td>' + urhList[i].ur_state + '</td>';	 //이용상태
					}
					$("#userHistoryList").empty();
					$("#userHistoryList").append(str);
					
				}).fail(function(err) {
					console.log(err,"!!!!!!!!!!");
				});
			}
			
			function date_search(period) {
				$.ajax({
					url : "/admin/user/getUserHistoryDateList",
					data : { 'urh_date' : period },
					dataType : 'json',
				}).done(function (data) {
					console.log(data);
					let urhList = data;
					let str = "";
					
					for (let i = 0; i < urhList.length; i++) {
						//0,1을 --> 휠체어, 시각으로 바꾸어 출력
						if (urhList[i].u_type == 0) {
							urhList[i].u_type = '휠체어';
						} else urhList[i].u_type = '시각';
						
						//현 이용상태(0:예약중, 1:탑승중, 2:취소, 3:완료)
						if (urhList[i].ur_state == 2) {
							urhList[i].ur_state = '취소';
						} else if(urhList[i].ur_state == 3){
							urhList[i].ur_state = '완료';
						}else if(urhList[i].ur_state == 0){
							urhList[i].ur_state = '예약중'
						}else if(urhList[i].ur_state == 1){
							urhList[i].ur_state = '탑승중'
						}
			
						str += '<tr>';
						str += '<th>' + (i+1) + '</th>' //NO
						str += '<td>' + urhList[i].ur_no + '</td>';  //예약번호
						str += '<td>' + urhList[i].ur_date + '</td>'; //이용일
						str += '<td>' + urhList[i].b_no + '</td>'; //버스번호
						str += '<td><a href="/admin/company/getCompanyDetail?c_username='+urhList[i].c_username+'">'+urhList[i].c_username+'</a></td>'; 	
						str += '<td><a href="/admin/stop/getStopDetail?s_No='+urhList[i].s_nostart+'">' + urhList[i].s_namestart + '</a></td>'; //출발지	
						str += '<td><a href="/admin/stop/getStopDetail?s_No='+urhList[i].s_nolast+'">' + urhList[i].s_namelast + '</a></td>'; //도착지	
						str += '<td>' + urhList[i].u_type + '</td>'; //장애유형
						str += '<td><a href="/admin/user/getUserDetail?u_userName=' + urhList[i].u_userName + '">'+urhList[i].u_userName+'</a></td>';
						str += '<td>' + urhList[i].ur_state + '</td>';	 //이용상태
					}
					$("#userHistoryList").empty();
					$("#userHistoryList").append(str);
					
				}).fail(function(err) {
					console.log(err,"!!!!!!!!!!");
				});
			}	//data_serch function end
				
			//검색버튼 누르면
			$('#searchBtn').click(function(){
				var sort = $('#selectSort option:selected').val();
				console.log(sort);	
				let input = $('#searchInput').val()
				console.log( input );
				
				if(input == ''){
					alert("값을 입력해주세요.");
				}else{ 
					switch(sort){
						case "4":	//아이디
							$.ajax({
								url : "/admin/user/getUserHistoryUserName",
								data : { 'u_userName' : input },
								dataType : 'json',
							}).done(function(data){
								console.log(data);
								let urhList = data;
								let str = "";
					
								for (let i = 0; i < urhList.length; i++) {
									//0,1을 --> 휠체어, 시각으로 바꾸어 출력
									if (urhList[i].u_type == 0) {
										urhList[i].u_type = '휠체어';
									} else urhList[i].u_type = '시각';
									
									//현 이용상태(0:예약중, 1:탑승중, 2:취소, 3:완료)
									if (urhList[i].ur_state == 2) {
										urhList[i].ur_state = '취소';
									} else if(urhList[i].ur_state == 3){
										urhList[i].ur_state = '완료';
									}else if(urhList[i].ur_state == 0){
										urhList[i].ur_state = '예약중'
									}else if(urhList[i].ur_state == 1){
										urhList[i].ur_state = '탑승중'
									}
						
									str += '<tr>';
									str += '<th>' + (i+1) + '</th>' //NO
									str += '<td>' + urhList[i].ur_no + '</td>';  //예약번호
									str += '<td>' + urhList[i].ur_date + '</td>'; //이용일
									str += '<td>' + urhList[i].b_no + '</td>'; //버스번호
									str += '<td><a href="/admin/company/getCompanyDetail?c_username='+urhList[i].c_username+'">'+urhList[i].c_username+'</a></td>'; 	
									str += '<td><a href="/admin/stop/getStopDetail?s_No='+urhList[i].s_nostart+'">' + urhList[i].s_namestart + '</a></td>'; //출발지	
									str += '<td><a href="/admin/stop/getStopDetail?s_No='+urhList[i].s_nolast+'">' + urhList[i].s_namelast + '</a></td>'; //도착지	
									str += '<td>' + urhList[i].u_type + '</td>'; //장애유형
									str += '<td><a href="/admin/user/getUserDetail?u_userName=' + urhList[i].u_userName + '">'+urhList[i].u_userName+'</a></td>';
									str += '<td>' + urhList[i].ur_state + '</td>';	 //이용상태
								}
								$("#userHistoryList").empty();
								$("#userHistoryList").append(str);
							}).fail(function(err){
								console.log(err,"!!!!!!!!!!");
							});
							break;
							
						case "5":	//버스회사
							$.ajax({
								url : "/admin/user/getUserHistoryCompanyName",
								data : { 'c_userName' : input },
								dataType : 'json',
							}).done(function(data){
								console.log(data);
								let urhList = data;
								let str = "";
					
								for (let i = 0; i < urhList.length; i++) {
									//0,1을 --> 휠체어, 시각으로 바꾸어 출력
									if (urhList[i].u_type == 0) {
										urhList[i].u_type = '휠체어';
									} else urhList[i].u_type = '시각';
									
									//현 이용상태(0:예약중, 1:탑승중, 2:취소, 3:완료)
									if (urhList[i].ur_state == 2) {
										urhList[i].ur_state = '취소';
									} else if(urhList[i].ur_state == 3){
										urhList[i].ur_state = '완료';
									}else if(urhList[i].ur_state == 0){
										urhList[i].ur_state = '예약중'
									}else if(urhList[i].ur_state == 1){
										urhList[i].ur_state = '탑승중'
									}
						
									str += '<tr>';
									str += '<th>' + (i+1) + '</th>' //NO
									str += '<td>' + urhList[i].ur_no + '</td>';  //예약번호
									str += '<td>' + urhList[i].ur_date + '</td>'; //이용일
									str += '<td>' + urhList[i].b_no + '</td>'; //버스번호
									str += '<td><a href="/admin/company/getCompanyDetail?c_username='+urhList[i].c_username+'">'+urhList[i].c_username+'</a></td>'; 	
									str += '<td><a href="/admin/stop/getStopDetail?s_No='+urhList[i].s_nostart+'">' + urhList[i].s_namestart + '</a></td>'; //출발지	
									str += '<td><a href="/admin/stop/getStopDetail?s_No='+urhList[i].s_nolast+'">' + urhList[i].s_namelast + '</a></td>'; //도착지	
									str += '<td>' + urhList[i].u_type + '</td>'; //장애유형
									str += '<td><a href="/admin/user/getUserDetail?u_userName=' + urhList[i].u_userName + '">'+urhList[i].u_userName+'</a></td>';
									str += '<td>' + urhList[i].ur_state + '</td>';	 //이용상태
								}
								$("#userHistoryList").empty();
								$("#userHistoryList").append(str);
							}).fail(function(err){
								console.log(err,"!!!!!!!!!!");
							});
							break;
						
						case "6":	//버스번호
							$.ajax({
								url : "/admin/user/getUserHistoryBusNum",
								data : { 'b_no' : input },
								dataType : 'json',
							}).done(function(data){
								console.log(data);
								let urhList = data;
								console.log(urhList);
								let str = "";
					
								for (let i = 0; i < urhList.length; i++) {
									//0,1을 --> 휠체어, 시각으로 바꾸어 출력
									if (urhList[i].u_type == 0) {
										urhList[i].u_type = '휠체어';
									} else urhList[i].u_type = '시각';
									
									//현 이용상태(0:예약중, 1:탑승중, 2:취소, 3:완료)
									if (urhList[i].ur_state == 2) {
										urhList[i].ur_state = '취소';
									} else if(urhList[i].ur_state == 3){
										urhList[i].ur_state = '완료';
									}else if(urhList[i].ur_state == 0){
										urhList[i].ur_state = '예약중'
									}else if(urhList[i].ur_state == 1){
										urhList[i].ur_state = '탑승중'
									}
									
									str += '<tr>';
									str += '<th>' + (i+1) + '</th>' //NO
									str += '<td>' + urhList[i].ur_no + '</td>';  //예약번호
									str += '<td>' + urhList[i].ur_date + '</td>'; //이용일
									str += '<td>' + urhList[i].b_no + '</td>'; //버스번호
									str += '<td><a href="/admin/company/getCompanyDetail?c_username='+urhList[i].c_username+'">'+urhList[i].c_username+'</a></td>'; 	
									str += '<td><a href="/admin/stop/getStopDetail?s_No='+urhList[i].s_nostart+'">' + urhList[i].s_namestart + '</a></td>'; //출발지	
									str += '<td><a href="/admin/stop/getStopDetail?s_No='+urhList[i].s_nolast+'">' + urhList[i].s_namelast + '</a></td>'; //도착지	
									str += '<td>' + urhList[i].u_type + '</td>'; //장애유형
									str += '<td><a href="/admin/user/getUserDetail?u_userName=' + urhList[i].u_userName + '">'+urhList[i].u_userName+'</a></td>';
									str += '<td>' + urhList[i].ur_state + '</td>';	 //이용상태
								}
								$("#userHistoryList").empty();
								$("#userHistoryList").append(str);
							}).fail(function(err){
								console.log(err,"!!!!!!!!!!");
							});
							break;
						
						case "7":	//출발지
							$.ajax({
								url : "/admin/user/getStopStartName",
								data : { 's_namestart' : input },
								dataType : 'json',
							}).done(function(data){
								console.log(data);
								let urhList = data;
								console.log(urhList);
								let str = "";
					
								for (let i = 0; i < urhList.length; i++) {
									//0,1을 --> 휠체어, 시각으로 바꾸어 출력
									if (urhList[i].u_type == 0) {
										urhList[i].u_type = '휠체어';
									} else urhList[i].u_type = '시각';
									
									//현 이용상태(0:예약중, 1:탑승중, 2:취소, 3:완료)
									if (urhList[i].ur_state == 2) {
										urhList[i].ur_state = '취소';
									} else if(urhList[i].ur_state == 3){
										urhList[i].ur_state = '완료';
									}else if(urhList[i].ur_state == 0){
										urhList[i].ur_state = '예약중'
									}else if(urhList[i].ur_state == 1){
										urhList[i].ur_state = '탑승중'
									}
									
									str += '<tr>';
									str += '<th>' + (i+1) + '</th>' //NO
									str += '<td>' + urhList[i].ur_no + '</td>';  //예약번호
									str += '<td>' + urhList[i].ur_date + '</td>'; //이용일
									str += '<td>' + urhList[i].b_no + '</td>'; //버스번호
									str += '<td><a href="/admin/company/getCompanyDetail?c_username='+urhList[i].c_username+'">'+urhList[i].c_username+'</a></td>'; 	
									str += '<td><a href="/admin/stop/getStopDetail?s_No='+urhList[i].s_nostart+'">' + urhList[i].s_namestart + '</a></td>'; //출발지	
									str += '<td><a href="/admin/stop/getStopDetail?s_No='+urhList[i].s_nolast+'">' + urhList[i].s_namelast + '</a></td>'; //도착지	
									str += '<td>' + urhList[i].u_type + '</td>'; //장애유형
									str += '<td><a href="/admin/user/getUserDetail?u_userName=' + urhList[i].u_userName + '">'+urhList[i].u_userName+'</a></td>';
									str += '<td>' + urhList[i].ur_state + '</td>';	 //이용상태
								}
								$("#userHistoryList").empty();
								$("#userHistoryList").append(str);
							}).fail(function(err){
								console.log(err,"!!!!!!!!!!");
							});
							break;
						
						case "8":	//목적지
							$.ajax({
								url : "/admin/user/getStopLastName",
								data : { 's_namelast' : input },
								dataType : 'json',
							}).done(function(data){
								console.log(data);
								let urhList = data;
								console.log(urhList);
								let str = "";
					
								for (let i = 0; i < urhList.length; i++) {
									//0,1을 --> 휠체어, 시각으로 바꾸어 출력
									if (urhList[i].u_type == 0) {
										urhList[i].u_type = '휠체어';
									} else urhList[i].u_type = '시각';
									
									//현 이용상태(0:예약중, 1:탑승중, 2:취소, 3:완료)
									if (urhList[i].ur_state == 2) {
										urhList[i].ur_state = '취소';
									} else if(urhList[i].ur_state == 3){
										urhList[i].ur_state = '완료';
									}else if(urhList[i].ur_state == 0){
										urhList[i].ur_state = '예약중'
									}else if(urhList[i].ur_state == 1){
										urhList[i].ur_state = '탑승중'
									}
									
									str += '<tr>';
									str += '<th>' + (i+1) + '</th>' //NO
									str += '<td>' + urhList[i].ur_no + '</td>';  //예약번호
									str += '<td>' + urhList[i].ur_date + '</td>'; //이용일
									str += '<td>' + urhList[i].b_no + '</td>'; //버스번호
									str += '<td><a href="/admin/company/getCompanyDetail?c_username='+urhList[i].c_username+'">'+urhList[i].c_username+'</a></td>'; 	
									str += '<td><a href="/admin/stop/getStopDetail?s_No='+urhList[i].s_nostart+'">' + urhList[i].s_namestart + '</a></td>'; //출발지	
									str += '<td><a href="/admin/stop/getStopDetail?s_No='+urhList[i].s_nolast+'">' + urhList[i].s_namelast + '</a></td>'; //도착지	
									str += '<td>' + urhList[i].u_type + '</td>'; //장애유형
									str += '<td><a href="/admin/user/getUserDetail?u_userName=' + urhList[i].u_userName + '">'+urhList[i].u_userName+'</a></td>';
									str += '<td>' + urhList[i].ur_state + '</td>';	 //이용상태
								}
								$("#userHistoryList").empty();
								$("#userHistoryList").append(str);
							}).fail(function(err){
								console.log(err,"!!!!!!!!!!");
							});
							break;
					}	//switch end			
				} //if end
			}); //searchBtn click end
			
		</script>

	<div id="adminfooter"><%@ include
			file="/WEB-INF/views/include/adminfooter.jsp"%></div>
</body>
</html>
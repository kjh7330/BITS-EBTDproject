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
		<br> 정렬:<select id="selectSort" onchange="categoryChange(this)">
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
		상세:<select id="selectSortDetail" name="selectSortDetail" style="display:none">	
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
				<th scope="col">NO</th>
				<th scope="col">예약번호</th>
				<th scope="col">이용일</th>
				<th scope="col">버스번호</th>
				<th scope="col">버스회사</th>
				<th scope="col">출발지</th>
				<th scope="col">목적지</th>
				<th scope="col">장애유형</th>
				<th scope="col">유저아이디</th>
				<th scope="col">이용상태</th>
			</tr>
		</thead>
		<tbody id="userHistoryList">
		</tbody>

	</table>

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
				if (urhList[i].urh_state == 2) {
					urhList[i].urh_state = '취소';
				} else if(urhList[i].urh_state == 3)
					urhList[i].urh_state = '완료';
	
				str += '<tr>';
				//NO
				str += '<th>' + (i+1) + '</th>'
				//예약번호
				str += '<td>' + urhList[i].urh_no + '</td>';
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
				//이용상태
				str += '<td>' + urhList[i].urh_state + '</td>';			
			}
			$("#userHistoryList").empty();
			$("#userHistoryList").append(str);
			
		
			//selectbox click event
			function categoryChange(e){
				
				let detail_period = ["조회기간을 선택해주세요","1주일", "1개월", "3개월", "6개월", "1년"];
				let u_type = ["장애유형을 선택해주세요","시각", "휠체어"];
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
						$('#userHistoryList').html("");
						str = "";
						//리스트 중에 
						for (let i = 0; i < urhList.length; i++) {
							console.log(urhList[i].u_type);
							//시각장애인만
							if(urhList[i].u_type == "시각"){
								//urhList[i].u_type = '시각';
								str += '<tr>';
								str += '<th>' + (i+1) + '</th>' //NO
								str += '<td>' + urhList[i].urh_no + '</td>';  //예약번호
								str += '<td>' + urhList[i].urh_date + '</td>'; //이용일
								str += '<td>' + urhList[i].b_no + '</td>'; //버스번호
								str += '<td>' + urhList[i].c_userName + '</td>'; //버스회사 
								str += '<td>' + urhList[i].s_nostart + '</td>'; //출발지
								str += '<td>' + urhList[i].s_nolast + '</td>'; //목적지
								str += '<td>' + urhList[i].u_type + '</td>'; //장애유형
								str += '<td><a href="/admin/user/getUserDetail?u_userName=' + urhList[i].u_userName + '">'+urhList[i].u_userName+'</a></td>';
								str += '<td>' + urhList[i].urh_state + '</td>';	 //이용상태
							}
						}
						$("#userHistoryList").empty();
						$("#userHistoryList").append(str);
						break;
						
					case "휠체어":
						$('#userHistoryList').html("");
						str = "";
						//리스트 중에 
						for (let i = 0; i < urhList.length; i++) {
							console.log(urhList[i].u_type);
							//휠체어만
							if(urhList[i].u_type == "휠체어"){
								str += '<tr>';
								str += '<th>' + (i+1) + '</th>' //NO
								str += '<td>' + urhList[i].urh_no + '</td>';  //예약번호
								str += '<td>' + urhList[i].urh_date + '</td>'; //이용일
								str += '<td>' + urhList[i].b_no + '</td>'; //버스번호
								str += '<td>' + urhList[i].c_userName + '</td>'; //버스회사 
								str += '<td>' + urhList[i].s_nostart + '</td>'; //출발지
								str += '<td>' + urhList[i].s_nolast + '</td>'; //목적지
								str += '<td>' + urhList[i].u_type + '</td>'; //장애유형
								str += '<td><a href="/admin/user/getUserDetail?u_userName=' + urhList[i].u_userName + '">'+urhList[i].u_userName+'</a></td>';
								str += '<td>' + urhList[i].urh_state + '</td>';	 //이용상태
							}
						}
						$("#userHistoryList").empty();
						$("#userHistoryList").append(str);
						break;
					
					case "1주일":
						date_serch("1주일");
						break;
					case "1개월":
						date_serch("1개월");
						break;
					case "3개월":
						date_serch("3개월");
						break;
					case "6개월":
						date_serch("6개월");
						break;
					case "1년":
						date_serch("1년");
						break;
				}	//switch end
				
			}); //selectSortDetail change end
			
			function date_serch(period) {
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
						if (urhList[i].urh_state == 2) {
							urhList[i].urh_state = '취소';
						} else if(urhList[i].urh_state == 3)
							urhList[i].urh_state = '완료';
			
						str += '<tr>';
						str += '<th>' + (i+1) + '</th>' //NO
						str += '<td>' + urhList[i].urh_no + '</td>';  //예약번호
						str += '<td>' + urhList[i].urh_date + '</td>'; //이용일
						str += '<td>' + urhList[i].b_no + '</td>'; //버스번호
						str += '<td>' + urhList[i].c_userName + '</td>'; //버스회사 
						str += '<td>' + urhList[i].s_nostart + '</td>'; //출발지
						str += '<td>' + urhList[i].s_nolast + '</td>'; //목적지
						str += '<td>' + urhList[i].u_type + '</td>'; //장애유형
						str += '<td><a href="/admin/user/getUserDetail?u_userName=' + urhList[i].u_userName + '">'+urhList[i].u_userName+'</a></td>';
						str += '<td>' + urhList[i].urh_state + '</td>';	 //이용상태
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
									if (urhList[i].urh_state == 2) {
										urhList[i].urh_state = '취소';
									} else if(urhList[i].urh_state == 3)
										urhList[i].urh_state = '완료';
						
									str += '<tr>';
									str += '<th>' + (i+1) + '</th>' //NO
									str += '<td>' + urhList[i].urh_no + '</td>';  //예약번호
									str += '<td>' + urhList[i].urh_date + '</td>'; //이용일
									str += '<td>' + urhList[i].b_no + '</td>'; //버스번호
									str += '<td>' + urhList[i].c_userName + '</td>'; //버스회사 
									str += '<td>' + urhList[i].s_nostart + '</td>'; //출발지
									str += '<td>' + urhList[i].s_nolast + '</td>'; //목적지
									str += '<td>' + urhList[i].u_type + '</td>'; //장애유형
									str += '<td><a href="/admin/user/getUserDetail?u_userName=' + urhList[i].u_userName + '">'+urhList[i].u_userName+'</a></td>';
									str += '<td>' + urhList[i].urh_state + '</td>';	 //이용상태
								}
								$("#userHistoryList").empty();
								$("#userHistoryList").append(str);
							}).fail(function(err){
								console.log(err,"!!!!!!!!!!");
							});
							break;
							
						case "5":	//버스회사
							
							break;
						
						case "6":	//버스번호
							$.ajax({
								url : "/admin/user/getUserHistoryBusNum",
								data : { 'b_no' : input },
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
									if (urhList[i].urh_state == 2) {
										urhList[i].urh_state = '취소';
									} else if(urhList[i].urh_state == 3)
										urhList[i].urh_state = '완료';
						
									str += '<tr>';
									str += '<th>' + (i+1) + '</th>' //NO
									str += '<td>' + urhList[i].urh_no + '</td>';  //예약번호
									str += '<td>' + urhList[i].urh_date + '</td>'; //이용일
									str += '<td>' + urhList[i].b_no + '</td>'; //버스번호
									str += '<td>' + urhList[i].c_userName + '</td>'; //버스회사 
									str += '<td>' + urhList[i].s_nostart + '</td>'; //출발지
									str += '<td>' + urhList[i].s_nolast + '</td>'; //목적지
									str += '<td>' + urhList[i].u_type + '</td>'; //장애유형
									str += '<td><a href="/admin/user/getUserDetail?u_userName=' + urhList[i].u_userName + '">'+urhList[i].u_userName+'</a></td>';
									str += '<td>' + urhList[i].urh_state + '</td>';	 //이용상태
								}
								$("#userHistoryList").empty();
								$("#userHistoryList").append(str);
							}).fail(function(err){
								console.log(err,"!!!!!!!!!!");
							});
							break;
						
						case "7":	//출발지
							break;
						
						case "8":	//목적지
							break;
					}	//switch end			
				} //if end
			}); //searchBtn click end
			
		</script>

	<div id="adminfooter"><%@ include
			file="/WEB-INF/views/include/adminfooter.jsp"%></div>
</body>
</html>
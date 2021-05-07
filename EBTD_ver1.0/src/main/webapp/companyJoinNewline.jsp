<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="resources/js/jquery.serializeObject.js"></script>
<style>
/*   모달css랑 스크립트, 버튼html 복사해서 쓰세요~!   */
/*   스크립트는 맨 아래쪽에 있음   */
/*   모달 버튼은 스크립트 위에 있음   */
/* modal trigger */
button {
	border: none;
	font-size: 18px;
	background: #f44336;
	color: #f9f9f9;
	padding: 8px 16px;
}

h2 {
	padding: 20px 0;
}

body {
	text-align: center;
}

/* modal overlay */
#overlay {
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.4);
	position: fixed;
	top: 0;
	left: 0;
	z-index: 1;
	visibility: hidden;
	opacity: 0;
	transition: all 0.5s ease;
	color : black;
}

/* modal box */
.modal {
	width: 80%;
	background: #f5f5f5;
	margin: 150px auto;
}

.modal_header {
	width: 100%;
	position: relative;
}

.modal_header h3 {
	padding: 20px 0;
	color: #333;
}

.modal_content {
	width: 100%;
	background: #fefefe;
	border: 1px solid #888;
	box-sizing: border-box;
	height: 200px;
}

.modal_footer {
	position: absolute;
	bottom: 0;
	width: 100%;
	padding: 10px 0;
	font-size: 14px;
}

.close {
	position: absolute;
	top: 10px;
	right: 20px;
	font-size: 28px;
	color: #aaa;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	cursor: pointer;
}
/*   모달css여기까지~!   */
</style>
<body>
	<p style="color: black;">노선번호 선택</p>
	<input type="text" id="busNum">
	<!--    모달 버튼 가져가세요~!     -->
	<button id="myBtn">노선 번호 확정</button>

	<div id="overlay">
		<div id="myModal" class="modal">
			<div class="modal_header">
				<p style="color: black; text-align: center;">새로운 노선 등록 신청</p>
				<span class="close">&times;</span>
			</div>
			<div class="modal_content" style="text-align: center;">
				<p style="color: black;">동, 읍, 면 선택</p>
				<select id="mTownSelect"></select>
				<p style="color: black;">출발 정류장 선택</p>
				<select id="mStopSelect"></select>
				<input type = "button" id = "stopConfi" value = "선택">
				<p style = "color: black;">추천 정류장</p>
				<select id="mRecommendStop"></select>
				<input type = "button" id = "recommendConfi" value = "선택">
				
			</div>
			<form id = "routeForm" action="/company/applyNewBusRoute" method = "post">
			<div id = "busRouteSelect">
				<p style = "color: black;">버스 노선</p> <input type = "text" id = "stopCount" name = "stopCount">개 정류장
				<input id="mBusNum" name= "busNum">번 버스 <br/>
			</div>
				운행 버스 배차
				<table id="dispatch">
					<tr>
						<td>차량번호 :</td>
						<td><input type = "text" class = "motorNumber" name = "motorNumber1"></td>
						<td><select name = "lowFloor1">
							<option value = "일반">일반</option>
							<option value = "저상">저상</option>
						</select></td>
						<td><input type = "button" value = "추가" id = "add"></td>
					</tr>
				</table>
				총 버스 갯수 :<input id="motorCount" type = "text" name= "motorCount">
				<input id="submitRoute" type = "submit">
			</form>
			<div class="modal_footer">
			</div>
		</div>
	</div>
	<!--    모달 버튼 끝!    -->
</body>
<script>
let tList = ${tList};
let sList = ${sList};
var startX;
var startY;
let tName;
console.log(sList);
console.log(tList);
var j = 1;

for(let i in tList) {
	let tName = tList[i]['t_NAME'];
	$('#mTownSelect').append("<option id = 'mTownSelectBox' value ='"+tName+"'>"+tName+"</option>");
	}
// 모달창 열기 이벤트
$("#myBtn").on("click", function(){
	  $.ajax({
		  type : 'get',
		  url : '/company/bus/busNumCheck',
		  data : {'busNum' : $('#busNum').val()},
		  dataType : 'html'
	  }).done(function (data) {
		  if($('#busNum').val()!='') {
		  	if(data==0){
			 	 document.getElementById('mBusNum').value = $('#busNum').val();
			 	 $("#overlay").css({ visibility:"visible", opacity:1 });
	         	 $("#myModal").css({ display: "inline"});
		  	} else if(data!=0) {
			 	 alert("중복된 버스번호입니다.");
		 	 }
		  } else {
			  alert("노선번호를 입력하세요.");
		  }
	  }).fail(function (data) {
		  alert("잘못된 입력입니다.");
	  });
  }); 

  // 모달창 닫기 이벤트 
  $(".close").on("click", function(){
          $("#overlay").css({ visibility:"hidden", opacity:0 });
  });

 $(document).on("click", function(e){  
    if( $("#overlay").is(e.target) ) {
        $("#overlay").css({ visibility:"hidden", opacity:0 });
    }
  });

  // esc 누를시 모달창 닫기
  $(document).keydown(function(event) {
    if ( event.keyCode == 27 || event.which == 27 ) {
        $("#overlay").css({ visibility:"hidden", opacity:0 });
    }
});
//동,읍,면 선택 시 해당 지역의 정류장 리스트 불러오기
$('#mTownSelect').on('change', function() {	
	let townSelect = $('#mTownSelect').val();
	console.log(townSelect);
	//let stopSelectVal = $('#mStopSelect').val();
	$('#mStopSelect').html('');
	for (let i in sList) {
		let sTName = sList[i]['t_NAME'];
		let sName = sList[i]['s_NAME'];
		if(sTName == townSelect) {
			$('#mStopSelect').append("<option value ='"+sName+"'>"+sName+"</option>");
		}
	}
});
//정류장 루트 짜기
$('#stopConfi').on('click', function() {
	let selectStop = $('#mStopSelect').val();
	let stopRoute = $('.stopRoute').val();
	let selectX;
	let selectY;
	let selectStopNumber
	console.log(selectStop);
	//선택한 정류장 번호 가져오기
	for(let i in sList) {
		if(selectStop == sList[i]['s_NAME']) {
			selectStopNumber = sList[i]['s_NO'];
		};
	};
	//선택한 정류장 찍기
	$('#busRouteSelect').append("<input type = 'text' class = 'stopRoute' value = '"+j+" : "+selectStop+"' readOnly>");
	$('#busRouteSelect').append("<input type = 'text' class = 'stopRouteNum' name = 'stopRouteNum"+j+"' value = '"+selectStopNumber+"' readOnly>");
	//선택한 정류장의 좌표 가져오기
	for(let i in sList) {
		if(selectStop == sList[i]['s_NAME']) {
			selectX = sList[i]['s_X'];
			selectY = sList[i]['s_Y'];
			};
	};
	console.log(selectX);
	//범위 안에 정류장 가져오기
	var recommendStopName;
	for(let i in sList) {
		if(selectX-5 < sList[i]['s_X'] && sList[i]['s_X'] < selectX+5 && selectY-5 < sList[i]['s_Y'] && sList[i]['s_Y'] < selectY+5 && selectStop != sList[i]['s_NAME'] ) {
			recommendStopName = sList[i]['s_NAME'];
			$('#mRecommendStop').append("<option id = 'mRecommendSelectBox' value ='"+recommendStopName+"'>"+recommendStopName+"</option>");
		};
	};
	//출발 정류장 셀렉박스 비활성화
	const btn = document.getElementById('stopConfi');
	btn.disabled = 'disabled';
	startX = selectX;
	startY = selectY;
	j++;
});  
//추천 정류장 선택 버튼 클릭 
$('#recommendConfi').on('click', function() {
	var recommendSelect = $('#mRecommendStop').val();
	let recommendStopNumber;
	//선택한 정류장 정류장 번호 가져오기
	for(let i in sList) {
		if(recommendSelect == sList[i]['s_NAME']) {
			recommendStopNumber = sList[i]['s_NO'];
		};	
	};
	//선택한 정류장 찍기
	$('#busRouteSelect').append("<input type = 'text' class = 'stopRoute' value = '"+j+" : "+recommendSelect+"' readOnly>");
	$('#busRouteSelect').append("<input type = 'text' class = 'stopRouteNum' name = 'stopRouteNum"+j+"' value = '"+recommendStopNumber+"' readOnly>");
	document.getElementById('stopCount').value= j;
	//select 박스 초기화
	$('#mRecommendStop').html('');
	//선택한 정류장 좌표 가져오기
	for(let i in sList) {
		if(recommendSelect == sList[i]['s_NAME']) {
			recommendX = sList[i]['s_X'];
			recommendY = sList[i]['s_Y'];
			};
	};
	console.log("재시작된 전역변수"+startX);
	//범위 안에 선택 할 정류장 가져오기
	var recommendStopName;
	console.log(startX, startY);
	console.log(recommendX, recommendY);
	//x축 +, y축 + 인 경우
	if(startX < recommendX && startY < recommendY) {
		console.log("x축 +, y축 + 인 경우");
		for(let i in sList) {
			if((recommendX-5 < sList[i]['s_X'] && sList[i]['s_X'] < recommendX+5 && recommendY < sList[i]['s_Y'] && sList[i]['s_Y'] < recommendY+10)||(recommendX < sList[i]['s_X'] && sList[i]['s_X'] < recommendX+5 && recommendY-5 < sList[i]['s_Y'] && sList[i]['s_Y'] < recommendY)) {
				recommendStopName = sList[i]['s_NAME'];
				$('#mRecommendStop').append("<option id = 'mRecommendSelectBox' value ='"+recommendStopName+"'>"+recommendStopName+"</option>");
			};
		};//for문 end
	}//if문 end
	//x축 +, y축 - 인 경우
	else if(startX < recommendX && recommendY < startY) {
		console.log("x축 +, y축 - 인 경우");
		for(let i in sList) {
			 if((recommendX < sList[i]['s_X'] && sList[i]['s_X'] < recommendX+5 && recommendY < sList[i]['s_Y'] && sList[i]['s_Y'] < recommendY+5)||(recommendX-5 < sList[i]['s_X'] && sList[i]['s_X'] < recommendX+5 && recommendY-5 < sList[i]['s_Y'] && sList[i]['s_Y'] < recommendY-5)) {
				 recommendStopName = sList[i]['s_NAME'];
					$('#mRecommendStop').append("<option id = 'mRecommendSelectBox' value ='"+recommendStopName+"'>"+recommendStopName+"</option>");	
				}
		}//for문 end
	}// if문 end
	//x축 -, y축 - 인 경우
	else if(recommendX < startX && recommendY < startY) {
		console.log("x축 -, y축 - 인 경우");
		for(let i in sList) {
			if((recommendX-5< sList[i]['s_X'] && sList[i]['s_X'] < recommendX+5 && sList[i]['s_Y'] < recommendY && recommendY-5 < sList[i]['s_Y'])||(recommendX-5 < sList[i]['s_X'] && sList[i]['s_X'] < recommendX && sList[i]['s_Y'] < recommendY+5 && recommendY < sList[i]['s_Y'])) {
				recommendStopName = sList[i]['s_NAME'];
				$('#mRecommendStop').append("<option id = 'mRecommendSelectBox' value ='"+recommendStopName+"'>"+recommendStopName+"</option>");
			}
		}//for문 end 
	}// if문 end 
	//x축 -, y축 + 인 경우 
	else if(recommendX < startX && startY < recommendY) {
		console.log("x축 -, y축 + 인 경우");
		for(let i in sList) {
			if((recommendX-5 < sList[i]['s_X'] && sList[i]['s_X'] < recommendX && recommendY-5 < sList[i]['s_Y'] && sList[i]['s_Y'] < recommendY)||(recommendX-5 < sList[i]['s_X'] && sList[i]['s_X'] < recommendX+5 && recommendY < sList[i]['s_Y'] && sList[i]['s_Y'] < recommendY+5)) {
				recommendStopName = sList[i]['s_NAME'];
				$('#mRecommendStop').append("<option id = 'mRecommendSelectBox' value ='"+recommendStopName+"'>"+recommendStopName+"</option>");
			}
		}//for문 end
	}//if문 end
	//x축 0, y축 + 인 경우
	else if(recommendX==startX && startY < recommendY) {
		console.log("x축 0, y축 + 인 경우");
		for(let i in sList) {
			if(recommendX-5 < sList[i]['s_X'] && sList[i]['s_X'] < recommendX+5 && recommendY < sList[i]['s_Y'] && sList[i]['s_Y'] < recommendY) {
				recommendStopName = sList[i]['s_NAME'];
				$('#mRecommendStop').append("<option id = 'mRecommendSelectBox' value ='"+recommendStopName+"'>"+recommendStopName+"</option>");
			}
		}//for문 end
	}//if문 end
	//x축 0, y축 - 인 경우
	else if(recommendX==startX && recommendY < startY) {
		console.log("x축 0, y축 - 인 경우");
		for(let i in sList) {
			if(recommendX-5 < sList[i]['s_X'] && sList[i]['s_X'] < recommendX+5 && recommendY-5 < sList[i]['s_Y'] && sList[i]['s_Y'] < recommendY) {
				recommendStopName = sList[i]['s_NAME'];
				$('#mRecommendStop').append("<option id = 'mRecommendSelectBox' value ='"+recommendStopName+"'>"+recommendStopName+"</option>");
			}
		}//for문 end 
	}//if문 end
	//x축 +, y축 0 인 경우
	else if(startX<recommendX && recommendY==startY) {
		console.log("x축 +, y축 0 인 경우");
		for(let i in sList) {
			if(recommendX < sList[i]['s_X'] && sList[i]['s_X'] < recommendX+5 && recommendY-5 < sList[i]['s_Y'] && sList[i]['s_Y'] < recommendY+5) {
				recommendStopName = sList[i]['s_NAME'];
				$('#mRecommendStop').append("<option id = 'mRecommendSelectBox' value ='"+recommendStopName+"'>"+recommendStopName+"</option>");
			}
		}//for문 end
	}//if문 end
	//x축 -, y축 0 인 경우
	else if(startX<recommendX && recommendY==startY) {
		console.log("x축 -, y축 0 인 경우");
		for(let i in sList) {
			if(recommend-5 < sList[i]['s_X'] && sList[i]['s_X'] < recommendX && recommendY-5 < sList[i]['s_Y'] && sList[i]['s_Y'] < recommendY+5) {
				recommendStopName = sList[i]['s_NAME'];
				$('#mRecommendStop').append("<option id = 'mRecommendSelectBox' value ='"+recommendStopName+"'>"+recommendStopName+"</option>");
			}
		}//for문 end
		
	}//if문 end
	startX = recommendX;
	startY = recommendY;
	console.log("재설정된 전역변수"+startX, startY);
	j++;
}); 

var h = 2;
var k = 2;
$('#add').on('click', function() {
	$('#dispatch').append("<tr><td>차량번호 :</td><td><input type = 'text' class = 'motorNumber' name = 'motorNumber"+h+"'></td><td><select name = 'lowFloor"+h+"'><option value='일반'>일반</option><option value='저상'>저상</option></select></td></tr>");
	document.getElementById("motorCount").value = k;
	h++;
	k++;
});
$('#submitRoute').on('click', function(){
	h=2;
	k=1;
});

</script>
</html>
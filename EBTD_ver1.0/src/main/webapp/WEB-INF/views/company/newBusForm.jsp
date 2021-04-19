<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
	<div id="adminheader"><%@ include
			file="/WEB-INF/views/include/companyheader.jsp"%>
	</div>
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
				<input id="mBusNum">
				<p style="color: black;">동, 읍, 면 선택</p>
				<select id="mTownSelect"></select>
				<p style="color: black;">정류장 선택</p>
				<select id="mStopSelect"></select>
				<input type = "button" id = "stopConfi" value = "선택">
			</div>
			<div id = "busRouteSelect">
				
			</div>
			<div class="modal_footer">
				<p style="color: black;">copyright by</p>
			</div>
		</div>
	</div>
	<!--    모달 버튼 끝!    -->



	<div id="adminfooter"><%@ include
			file="/WEB-INF/views/include/companyfooter.jsp"%>

	</div>
</body>
<script>
let tList = ${tList};
let sList = ${sList};
let tName;
console.log(sList);
console.log(tList);

for(let i in tList) {
	let tName = tList[i]['t_NAME'];
	$('#mTownSelect').append("<option id = 'mTownSelectBox' value ='"+tName+"'>"+tName+"</option>");
	}
// 모달창 열기 이벤트
$("#myBtn").on("click", function(){
	  $.ajax({
		  type : 'get',
		  url : '/ebtd/ac/company/bus/busNumCheck',
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
	/* let selectStop = $('#mStopSelect').val();
	console.log(selectStop); */
});
//정류장 루트 짜기
$('#stopConfi').on('click', function() {
	let selectStop = $('#mStopSelect').val();
	let stopRoute = $('.stopRoute').val();
	console.log(selectStop);
	$('#busRouteSelect').append("<input type = 'text' class = 'stopRoute' value = '"+selectStop+"' readOnly>");
	
});  
</script>
</html>
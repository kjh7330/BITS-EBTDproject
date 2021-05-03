<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휠체어유저 - 즐겨찾기</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!--font-awesome CDN-->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
	rel="stylesheet">
</head>

<style>
#booklist { /* 즐겨찾기 전체 div */
	height: 90px;
	text-align: center;
	font-size: 14pt;
	color: black; /* width: 300px */
	padding-top: 15px;
	margin: 20px;
}

.bookList { /* 즐겨찾기 개인 div */
	height: 90px;
	text-align: center;
	font-size: 14pt;
	color: black; /* width:50px; */
	padding-top: 15px; /* margin: 20px; */
	border: 1px solid;
}

.starIcon { /* 폰트어썸 별 */
	color: yellow;
	font-size: 30px;
	border: 1px solid black;
}
/*   모달css랑 스크립트, 버튼html 복사해서 쓰세요~!   */
/*   스크립트는 맨 아래쪽에 있음   */
/*   모달 버튼은 스크립트 위에 있음   */
/* reset */
body, html {
	height: 100%;
}

h2, p, div, h3 {
	margin: 0;
	padding: 0
}

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
	color: black;
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
	color: black;
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
	<div id="userheader"><%@ include
			file="/WEB-INF/views/include/userheader.jsp"%></div>

	<!-- 즐겨찾기 리스트 -->
	<div id="booklist"></div>

	<!-- 모달 -->
	<div id="overlay">
		<div id="myModal" class="modal">
			<div class="modal_header">
				<h5>즐겨찾기 예약</h5>
				<span class="close">&times;</span>
			</div>
			<div class="modal_content">
				<p style="color: black">
				<div id="modalBookDeail"></div>
				<button onclick="location.href='#">예약</button>
				<!-- <button onclick="location.href='user/reservation?ub_no='">예약</button> -->
				<button id="modalOutBtn">취소</button>
				</p>
			</div>
		</div>
	</div>
	<!--    모달 버튼 끝!    -->
	<div id="userfooter"><%@ include
			file="/WEB-INF/views/include/userfooter.jsp"%></div>
</body>

<script type="text/javascript">
		let uBookList = ${uBookList};
		let str = '';
		console.log(uBookList);

		for(let i = 0; i < uBookList.length; i++){
			str += '<div class="starIcon"><i class="fas fa-splotch"></i></div>'; //폰트어썸 별
			str += '<div class="bookList" >';
			str += uBookList[i].ub_alias +'<br>';	//별칭
			//str += '<a href="#">';
			str += '['+ uBookList[i].b_no +'] ';	//버스번호	
			//str += '</a>';
			str += uBookList[i].s_nameStart;		//출발정류장
			str += '-->';
			str += uBookList[i].s_nameLast;			//도착정류장
			//console.log(i);
			str += '</div>';
		}
		$('#booklist').empty();
		$('#booklist').append(str); 
		
		 
		<!--     모달 스크립트만 가져가세요~!    -->
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
		<!--     모달 스크립트 여기까지~!     -->
		
		//취소버튼 누를 시 모달창 닫기
		$('#modalOutBtn').click(function modalOut(){
			$("#overlay").css({ visibility:"hidden", opacity:0 });
		});
		
		//즐겨찾기 클릭
		$('.bookList').click(function (){ 	// 모달창 열기 이벤트
			let p = '';
			$("#overlay").css({ visibility:"visible", opacity:1 });
			
			p = $(this).html();
			$('#modalBookDeail').empty();
			$('#modalBookDeail').append(p); 
		});

	</script>


</html>
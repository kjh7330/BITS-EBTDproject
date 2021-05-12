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
	#userBookmarkForm{	/* 폼태그 */
		display: none;
	}

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
		border: 0.2px solid;
	}
	
	.starIcon { /* 폰트어썸 별 */
		color: yellow;
		font-size: 20px;
		/* border: 0.3px solid black; */
	}


/*모달*/
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
/* 모달css 끝 */

</style>
<body>
	<div id="userheader"><%@ include
			file="/WEB-INF/views/include/userheader.jsp"%></div>

	<!-- 즐겨찾기 리스트 -->
	<form name="userBookmark" id="userBookmarkForm" action="/user/reservation" method="post">
	</form>
	<div id="booklist"></div> 
	

	<!-- 모달 -->
	<div id="overlay">
		<div id="myModal" class="modal">
			<div class="modal_header">
				<h5>즐겨찾기 예약</h5>
				<span class="close">&times;</span>
			</div>
			<div class="modal_content">
				<p id = 'modal_content_p' style="color: black">
					<button type="submit" id="reservationBtn">예약</button>
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
		let btn = $('#modal_content_p').html(); // 버튼 미리 저장
		let str = '';
		/* if(uBookList.length == 0){
			alert("예약 내역이 없습니다.");
		} */
		
		let i = 0;
		for(i = 0; i < uBookList.length; i++){
			str += '<div class="totalBookList" overflow="auto">'
			str += '<div class="starIcon"><span class="fa-stack fa-lg"><i class="far fa-star fa-stack-2x"></i><i  class="fas fa-star" id="star'+i+'"></i></span></div>'; //폰트어썸 꽉찬별
			//console.log( $('#star'+i) );
			str += '<div class="bookList">';
			str += '<input type="hidden" class="ub_no" name="ub_no" value="'+uBookList[i].ub_no+'">'	//즐겨찾기 번호
			str += '<input type="text" class="ub_alias" name="ub_alias" value="'+uBookList[i].ub_alias+'">'	//별칭
			str += '<input type="text" class="b_no" name="b_no" value="'+uBookList[i].b_no+'">'	//버스번호
			str += '<input type="text" class="s_nameStart" name="s_namestart" value="'+uBookList[i].s_namestart+'">'	//출발정류장
			str += '-->';
			str += '<input type="text" class="s_nameLast" name="s_namelast" value="'+uBookList[i].s_namelast+'">'	//도착정류장
			
			str += '<input type="hidden" class="u_userName" name="u_username" value="'+uBookList[i].u_username+'">'	//아이디
			str += '<input type="hidden" class="s_noStart" name="s_nostart" value="'+uBookList[i].s_nostart+'">'	//도착정류장ID
			str += '<input type="hidden" class="s_noLast" name="s_nolast" value="'+uBookList[i].s_nolast+'">'	//도착정류장ID
			str += '</div></div>';
		}
		$('#booklist').empty();
		$('#booklist').append(str); 
		
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
		
		
		//즐겨찾기 클릭
		$('.bookList').click(function (){ 	// 모달창 열기 이벤트
			$('#userBookmarkForm').html($(this).html());
			$("#overlay").css({ visibility:"visible", opacity:1 });
			
			$('#modal_content_p').html($(this).html());
			$('#modal_content_p').append(btn); 
			$('#reservationBtn').click(function(){
				
				let ub_no = $(this).parent().children('#userBookmarkForm').children('.ub_no').val();
				let u_userName = $(this).parent().children('#userBookmarkForm').children('.u_username').val();
				let s_noStart = $(this).parent().children('#userBookmarkForm').children('.s_nostart').val();
				let s_noLast = $(this).parent().children('#userBookmarkForm').children('.s_nolast').val();
				let b_no = $(this).parent().children('#userBookmarkForm').children('.b_no').val();
				let ub_alias = $(this).parent().children('#userBookmarkForm').children('.ub_alias').val();
				console.log($(this).parent().children('#userBookmarkForm').children('.ub_no').val());
				
				//예약 버튼 누르면
				if(ub_no != ''){
					$('form').trigger('submit');
				}else{
					console.log("즐겨찾기 값이 없습니다.");
				}
				//취소버튼 누를 시 모달창 닫기
				$('#modalOutBtn').click(function(){
					$("#overlay").css({ visibility:"hidden", opacity:0 });
				});
				
			});
		});
		
		//별 클릭
		$('.starIcon').click(function(){
			//off star
			if( $(this).children().children().last().css("color") == "rgb(255, 255, 0)" ){ 
				console.log("별이 켜진 상태에서 클릭");
				$(this).children().children().last().css("color", "white");
				
				let ub_no = $(this).parent().children('.bookList').children('.ub_no').val();
				$.ajax({
					type: 'post',
					url : "/user/deleteBookmark",
					data : { 'ub_no' : ub_no },
					dataType : 'html'
				}).done(function(data){
					console.log(data);
				}).fail(function(err){
					console.log(err,"!!!!!!!!!!");
				});
			}else{		//on star
				$(this).children().children().last().css("color", "rgb(255, 255, 0)"); 
				
				let ub_no = $(this).parent().children('.bookList').children('.ub_no').val();
				let u_userName = $(this).parent().children('.bookList').children('.u_userName').val();
				let s_noStart = $(this).parent().children('.bookList').children('.s_noStart').val();
				let s_noLast = $(this).parent().children('.bookList').children('.s_noLast').val();
				let b_no = $(this).parent().children('.bookList').children('.b_no').val();
				let ub_alias = $(this).parent().children('.bookList').children('.ub_alias').val();

				$.ajax({
					type: 'post',
					url : "/user/insertBookmark",
				 	data : 	{ 
				 				'ub_no' : ub_no,
				 				'u_userName' : u_userName,
				 				'b_no' : b_no,
				 				's_noStart' : s_noStart,
				 				's_noLast' : s_noLast,
				 				'ub_alias' : ub_alias
				 			},
					dataType : 'html'
				}).done(function(data){
					console.log(data);
	
				}).fail(function(err){
					console.log(err,"!!!!!!!!!!");
				});
			} //else end
		}); //별클릭 이벤트 end
		
		
		
		
	</script>


</html>
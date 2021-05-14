<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EBTD - 즐겨찾기 상세</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!--font-awesome CDN-->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
	rel="stylesheet">
</head>
<style>
.maindiv{
		color: black;
		text-align: center;
	}
    footer{
        position: fixed;
        left: 0px;
        bottom: 0px;
        height: 100px;
        width: 450px;
        z-index: 100;
    }
    .footer-container{
        background-color : #0C3D6A;
        height: 80px;
        text-align: center;
        padding-bottom: 20px;
        display: flex;
        justify-content: space-around;
    }
    .footer-container img{
        height: 60px;
    }
    .footerbtn{
    	background-color: #0C3D6A;
    	border:none;
    	cursor: pointer;
    }
    .mainbtn{
    	width: 350px;
    	height: 74px;
    	font-size: 35px;
    	margin-top: 22px;
    	background-color: #0C3D6A;
    	color: #f9eb99;
    	border-radius: 15px;
    	cursor: pointer;
    	margin-left:50px;
    }
	#bookListDiv { /* 즐겨찾기 전체 div */
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

</style>
<body>
	<div id="userheader"><%@ include
			file="/WEB-INF/views/include/userBlindHeader.jsp"%></div>
			
	<form name="userBookmark" id="userBookmarkForm" action="/user/reservation" method="post">
	</form>
	<div id="bookmarkDetail"></div> 
		
			
	<footer>
	     <div class="footer-container">
	         	<button id="btn1" class="footerbtn" onmousedown="mouseDown1()" onmouseup="mouseUp1()"><i style="font-size:95px;color:#f9eb99;" class="fas fa-arrow-left"></i></button>
	         	<button id="btn2" class="footerbtn" onmousedown="mouseDown2()" onmouseup="mouseUp2()"><i style="font-size:95px;color:#f9eb99;" class="fas fa-arrow-down"></i></button>
	         	<button id="btn3" class="footerbtn" onmousedown="mouseDown3()" onmouseup="mouseUp3()"><i style="font-size:95px;color:#f9eb99;" class="fas fa-arrow-right"></i></button>
	     </div>
	</footer>
</body>

<script type="text/javascript">
		let bookmark = ${bookmark};
		console.log(bookmark.b_no);
		let str = '';
		
			str += '<div class="bookmarkTotal" overflow="auto">';
			str += '<div class="bookmark">';
			str += '<button id="mbtn1" class="mainbtn">'+bookmark.b_no+'</button>';
			str += '<button id="mbtn2" class="mainbtn">'+bookmark.s_namestart+'</button>';
			str += '<button id="mbtn3" class="mainbtn">'+bookmark.s_namelast+'</button>';
			str += '<div id=quertyReservation style="color:black">&nbsp;</div>';
			str += '<button id="yes" class="mainbtn">예약하기</button>';
			str += '<button id="no" class="mainbtn">예약안하기</button>';
			
			str += '<input type="hidden" id="b_no" class="mainbtn" name="b_no"value="'+bookmark.b_no+'">';
			str += '<input type="hidden" class="u_username" name="u_username" value="'+bookmark.u_username+'">';	//아이디
			str += '<input type="hidden" class="ub_no" value="'+bookmark.ub_no+'">';	//즐겨찾기 번호
			str += '<input type="hidden" class="s_nostart" name="s_nostart" value="'+bookmark.s_nostart+'">';	//도착정류장ID
			str += '<input type="hidden" class="s_nolast" name="s_nolast" value="'+bookmark.s_nolast+'">';	//도착정류장ID
			str += '</div></div>';
		
		$('#bookmarkDetail').empty();
		$('#bookmarkDetail').append(str); 
		
		
		//예 버튼 클릭 --> 예약되고 시각장애인 메인 페이지로 이동
		$('#yes').click(function (){
			let ub_no = $(this).parent().children('#ub_no').val();
			console.log(ub_no);
	
			$('#userBookmarkForm').html( $(this).parent().html() );
			
			if(ub_no != ''){
				console.log(ub_no);
				$('form').trigger('submit');
			}else{
				console.log("즐겨찾기 값이 없습니다.");
			}
		});
		
		//아니오 버튼 클릭 --> 즐겨찾기리스트 페이지로 이동
		$('#no').click(function (){
			location.href = '/user/getBookmarkList';
		});
		
	</script>

<script>
		$('#btn1').click(function(){
			if(    $('#mbtn1').css('color') == 'rgb(249, 235, 153)' 
				&& $('#mbtn2').css('color') == 'rgb(249, 235, 153)'
				&& $('#mbtn3').css('color') == 'rgb(249, 235, 153)'
				&& $('#yes').css('color') == 'rgb(249, 235, 153)'
				&& $('#no').css('color') == 'rgb(249, 235, 153)'){
				   $('#no').css("background-color","#f9eb99").css("color","#0C3D6A");
			}else if ( $('#no').css('color') == 'rgb(12, 61, 106)' 
					&& $('#mbtn1').css('color') == 'rgb(249, 235, 153)' 
					&& $('#mbtn2').css('color') == 'rgb(249, 235, 153)' 
					&& $('#mbtn3').css('color') == 'rgb(249, 235, 153)' 
					&& $('#yes').css('color') == 'rgb(249, 235, 153)' ){
			  	   	   $('#no').css("background-color","#0C3D6A").css("color","#f9eb99");
				       $('#yes').css("background-color","#f9eb99").css("color","#0C3D6A");
			}else if ( $('#yes').css('color') == 'rgb(12, 61, 106)' 
					&& $('#mbtn1').css('color') == 'rgb(249, 235, 153)' 
					&& $('#mbtn2').css('color') == 'rgb(249, 235, 153)' 
					&& $('#mbtn3').css('color') == 'rgb(249, 235, 153)' 
					&& $('#no').css('color') == 'rgb(249, 235, 153)' ){
			  	   	   $('#yes').css("background-color","#0C3D6A").css("color","#f9eb99");
				       $('#mbtn3').css("background-color","#f9eb99").css("color","#0C3D6A");
			}else if ( $('#mbtn3').css('color') == 'rgb(12, 61, 106)' 
					&& $('#mbtn1').css('color') == 'rgb(249, 235, 153)' 
					&& $('#mbtn2').css('color') == 'rgb(249, 235, 153)' 
					&& $('#yes').css('color') == 'rgb(249, 235, 153)' 
					&& $('#no').css('color') == 'rgb(249, 235, 153)' ){
			  	   	   $('#mbtn3').css("background-color","#0C3D6A").css("color","#f9eb99");
				       $('#mbtn2').css("background-color","#f9eb99").css("color","#0C3D6A");
			}else if ( $('#mbtn2').css('color') == 'rgb(12, 61, 106)' 
					&& $('#mbtn1').css('color') == 'rgb(249, 235, 153)' 
					&& $('#mbtn3').css('color') == 'rgb(249, 235, 153)' 
					&& $('#yes').css('color') == 'rgb(249, 235, 153)' 
					&& $('#no').css('color') == 'rgb(249, 235, 153)' ){
			  	   	   $('#mbtn2').css("background-color","#0C3D6A").css("color","#f9eb99");
				       $('#mbtn1').css("background-color","#f9eb99").css("color","#0C3D6A");
			}else if ( $('#mbtn1').css('color') == 'rgb(12, 61, 106)' 
					&& $('#mbtn2').css('color') == 'rgb(249, 235, 153)' 
					&& $('#mbtn3').css('color') == 'rgb(249, 235, 153)' 
					&& $('#yes').css('color') == 'rgb(249, 235, 153)' 
					&& $('#no').css('color') == 'rgb(249, 235, 153)' ){
			  	   	   $('#mbtn1').css("background-color","#0C3D6A").css("color","#f9eb99");
				       $('#no').css("background-color","#f9eb99").css("color","#0C3D6A");
			}
		});
		
		$('#btn2').click(function(){
			if( $('#mbtn1').css('color') == 'rgb(12, 61, 106)' ){
				alert($('#mbtn1').html()+"번 버스");
			}else if( $('#mbtn2').css('color') == 'rgb(12, 61, 106)' ){
				alert($('#mbtn2').html());
			}else if( $('#mbtn3').css('color') == 'rgb(12, 61, 106)' ){
				alert($('#mbtn3').html());
			}else if( $('#yes').css('color') == 'rgb(12, 61, 106)' ){
				alert($('#yes').html());
			}else if( $('#no').css('color') == 'rgb(12, 61, 106)' ){
				alert($('#no').html());
			}
		});
		$('#btn3').click(function(){
			if(    $('#mbtn1').css('color') == 'rgb(249, 235, 153)' 
				&& $('#mbtn2').css('color') == 'rgb(249, 235, 153)'
				&& $('#mbtn3').css('color') == 'rgb(249, 235, 153)'
				&& $('#yes').css('color') == 'rgb(249, 235, 153)'
				&& $('#no').css('color') == 'rgb(249, 235, 153)'){
				   $('#mbtn1').css("background-color","#f9eb99").css("color","#0C3D6A");
			}else if ( $('#mbtn1').css('color') == 'rgb(12, 61, 106)' 
					&& $('#mbtn2').css('color') == 'rgb(249, 235, 153)' 
					&& $('#mbtn3').css('color') == 'rgb(249, 235, 153)' 
					&& $('#yes').css('color') == 'rgb(249, 235, 153)' 
					&& $('#no').css('color') == 'rgb(249, 235, 153)' ){
			  	   	   $('#mbtn1').css("background-color","#0C3D6A").css("color","#f9eb99");
				       $('#mbtn2').css("background-color","#f9eb99").css("color","#0C3D6A");
			}else if ( $('#mbtn2').css('color') == 'rgb(12, 61, 106)' 
					&& $('#mbtn1').css('color') == 'rgb(249, 235, 153)' 
					&& $('#mbtn3').css('color') == 'rgb(249, 235, 153)' 
					&& $('#yes').css('color') == 'rgb(249, 235, 153)' 
					&& $('#no').css('color') == 'rgb(249, 235, 153)' ){
			  	   	   $('#mbtn2').css("background-color","#0C3D6A").css("color","#f9eb99");
				       $('#mbtn3').css("background-color","#f9eb99").css("color","#0C3D6A");
			}else if ( $('#mbtn3').css('color') == 'rgb(12, 61, 106)' 
					&& $('#mbtn1').css('color') == 'rgb(249, 235, 153)' 
					&& $('#mbtn2').css('color') == 'rgb(249, 235, 153)' 
					&& $('#yes').css('color') == 'rgb(249, 235, 153)' 
					&& $('#no').css('color') == 'rgb(249, 235, 153)' ){
			  	   	   $('#mbtn3').css("background-color","#0C3D6A").css("color","#f9eb99");
				       $('#yes').css("background-color","#f9eb99").css("color","#0C3D6A");
			}else if ( $('#yes').css('color') == 'rgb(12, 61, 106)' 
					&& $('#mbtn1').css('color') == 'rgb(249, 235, 153)' 
					&& $('#mbtn2').css('color') == 'rgb(249, 235, 153)' 
					&& $('#mbtn3').css('color') == 'rgb(249, 235, 153)' 
					&& $('#no').css('color') == 'rgb(249, 235, 153)' ){
			  	   	   $('#yes').css("background-color","#0C3D6A").css("color","#f9eb99");
				       $('#no').css("background-color","#f9eb99").css("color","#0C3D6A");
			}else if ( $('#no').css('color') == 'rgb(12, 61, 106)' 
					&& $('#mbtn1').css('color') == 'rgb(249, 235, 153)' 
					&& $('#mbtn2').css('color') == 'rgb(249, 235, 153)' 
					&& $('#mbtn3').css('color') == 'rgb(249, 235, 153)' 
					&& $('#yes').css('color') == 'rgb(249, 235, 153)' ){
			  	   	   $('#no').css("background-color","#0C3D6A").css("color","#f9eb99");
				       $('#mbtn1').css("background-color","#f9eb99").css("color","#0C3D6A");
			}
		});
		//버튼 두번 클릭 혹은 롱 클릭
		let timer;
		let istrue = false;
		function mouseDown1(){
			timer1 = setTimeout(function(){holding1();},2000);
		}
		function mouseUp1(){
			clearTimeout(timer1);
		}
		function holding1(){
			window.history.back();
		}
		function mouseDown2(){
			timer2 = setTimeout(function(){holding2();},2000);
		}
		function mouseUp2(){
			clearTimeout(timer2);
		}
		function holding2(){
			if( $('#yes').css('color') == 'rgb(12, 61, 106)' ){
				$('#yes').trigger('click');
			}else if( $('#no').css('color') == 'rgb(12, 61, 106)' ){
				window.history.back();
			}
		}
		function mouseDown3(){
			timer3 = setTimeout(function(){holding3();},2000);
		}
		function mouseUp3(){
			clearTimeout(timer3);
		}
		/* function holding3(){
			location.href = '/user/loginForm';
		} */

		</script>

</html>
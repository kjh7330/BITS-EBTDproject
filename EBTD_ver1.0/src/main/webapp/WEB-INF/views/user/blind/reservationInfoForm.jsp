<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시각유저 - 즐겨찾기 상세</title>
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
    	height: 150px;
    	font-size: 50px;
    	margin-top: 95px;
    	background-color: #0C3D6A;
    	color: #f9eb99;
    	border-radius: 15px;
    	cursor: pointer;
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
			file="/WEB-INF/views/include/userheader.jsp"%></div>
			
		<div id="reservationInfo"></div>
		
			
	<footer>
	     <div class="footer-container">
	         	<button id="btn1" class="footerbtn" onmousedown="mouseDown1()" onmouseup="mouseUp1()"><i style="font-size:95px;color:#f9eb99;" class="fas fa-arrow-left"></i></button>
	         	<button id="btn2" class="footerbtn" onmousedown="mouseDown2()" onmouseup="mouseUp2()"><i style="font-size:95px;color:#f9eb99;" class="fas fa-arrow-down"></i></button>
	         	<button id="btn3" class="footerbtn" onmousedown="mouseDown3()" onmouseup="mouseUp3()"><i style="font-size:95px;color:#f9eb99;" class="fas fa-arrow-right"></i></button>
	     </div>
	</footer>
</body>

<script type="text/javascript">
		let reservation = ${uReserveList};
		console.log(uReserveList.b_no);
		let str = '';
		
			str += '<div class="bookmarkTotal" overflow="auto">';
			str += '<div class="bookmark">';
			str += '<button id="mbtn" class="mainbtn">'+reservation.b_no+'</button>';
			str += '<button id="mbtn" class="mainbtn">'+bookmark.s_namestart+'</button>';
			str += '<button id="mbtn" class="mainbtn">'+bookmark.s_namelast+'</button>';
			
			str += '<input type="hidden" class="mainbtn" name="b_no">'+reservation.b_no+'</button>';
			str += '<input type="hidden" class="ub_no" name="u_username" value="'+reservation.u_username+'">';	//아이디
			str += '<input type="hidden" class="ub_no" name="ub_no" value="'+reservation.ur_no+'">';	//예약번호
			str += '<input type="hidden" class="s_noStart" name="s_noStart" value="'+reservation.s_nostart+'">';	//도착정류장ID
			str += '<input type="hidden" class="s_noLast" name="s_noLast" value="'+reservation.s_nolast+'">';	//도착정류장ID
			str += '<button id="cancelBtn" class="mainbtn">예약취소</button>';
			str += '<div></div>';
		
		$('#reservationInfo').empty();
		$('#reservationInfo').append(str); 
		
		
		//예약취소 버튼
		$(".cancelBtn").click(function(){
			let ur_no = $(this).parent().children('.ur_no').val();
			console.log(ur_no);
			/* console.log(ur_no);
			location.href = '/user/reservation?ur_no='+ur_no; */
			/* 
			if(ur_no != ''){
				console.log(ur_no);
				$('form').trigger('submit');
			}else{
				console.log("즐겨찾기 값이 없습니다.");
			} */
		});
		
	</script>

<script>
		$('#btn1').click(function(){
			if(    $('#mbtn2').css('color') == 'rgb(249, 235, 153)' 
				&& $('#mbtn1').css('color') == 'rgb(249, 235, 153)' ){
				   $('#mbtn2').css("background-color","#f9eb99").css("color","#0C3D6A");
			}else if ( $('#mbtn2').css('color') == 'rgb(12, 61, 106)' 
					&& $('#mbtn1').css('color') == 'rgb(249, 235, 153)' ){
			  	   	   $('#mbtn2').css("background-color","#0C3D6A").css("color","#f9eb99");
				       $('#mbtn1').css("background-color","#f9eb99").css("color","#0C3D6A");
			}else if ( $('#mbtn2').css('color') == 'rgb(249, 235, 153)'
					&& $('#mbtn1').css('color') == 'rgb(12, 61, 106)' ){
			           $('#mbtn2').css("background-color","#f9eb99").css("color","#0C3D6A");
		  	   	   	   $('#mbtn1').css("background-color","#0C3D6A").css("color","#f9eb99");
			}
		});
		
		$('#btn2').click(function(){
			if( $('#mbtn1').css('color') == 'rgb(12, 61, 106)' ){
				//location.href = '/user/???';
				console.log("아직 페이지 이동할 곳이 없음!");
			}else if( $('#mbtn2').css('color') == 'rgb(12, 61, 106)' ){
				location.href = '/user/myPage';
			}
		});
		$('#btn3').click(function(){
			if(    $('#mbtn1').css('color') == 'rgb(249, 235, 153)' 
				&& $('#mbtn2').css('color') == 'rgb(249, 235, 153)' ){
				   $('#mbtn1').css("background-color","#f9eb99").css("color","#0C3D6A");
			}else if ( $('#mbtn1').css('color') == 'rgb(12, 61, 106)' 
					&& $('#mbtn2').css('color') == 'rgb(249, 235, 153)' ){
			  	   	   $('#mbtn1').css("background-color","#0C3D6A").css("color","#f9eb99");
				       $('#mbtn2').css("background-color","#f9eb99").css("color","#0C3D6A");
			}else if ( $('#mbtn1').css('color') == 'rgb(249, 235, 153)'
					&& $('#mbtn2').css('color') == 'rgb(12, 61, 106)' ){
			           $('#mbtn1').css("background-color","#f9eb99").css("color","#0C3D6A");
		  	   	   	   $('#mbtn2').css("background-color","#0C3D6A").css("color","#f9eb99");
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
			alert('이전페이지가 없음!!');
			//location.href = '/user/???';
		}
		function mouseDown2(){
			timer2 = setTimeout(function(){holding2();},2000);
		}
		function mouseUp2(){
			clearTimeout(timer2);
		}
		/* function holding2(){
			alert('holding');
		} */
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
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
    	height: 150px;
    	font-size: 40px;
    	margin-top: 95px;
    	background-color: #0C3D6A;
    	color: #f9eb99;
    	border-radius: 15px;
    	cursor: pointer;
    	margin-bottom:50px;
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
	#bookmarkDetail input{
		border: none;
		font-size: 21px;
		width: 180px;
		text-align: center;
	}
	#bookmarkDetail{
		margin-left: 48px;
	}


</style>
<body>
	<div id="userheader"><%@ include
			file="/WEB-INF/views/include/userBlindHeader.jsp"%></div>
			
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
		let str = '';
		console.log("==============");
		console.log(bookmark);
		
			str += '<div class="bookmarkTotal" overflow="auto">';
			str += '<div class="bookmark">';
			str += '<button id="mbtn" class="mainbtn">'+bookmark.ub_alias+'</button>';
			str += '<input type="text" class="ub_no" name="ub_no" value="'+bookmark.ub_no+'">';	//즐겨찾기 번호
			str += '<input type="text" class="b_no" name="b_no" value="'+bookmark.b_no+'">';//버스번호
			str += '<input type="text" class="s_nameStart" name="s_nameStart" value="'+bookmark.s_namestart+'">';	//출발정류장
			str += '<input type="text" class="s_nameLast" name="s_nameLast" value="'+bookmark.s_namelast+'">';	//도착정류장
			str += '<input type="text" class="s_noStart" name="s_noStart" value="'+bookmark.s_nostart+'">';	//도착정류장ID
			str += '<input type="text" class="s_noLast" name="s_noLast" value="'+bookmark.s_nolast+'">';	//도착정류장ID
			str += '<div></div>';
		
		$('#bookmarkDetail').empty();
		$('#bookmarkDetail').append(str); 
		
		
		//다음 버스(~분뒤) 클릭하면
		$('.bookmark').click(function (){
			let ub_no = $(this).children('.ub_no').val();
			console.log(ub_no);
			location.href = '/user/queryReservation?ub_no='+ub_no;
		});
		
	</script>

<script>
		$('#btn1').click(function(){
			if(    $('#mbtn').css('color') == 'rgb(249, 235, 153)' ){
				   $('#mbtn').css("background-color","#f9eb99").css("color","#0C3D6A");
			}else if ( $('#mbtn').css('color') == 'rgb(12, 61, 106)' ){
			  	   	   $('#mbtn').css("background-color","#0C3D6A").css("color","#f9eb99");
			}else if ( $('#mbtn').css('color') == 'rgb(249, 235, 153)'){
			           $('#mbtn').css("background-color","#f9eb99").css("color","#0C3D6A");
			}
		});
		
		$('#btn2').click(function(){
			if( $('#mbtn').css('color') == 'rgb(12, 61, 106)' ){
				alert($('.mainbtn').html());
			}else if( $('#mbtn2').css('color') == 'rgb(12, 61, 106)' ){
				location.href = '/user/myPage';
			}
		});
		$('#btn3').click(function(){
			if(    $('#mbtn').css('color') == 'rgb(249, 235, 153)' ){
				   $('#mbtn').css("background-color","#f9eb99").css("color","#0C3D6A");
			}else if ( $('#mbtn').css('color') == 'rgb(12, 61, 106)' ){
			  	   	   $('#mbtn').css("background-color","#0C3D6A").css("color","#f9eb99");
			}else if ( $('#mbtn').css('color') == 'rgb(249, 235, 153)'){
			           $('#mbtn').css("background-color","#f9eb99").css("color","#0C3D6A");
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
				$('.bookmark').trigger('click');
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
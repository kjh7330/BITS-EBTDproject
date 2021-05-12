<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>EBTD - 메인</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/v4-shims.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">

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
    	margin-top: 75px;
    	background-color: #0C3D6A;
    	color: #f9eb99;
    	border-radius: 15px;
    	cursor: pointer;
    }
    
    /* #mbtn3{
    	display: none;
    } */

</style>
</head>
<body>
<div id="userheader"><%@ include file="/WEB-INF/views/include/userBlindHeader.jsp"%></div>
<div class="maindiv">
	
		<button id="mbtn1" class="mainbtn" style="margin-left:50px;" onclick="location.href='/user/getBookmarkList'">즐겨찾기</button>
		<button id="mbtn3" class="mainbtn" onclick="location.href='/user/blind/getReservationInfo'">예약확인</button>
		<button id="mbtn2" class="mainbtn" onclick="location.href='/user/myPage'">마이페이지</button>
</div>

<footer>
     <div class="footer-container">
         	<button id="btn1" class="footerbtn" onmousedown="mouseDown1()" onmouseup="mouseUp1()"><i style="font-size:95px;color:#f9eb99;" class="fas fa-arrow-left"></i></button>
         	<button id="btn2" class="footerbtn" onmousedown="mouseDown2()" onmouseup="mouseUp2()"><i style="font-size:95px;color:#f9eb99;" class="fas fa-arrow-down"></i></button>
         	<button id="btn3" class="footerbtn" onmousedown="mouseDown3()" onmouseup="mouseUp3()"><i style="font-size:95px;color:#f9eb99;" class="fas fa-arrow-right"></i></button>
     </div>
</footer>

<script type="text/javascript">

	let reservation = '${urList}';
	console.dir(reservation);
	
	//예약 내역이 없으면 mbt1(즐겨찾기) display - mbt3(예약확인) display none
	if(reservation.length === 2){
		$("#mbtn1").css({ display:"block"});
		$("#mbtn3").css({ display:"none"});
	}else{ //예약 내역이 있으면 mbt3(예약확인) display - mbt1(즐겨찾기) display none
		$("#mbtn1").css({ display:"none"});
		$("#mbtn3").css({ display:"block"});
	} 
	
</script>

<script>
		
		$('#btn1').click(function(){
			if(    $('#mbtn1').css('color') == 'rgb(249, 235, 153)' 
				&& $('#mbtn2').css('color') == 'rgb(249, 235, 153)' ){
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
				alert("즐겨찾기");
			}else if( $('#mbtn2').css('color') == 'rgb(12, 61, 106)' ){
				alert("마이 페이지");
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
		function holding2(){
			if( $('#mbtn1').css('color') == 'rgb(12, 61, 106)' ){
				location.href = '/user/getBookmarkList';
			}else if( $('#mbtn2').css('color') == 'rgb(12, 61, 106)' ){
				location.href = '/user/myPage';
			}
		}
		function mouseDown2(){
			timer2 = setTimeout(function(){holding2();},2000);
		}
		function mouseUp2(){
			clearTimeout(timer2);
		}
		function mouseDown3(){
			timer3 = setTimeout(function(){holding3();},2000);
		}
		function mouseUp3(){
			clearTimeout(timer3);
		}
		
</script>
</body>
</html>
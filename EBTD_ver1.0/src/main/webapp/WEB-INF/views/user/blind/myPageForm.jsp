<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>EBTD - 마이페이지</title>
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
    	height: 140px;
    	font-size: 50px;
    	margin-top: 28px;
    	background-color: #0C3D6A;
    	color: #f9eb99;
    	border-radius: 15px;
    	cursor: pointer;
    }

</style>
</head>
<body>
<div id="userheader"><%@ include file="/WEB-INF/views/include/userBlindHeader.jsp"%></div>
<div class="maindiv">
<!-- 	<div class="menudetail" id="logout"><a>로그아웃</a></div> -->
	
		<button id="mbtn1" class="mainbtn" onclick="location.href='/user/getUserMyInfo'">내 정보 확인</button>
		<button id="mbtn2" class="mainbtn" onclick="location.href='/user/getReservationHistoryList'">이용 내역</button>
		<button id="mbtn3" class="mainbtn" onclick="location.href='/user/getMyQuestionList'">소리함</button>
	
</div>

<footer>
     <div class="footer-container">
         	<button id="btn1" class="footerbtn" onmousedown="mouseDown1()" onmouseup="mouseUp1()"><i style="font-size:95px;color:#f9eb99;" class="fas fa-arrow-left"></i></button>
         	<button id="btn2" class="footerbtn" onmousedown="mouseDown2()" onmouseup="mouseUp2()"><i style="font-size:95px;color:#f9eb99;" class="fas fa-arrow-down"></i></button>
         	<button id="btn3" class="footerbtn" onmousedown="mouseDown3()" onmouseup="mouseUp3()"><i style="font-size:95px;color:#f9eb99;" class="fas fa-arrow-right"></i></button>
     </div>
</footer>
<script>
$('#btn1').click(function(){
	if(    $('#mbtn1').css('color') == 'rgb(249, 235, 153)' 
		&& $('#mbtn2').css('color') == 'rgb(249, 235, 153)'
		&& $('#mbtn3').css('color') == 'rgb(249, 235, 153)' ){
		   $('#mbtn3').css("background-color","#f9eb99").css("color","#0C3D6A");
	}else if ( $('#mbtn3').css('color') == 'rgb(12, 61, 106)' 
			&& $('#mbtn2').css('color') == 'rgb(249, 235, 153)'
			&& $('#mbtn1').css('color') == 'rgb(249, 235, 153)' ){
	  	   	   $('#mbtn1').css("background-color","#0C3D6A").css("color","#f9eb99");
		       $('#mbtn2').css("background-color","#f9eb99").css("color","#0C3D6A");
		       $('#mbtn3').css("background-color","#0C3D6A").css("color","#f9eb99");
	}else if ( $('#mbtn1').css('color') == 'rgb(249, 235, 153)'
			&& $('#mbtn2').css('color') == 'rgb(12, 61, 106)' 
			&& $('#mbtn3').css('color') == 'rgb(249, 235, 153)' ){
	   	   	   $('#mbtn3').css("background-color","#0C3D6A").css("color","#f9eb99");
	           $('#mbtn2').css("background-color","#0C3D6A").css("color","#f9eb99");
	           $('#mbtn1').css("background-color","#f9eb99").css("color","#0C3D6A");
	}else if ( $('#mbtn3').css('color') == 'rgb(249, 235, 153)'
			&& $('#mbtn2').css('color') == 'rgb(249, 235, 153)'
			&& $('#mbtn1').css('color') == 'rgb(12, 61, 106)' ){
	           $('#mbtn3').css("background-color","#f9eb99").css("color","#0C3D6A");
	   	   	   $('#mbtn2').css("background-color","#0C3D6A").css("color","#f9eb99");
	           $('#mbtn1').css("background-color","#0C3D6A").css("color","#f9eb99");
	}
});

$('#btn2').click(function(){
	if( $('#mbtn1').css('color') == 'rgb(12, 61, 106)' ){
		location.href = '/user/getUserMyInfo';
	}else if( $('#mbtn2').css('color') == 'rgb(12, 61, 106)' ){
		location.href = '/user/getReservationHistoryList';
	}else if( $('#mbtn3').css('color') == 'rgb(12, 61, 106)' ){
		location.href = '/user/getMyQuestionList';
	}
});
$('#btn3').click(function(){
	if(    $('#mbtn1').css('color') == 'rgb(249, 235, 153)' 
		&& $('#mbtn2').css('color') == 'rgb(249, 235, 153)'
		&& $('#mbtn3').css('color') == 'rgb(249, 235, 153)' ){
		   $('#mbtn1').css("background-color","#f9eb99").css("color","#0C3D6A");
	}else if ( $('#mbtn1').css('color') == 'rgb(12, 61, 106)' 
			&& $('#mbtn2').css('color') == 'rgb(249, 235, 153)'
			&& $('#mbtn3').css('color') == 'rgb(249, 235, 153)' ){
	  	   	   $('#mbtn1').css("background-color","#0C3D6A").css("color","#f9eb99");
		       $('#mbtn2').css("background-color","#f9eb99").css("color","#0C3D6A");
		       $('#mbtn3').css("background-color","#0C3D6A").css("color","#f9eb99");
	}else if ( $('#mbtn1').css('color') == 'rgb(249, 235, 153)'
			&& $('#mbtn2').css('color') == 'rgb(12, 61, 106)' 
			&& $('#mbtn3').css('color') == 'rgb(249, 235, 153)' ){
	   	   	   $('#mbtn1').css("background-color","#0C3D6A").css("color","#f9eb99");
	           $('#mbtn2').css("background-color","#0C3D6A").css("color","#f9eb99");
	           $('#mbtn3').css("background-color","#f9eb99").css("color","#0C3D6A");
	}else if ( $('#mbtn1').css('color') == 'rgb(249, 235, 153)'
			&& $('#mbtn2').css('color') == 'rgb(249, 235, 153)'
			&& $('#mbtn3').css('color') == 'rgb(12, 61, 106)' ){
	           $('#mbtn1').css("background-color","#f9eb99").css("color","#0C3D6A");
	   	   	   $('#mbtn2').css("background-color","#0C3D6A").css("color","#f9eb99");
	           $('#mbtn3').css("background-color","#0C3D6A").css("color","#f9eb99");
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
	location.href = '/user/loginForm';
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
		
$('#logout').click(function () {
	location.href = '/user/logout';
});
</script>
</body>
</html>
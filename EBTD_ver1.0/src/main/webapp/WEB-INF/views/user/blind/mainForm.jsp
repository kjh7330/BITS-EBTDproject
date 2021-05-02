<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>시각 - 메인</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/v4-shims.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">

	.maindiv{
		color: black;
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

</style>
</head>
<body>
<div id="userheader"><%@ include file="/WEB-INF/views/include/userWheelHeader.jsp"%></div>
<div class="maindiv">
<p>${sessionScope.u_username}</p>님 환영합니다~!
	
	시각 - 메인
	
	<div class="menudetail" id="logout"><a>로그아웃</a></div>
	
	<div>


	</div>
	
</div>

<footer>
     <div class="footer-container">
         	<button class="footerbtn" ondblclick="dbClick1()" onmousedown="mouseDown1()" onmouseup="mouseUp1()"><i style="font-size:95px;color:#f9eb99;" class="fas fa-arrow-left"></i></button>
         	<button class="footerbtn" ondblclick="dbClick2()" onmousedown="mouseDown2()" onmouseup="mouseUp2()"><i style="font-size:95px;color:#f9eb99;" class="fas fa-arrow-down"></i></button>
         	<button class="footerbtn" ondblclick="dbClick3()" onmousedown="mouseDown3()" onmouseup="mouseUp3()"><i style="font-size:95px;color:#f9eb99;" class="fas fa-arrow-right"></i></button>
     </div>
</footer>
<script>
		//버튼 두번 클릭 혹은 롱 클릭
		let timer;
		let istrue = false;
		function mouseDown1(){
			istrue1 = true;
			timer1 = setTimeout(function(){holding1();},2000);
		}
		function holding1(){
			if(timer1)
				clearTimeout(timer1);
			if(istrue1){
				alert('holding');
			}
		}
		function mouseDown2(){
			istrue2 = true;
			timer2 = setTimeout(function(){holding2();},2000);
		}
		function holding2(){
			if(timer2)
				clearTimeout(timer2);
			if(istrue2){
				alert('holding');
			}
		}
		function mouseDown3(){
			istrue3 = true;
			timer3 = setTimeout(function(){holding3();},2000);
		}
		function holding3(){
			if(timer3)
				clearTimeout(timer3);
			if(istrue3){
				alert('holding');
			}
		}
		
		function mouseUp1(){
			istrue = false;
		}
		function mouseUp2(){
			istrue = false;
		}
		function mouseUp3(){
			istrue = false;
		}
		function dbClick1(){
			alert('double click');
		}
		function dbClick2(){
			alert('double click');
		}
		function dbClick3(){
			alert('double click');
		}
		
$('#logout').click(function () {
	location.href = '/user/logout';
});
</script>
</body>
</html>
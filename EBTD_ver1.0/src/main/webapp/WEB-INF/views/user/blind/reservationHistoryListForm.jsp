<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"   %> 
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>내 정보 확인</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/v4-shims.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
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
    .main-container{
		color: black;
		margin: 15px;
	}
	.maintable{
		width: 410px;
		height: 100px;
		font-size: 15px;
		text-align: center;
	}

</style>
</head>
<body>
<div id="userheader"><%@ include file="/WEB-INF/views/include/userWheelHeader.jsp"%></div>
<div class="main-container">
	<div class="maindiv">
		<table class="maintable">
			<tr>
				<td>이용일자</td><td>노선번호</td><td>상세보기</td>
			</tr>
			<c:forEach var="ub" items="${ubList}">
			<tr>
				<td>${ub.ur_date}</td><td>${ub.b_no}</td><td><button onclick="location.href='/user/getReservationHistoryDetail?ur_no=${ub.ur_no}'">상세</button></td>
			</tr>
			</c:forEach>
		</table>
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
$('#btn1').click(function(){
	if(    $('.btn').css('background-color') == 'rgb(249, 235, 153)' ){
		   $('.btn').css("background-color","lightgray");
	}else if ( $('.btn').css("background-color") == "rgb(211, 211, 211)" ){
			   $('.btn').css("background-color","rgb(249, 235, 153)");
	}
});

$('#btn2').click(function(){
	if( $('.btn').css('background-color') == 'rgb(211, 211, 211)' ){
		$('.btn').trigger('click');
	}
});
$('#btn3').click(function(){
	if(    $('.btn').css('background-color') == 'rgb(249, 235, 153)' ){
		   $('.btn').css("background-color","lightgray");
	}else if ( $('.btn').css("background-color") == "rgb(211, 211, 211)" ){
			   $('.btn').css("background-color","rgb(249, 235, 153)");
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
	location.href = '/user/myPage';
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
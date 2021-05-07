<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"   %> 
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>고객 소리함</title>
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
	}
	.divbtn{
		margin-top: 20px;
		margin-right: 10px;
		text-align: right;
	}
	.btn{
		background-color: #f9eb99;
		width: 90px;
		height: 40px;
		font-size: 20px;
		border-radius: 10px;
		border: none;
		cursor: pointer;
	}
	.btn:hover{
		background-color: lightgray;
	}
	.divtable{
		margin-left: 15px;
		margin-top: 10px;
	}
	.tablestyle{
		width: 425px;
		border-bottom: 1px solid black;
		border-collapse: collapse;
		text-align: center;
	}
	.tablestyle td{
		border-bottom: 1px solid black;
		border-collapse: collapse;
		height: 30px;
	}
	.tabletitle{
		font-weight: bold;
	}

</style>
</head>
<body>
<div id="userheader"><%@ include file="/WEB-INF/views/include/userWheelHeader.jsp"%></div>
<div class="main-container">
	<div class="divbtn">
		<a href="/user/getMyQuestionWrite"><button class="btn">작성</button></a>
	</div>
	<div class="divtable">
	<table class="tablestyle">
		<tr style="background-color: lightgray;">
			<td class="tabletitle">번호</td>
			<td class="tabletitle">버스번호</td>
			<td class="tabletitle">제목</td>
			<td class="tabletitle">작성일</td>
		</tr>
		<tr>
			<td>번호</td>
			<td>버스번호</td>
			<td><a style="text-decoration: none; color:black" href="/user/getMyQuestionDetail?v_no=${v.v_no}">제목</a></td>
			<td>작성일</td>
		</tr>
		<c:forEach var="v" items="${vList}">
		<tr>
			<td>${v.v_no}</td>
			<td>${v.b_no}</td>
			<td><a style="text-decoration: none;" href="/user/getMyQuestionDetail?v_no=${v.v_no}">${v.v_title}</a></td>
			<td>${v.v_date}</td>
		</tr>
		</c:forEach>
	</table>
	</div>
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
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
	.divinput{
		margin: 15px;
		font-size: 18px;
	}
	.inputtitle{
		width: 359px;
		height: 25px;
	}
	.inputcontent{
		margin-top: 5px;
		width: 412px;
		height: 380px;
	}
	.file{
		width: 80px;
		height: 30px;
		text-align: center;
		margin-top: 10px;
		margin-right: 10px;
		font-size: 18px;
	}
	.img{
		width: 313px;
		height: 30px;
		margin-top: 10px;
		font-size: 18px;
	}
	.btn{
		margin-top: 11px;
		margin-left: 39.5%;
		width: 90px;
		height: 45px;
		font-size: 18px;
		cursor: pointer;
		border-radius: 10px;
		border: none;
	}
	.btn:hover{
		background-color: #f9eb99;
	}
	.select{
		width: 100px;
		height: 30px;
		margin-top: 10px;
	}
	.input1{
		font-size: 18px;
		border: none;
		text-align: right;
	}
	
</style>
</head>
<body>
<div id="userheader"><%@ include file="/WEB-INF/views/include/userWheelHeader.jsp"%></div>
<div class="main-container">
	<div>
		<div class="divinput">
		<form action="setMyQuestionWrite" method="post">
		<!-- c:forEach var="v" items="${vList}"-->
			<input class="username" type="hidden" name="u_username" value="${v.u_username}">
			제목 : <input class="inputtitle" name="v_title" value="${v.v_title}">
			버스번호 : <select class="select"></select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			평가 : <select class="select" name="voc_recommend"><option value="1">추천</option><option value="-1">비추천</option></select>
			<input class="inputcontent" name="v_content" value="${v.v_content}">
			<input class="file" value="첨부파일"><input class="img" value="사진.${v.imgextention}">
		<!-- /c:forEach-->
			<a href="/user/getMyQuestionList"><input type="submit" class="btn" value="확인"></a>
		</form>
		</div>
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
	if(    $('.btn').css('background-color') == 'rgb(239, 239, 239)' ){
		   $('.btn').css("background-color","rgb(249, 235, 153)");
	}else if ( $('.btn').css("background-color") == "rgb(249, 235, 153)" ){
			   $('.btn').css("background-color","rgb(239, 239, 239)");
	}
});
$('#btn3').click(function(){
	if(    $('.btn').css('background-color') == 'rgb(239, 239, 239)' ){
		   $('.btn').css("background-color","rgb(249, 235, 153)");
	}else if ( $('.btn').css("background-color") == "rgb(249, 235, 153)" ){
			   $('.btn').css("background-color","rgb(239, 239, 239)");
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
	location.href = '/user/getMyQuestionList';
}
function mouseDown2(){
	timer2 = setTimeout(function(){holding2();},2000);
}
function mouseUp2(){
	clearTimeout(timer2);
}
function holding2(){
	$('.btn').trigger('click');
}
function mouseDown3(){
	timer3 = setTimeout(function(){holding3();},2000);
}
function mouseUp3(){
	clearTimeout(timer3);
}
		$.ajax({
			type : 'get',
			url : 'getReservationBusNum',
			dataType : 'json',
			data : {
				'u_username' : $('.username').val()
			},
			success : function(data){
				console.log(data);
				$('.option').html('');
				let op = '';
				for(i in data){
					op += '<option name="b_no">' + data[i]["b_no"] +'</option>';
				}
				$('.option').append(op);
			},
			error : function(err){
				console.log(err,'@@@@');
			}
		});
		
$('#logout').click(function () {
	location.href = '/user/logout';
});
</script>
</body>
</html>
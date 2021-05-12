<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"   %> 
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>EBTD - 고객 소리함</title>
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
		font-size: 18px;
	}
	.inputcontent{
		vertical-align: top;
		margin-top: 5px;
		width: 412px;
		height: 400px;
		font-size: 18px;
	}
	.btn{
		margin-top: 30px;
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
<div id="userheader"><%@ include file="/WEB-INF/views/include/userBlindHeader.jsp"%></div>
<div class="main-container">
	<div>
		<div class="divinput">
		<form action="setMyQuestionWrite" method="post">
		<!-- c:forEach var="v" items="${vList}"-->
			<input class="c_username" type="hidden" name="c_username">
			<input class="u_username" type="hidden" name="u_username">
			제목 : <input class="inputtitle" name="v_title" value="">
			버스번호 : <select id="busnum" class="select" name="b_no" onchange="fn()" >
			<option value="none" disabled>선택하세요</option>
			</select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			평가 : <select id="busvoc" class="select" name="voc_recommend"><option value="1">추천</option><option value="-1">비추천</option></select>
			<textarea class="inputcontent" name="v_content" cols="40" rows="8" ></textarea>
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
		$('#busnum').html('');
		let op = '';
			for(i in data){
				op += '<option data-c_username = "' + data[i]["c_userName"] +'" data-u_username = "' + data[i]["u_userName"] +'" style="font-size: 15px;">' + data[i]["b_no"] +'</option>';
			}
			
		$('#busnum').append(op); 

	},
	error : function(err){
		console.log(err,'@@@@');
	}
});

function fn(){
	
	$('.c_username').val( $('#busnum option:selected').attr('data-c_username') );
	$('.u_username').val( $('#busnum option:selected').attr('data-u_username') );
	
	//let val = $('#busnum option:selected').val();
	
}

$('#logout').click(function () {
	location.href = '/user/logout';
});
</script>
</body>
</html>
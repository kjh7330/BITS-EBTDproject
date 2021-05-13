<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"   %> 
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>EBTD - 내 정보 확인</title>
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
		height: 500px;
		font-size: 23px;
		text-align: center;
		background-color: #f9eb99;
	}
	.input{
		border: none;
		background-color: #f9eb99;
		font-size: 23px;
		text-align: center;
	}
	.input:focus{
		outline: none;
	}
	#add{
		width: 150px;
		height: 45px;
		font-size: 20px;
		border-radius: 8px;
	}
	#add:hover{
		background-color: #0C3D6A;
		color: white;
		cursor: pointer;
	}
	#ub_alias{
		width: 210px;
		height: 25px;
		font-size: 15px;
	}
	#submit{
		width: 50px;
		height: 30px;
	}
	#submit:hover{
		background-color: #0C3D6A;
		color: white;
		cursor: pointer;
	}

</style>
</head>
<body>
<div id="userheader"><%@ include file="/WEB-INF/views/include/userBlindHeader.jsp"%></div>
<div class="main-container">
	<form action="setBookMark" method="post">
		<table class="maintable">
			<c:forEach var="ubd" items="${ubdList}">
			<tr>
				<td style="width: 120px;">버스번호</td><td><input type="hidden" name="u_username" value="${ubd.u_username}"><input class="input" name="b_no" value="${ubd.b_no}" readonly></td>
			</tr>
			<tr>
				<td>출발지</td><td><input type="hidden" name="s_nostart" value="${ubd.s_nostart}"><input class="input" name="s_namestart" value="${ubd.s_namestart}" readonly></td>
			</tr>
			<tr>
				<td>도착지</td><td><input type="hidden" name="s_nolast" value="${ubd.s_nolast}"><input class="input" name="s_nameLast" value="${ubd.s_namelast}" readonly></td>
			</tr>
			<tr>
				<td>이용시간</td><td><input class="input" name="ur_date" value="${ubd.ur_date}" readonly></td>
			</tr>
			<tr>
				<td style="height:110px;" colspan="2"><input type="button" id="add" value="즐겨찾기 추가"><br><input id="ub_alias" name="ub_alias" type="hidden" placeholder="즐겨찾기 이름을 입력하세요~!" maxlength='30' value=""><input id="submit" type="hidden" value="추가"></td>
			</tr>
			</c:forEach>
		</table>
	</form>

</div>
<footer>
     <div class="footer-container">
         	<button class="footerbtn" ondblclick="dbClick1()" onmousedown="mouseDown1()" onmouseup="mouseUp1()"><i style="font-size:95px;color:#f9eb99;" class="fas fa-arrow-left"></i></button>
         	<button class="footerbtn" ondblclick="dbClick2()" onmousedown="mouseDown2()" onmouseup="mouseUp2()"><i style="font-size:95px;color:#f9eb99;" class="fas fa-arrow-down"></i></button>
         	<button class="footerbtn" ondblclick="dbClick3()" onmousedown="mouseDown3()" onmouseup="mouseUp3()"><i style="font-size:95px;color:#f9eb99;" class="fas fa-arrow-right"></i></button>
     </div>
</footer>
<script>
$('#add').click(function(){
	if(		 $('#ub_alias').prop("type") == "hidden" ){
			 $('#ub_alias').prop("type","text");
			 $('#submit').prop("type","submit");
	}else if($('#ub_alias').attr("type") == "text" ){
			 $('#ub_alias').prop("type","hidden");
			 $('#submit').prop("type","hidden");
	}
});

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
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
	}
	.maintable{
		font-size: 18px;
		font-weight: bold;
		height: 435px;
		margin-bottom: 20px;
	}
	.tdname{
		text-align: right;
	}
	.tablebtn1, .tablebtn2{
		text-align: center;
		width: 100px;
		height: 48px;
		background-color: #f9eb99;
		border: none;
		border-radius: 10px;
		font-size: 20px;
		cursor: pointer;
	}
	.tablebtn3{
		text-align: center;
		width: 100px;
		height: 48px;
		background-color: lightgray;
		border: none;
		border-radius: 10px;
		font-size: 20px;
		cursor: pointer;
	}
	.tablebtn1:hover{
		background-color: orange;
	}
	.tablebtn2:hover{
		background-color: orange;
	}
	.tablebtn3:hover{
		background-color: orange;
	}
	.inputs{
		width: 275px;
		height: 30px;
		font-size: 18px;
		background-color: #fffbe5;
		border: 1px solid black;
		padding-left: 7px;
	}
	.inputss{
		width: 160px;
		height: 30px;
		font-size: 18px;
		background-color: #fffbe5;
		border: 1px solid black;
		padding-left: 7px;
	}
	.tablediv{
		margin: 5px;
	}
	.btndiv{
		text-align: center;
	}

</style>
</head>
<body>
<div id="userheader"><%@ include file="/WEB-INF/views/include/userBlindHeader.jsp"%></div>
<div class="main-container">
<c:forEach var="mi" items="${miList}">
<form action="setUserMyInfo" method="post">
<div class="tablediv">
<table class="maintable">
	<tr>
		<td class="tdname">ID : </td>
		<td class="tdcontent"><input class="inputs" type="text" name="u_userName" value="${mi.u_userName}" readonly></td>
	</tr>
	<tr>
		<td class="tdname">이름 : </td>
		<td class="tdcontent"><input class="inputs" type="text" name="u_name" value="${mi.u_name}" readonly></td>
	</tr>
	<tr>
		<td class="tdname">전화번호 : </td>
		<td class="tdcontent"><input class="inputs" type="text" name="u_userphonenum" value="${mi.u_userphonenum}"></td>
	</tr>
	<tr>
		<td class="tdname">주소 : </td>
		<td class="tdcontent">
		<select class="inputss" name="t_name">
		<c:forEach var="t" items="${tList}">
			<c:choose>
				<c:when test="${t.t_name eq tName}">
					<option selected>인천시 ${t.t_name}</option>
				</c:when>
				<c:otherwise>
					<option>인천시 ${t.t_name}</option>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		</select><br>
		<input style="margin-top: 5px;" class="inputs" name="aDetail" value="${aDetail}">
		</td>
	</tr>
	<tr>
		<td class="tdname">보호자 이름 : </td>
		<td class="tdcontent"><input class="inputs" type="text" name="u_guardname" value="${mi.u_guardname}"></td>
	</tr>
	<tr>
		<td class="tdname">보호자 연락처 : </td>
		<td class="tdcontent"><input class="inputs" type="text" name="u_guardphonenum" value="${mi.u_guardphonenum}"></td>
	</tr>
	<tr>
		<td class="tdname">보호자와의 관계 : </td>
		<td class="tdcontent"><input class="inputs" type="text" name="u_guardrelation" value="${mi.u_guardrelation}"></td>
	</tr>
</table>



</div>
<div class="btndiv">
<input type="hidden" name="u_type" value="${mi.u_type}">
<input id="mbtn1" class="tablebtn1" type="submit" value="수정">&nbsp;&nbsp;&nbsp;
<a href="/user/myPage"><input id="mbtn2" class="tablebtn2" type="text" value="취소"></a>&nbsp;&nbsp;&nbsp;
<input id="logout" class="tablebtn3" type="text" value="로그아웃">
</div>
</form>
</c:forEach>
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
	if(    $('.tablebtn1').css('background-color') == 'rgb(249, 235, 153)' 
		&& $('.tablebtn2').css('background-color') == 'rgb(249, 235, 153)'
		&& $('.tablebtn3').css('background-color') == 'rgb(211, 211, 211)'){
		   $('.tablebtn3').css("background-color","rgb(255, 165, 0)");
	}else if ( $('.tablebtn3').css('background-color') == 'rgb(255, 165, 0)' 
			&& $('.tablebtn1').css('background-color') == 'rgb(249, 235, 153)'
			&& $('.tablebtn2').css('background-color') == 'rgb(249, 235, 153)'){
	  	   	   $('.tablebtn1').css("background-color","rgb(249, 235, 153)");
	  	   	   $('.tablebtn3').css("background-color","rgb(211, 211, 211)");
		       $('.tablebtn2').css("background-color","rgb(255, 165, 0)");
	}else if ( $('.tablebtn2').css('background-color') == 'rgb(255, 165, 0)'
			&& $('.tablebtn3').css('background-color') == 'rgb(211, 211, 211)'
			&& $('.tablebtn1').css('background-color') == 'rgb(249, 235, 153)' ){
	           $('.tablebtn1').css("background-color","rgb(255, 165, 0)");
	           $('.tablebtn2').css("background-color","rgb(249, 235, 153)");
  	   	   	   $('.tablebtn3').css("background-color","rgb(211, 211, 211)");
	}else if ( $('.tablebtn1').css('background-color') == 'rgb(255, 165, 0)'
			&& $('.tablebtn2').css('background-color') == 'rgb(249, 235, 153)'
			&& $('.tablebtn3').css('background-color') == 'rgb(211, 211, 211)' ){
	           $('.tablebtn1').css("background-color","rgb(249, 235, 153)");
	           $('.tablebtn2').css("background-color","rgb(249, 235, 153)");
  	   	   	   $('.tablebtn3').css("background-color","rgb(255, 165, 0)");
	}
});

$('#btn2').click(function(){
	if( $('.tablebtn1').css("background-color") == "rgb(255, 165, 0)" ){
		alert("수정");
	}else if ( $('.tablebtn3').css("background-color") == "rgb(255, 165, 0)" ){
		alert("로그아웃");
	}else if( $('.tablebtn2').css('background-color') == 'rgb(255, 165, 0)' ){
		alert("취소");
	}
});
$('#btn3').click(function(){
	if(    $('.tablebtn1').css('background-color') == 'rgb(249, 235, 153)' 
		&& $('.tablebtn2').css('background-color') == 'rgb(249, 235, 153)'
		&& $('.tablebtn3').css('background-color') == 'rgb(211, 211, 211)'){
		   $('.tablebtn1').css("background-color","rgb(255, 165, 0)");
	}else if ( $('.tablebtn1').css('background-color') == 'rgb(255, 165, 0)' 
			&& $('.tablebtn2').css('background-color') == 'rgb(249, 235, 153)'
			&& $('.tablebtn3').css('background-color') == 'rgb(211, 211, 211)'){
	  	   	   $('.tablebtn1').css("background-color","rgb(249, 235, 153)");
	  	   	   $('.tablebtn2').css("background-color","rgb(255, 165, 0)");
		       $('.tablebtn3').css("background-color","rgb(211, 211, 211)");
	}else if ( $('.tablebtn1').css('background-color') == 'rgb(249, 235, 153)'
			&& $('.tablebtn2').css('background-color') == 'rgb(255, 165, 0)'
			&& $('.tablebtn3').css('background-color') == 'rgb(211, 211, 211)' ){
	           $('.tablebtn1').css("background-color","rgb(249, 235, 153)");
	           $('.tablebtn2').css("background-color","rgb(249, 235, 153)");
  	   	   	   $('.tablebtn3').css("background-color","rgb(255, 165, 0)");
	}else if ( $('.tablebtn1').css('background-color') == 'rgb(249, 235, 153)'
			&& $('.tablebtn2').css('background-color') == 'rgb(249, 235, 153)'
			&& $('.tablebtn3').css('background-color') == 'rgb(255, 165, 0)' ){
	           $('.tablebtn1').css("background-color","rgb(255, 165, 0)");
	           $('.tablebtn2').css("background-color","rgb(249, 235, 153)");
  	   	   	   $('.tablebtn3').css("background-color","rgb(211, 211, 211)");
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
function holding2(){
	if( $('.tablebtn1').css("background-color") == "rgb(255, 165, 0)" ){
		$('.tablebtn1').trigger('click');
	}else if ( $('.tablebtn3').css("background-color") == "rgb(255, 165, 0)" ){
				location.href = '/user/logout';
	}else if( $('.tablebtn2').css('background-color') == 'rgb(255, 165, 0)' ){
		location.href = '/user/myPage';
	}
}
function mouseDown3(){
	timer3 = setTimeout(function(){holding3();},2000);
}
function mouseUp3(){
	clearTimeout(timer3);
}
/* function holding3(){
	location.href = '/user/logout';
} */
$('#logout').click(function () {
	location.href = '/user/logout';
});
</script>
</body>
</html>
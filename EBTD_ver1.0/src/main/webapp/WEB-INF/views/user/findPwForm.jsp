<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>EBTD - 비밀번호 찾기</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.3/css/all.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.3/css/v4-shims.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
body {
	margin: 0;
	padding: 0;
	border: 0;
	color: white;
	width: 450px; /*만들땐 450px에 두고 만들고 실제로 핸드폰 구현시는 100vw*/
}

.container {
            justify-content: center;
            background-color : #0C3D6A;
            width: 450px;
            height: 80px;
            text-align: center;
            z-index: 2;
            
			position: relative;
			color: black;
}

.headertitle {
	padding-top: 10px;
	padding-right: 15px;
	font-size: 50px;
}

.headertitle img {
	height: 57px;
}

.headerbell {
	color: yellow;
	padding-top: 25px;
	padding-right: 30px;
	font-size: 40px;
}

.footer-container img {
	height: 60px;
}

.main {
	background-color: #f6f4f4;
}

.mainview {
	display: flex;
	align-items: center; /*세로 가운데 정렬*/
	justify-content: center; /*가로 가운데 정렬*/
	text-align: center;
	height: 75vh;
	/*해당 웹페이지를 실행하고 있는 기기의 화면크기 비율 vw(viewport width), vh(viewport height)*/
}

footer {
	position: fixed;
	left: 0px;
	bottom: 0px;
	height: 100px;
	width: 450px;
	z-index: 100;
}

.footer-container {
	background-color: #0C3D6A;
	height: 80px;
	text-align: center;
	padding-top: 10px;
	padding-bottom: 20px;
	font-size: 10px;
}

.tabletitle {
	color: black;
	font-size: 22px;
}

.input {
	width: 200px;
	height: 32px;
	border-radius: 4px;
	border: none;
	margin-left: 5px;
	margin-right: 5px;
	font-size: 20px;
}

.loginbtn {
	font-size: 20px;
	padding-top: 25px;
	padding-bottom: 25px;
	padding-left: 25px;
	padding-right: 25px;
	background-color: #f6e056;
	color: #0C3D6A;
	border-radius: 8px;
	border: none;
}

.otherbtn {
	width: 190px;
	font-size: 20px;
	padding-top: 10px;
	padding-bottom: 10px;
	margin-top: 10px;
	background-color: #f6e056;
	color: #0C3D6A;
	border-radius: 8px;
	border: none;
}

table {
	display: flex;
	justify-content: center;
}

.titlename {
	font: bold;
	font-size: 60px;
	color: black;
}
.title1 {
	font-size: 40px;
	color: black;
	font-weight: bold;
	height: 25px;
}
.title2 {
	color: black;
	margin-bottom: 10px;
	height: 25px;
}
#idCheckBtn{
	cursor: pointer;
}
#inputHidden{
	cursor: pointer;
}
</style>
</head>
<body>
	<header>
		<div class="container">
			<div class="headertitle">
				&nbsp;<img src="/resources/image/mainlogo.png" alt="EBTD메인로고" />
			</div>
		</div>
	</header>
	<section class="main">
		<div class="mainview">
				<table class="formtable">
					<tr>
                        <td colspan="2"><p class="title1">PW 찾기</p></td>
                    </tr>
					<tr>
						<td colspan="4"><p class="title2" >정보를 입력해주세요</p></td>
					</tr>
					<tr>
						<td class="tabletitle">아이디 :</td>
						<td colspan="2"><input class="input" type="text" id="u_username"
							name="u_name" maxlength="20" required="required"></td>
						<td><div id="u_nameDiv"></div></td>
					</tr>
					<tr>
						<td class="tabletitle">이름 :</td>
						<td colspan="2"><input class="input" type="text" id="u_name"
							name="u_name" maxlength="20" required="required"></td>
						<td><div id="u_nameDiv"></div></td>
						<!-- <td rowspan="2"><input id="logbtn" class="loginbtn" type="button" value="LOGIN"></td>-->
						<!-- <td rowspan="2"><button id="logbtn" class="loginbtn" >Login</button> </td> -->
						
					</tr>
					<tr>
						<td class="tabletitle">전화번호 :</td>
						<td colspan="2"><input class="input" id="u_userphonenum"
							name="u_userphonenum" maxlength="13"></td>
						<td><div id="u_userphonenumDiv"></div></td>
					</tr>
					<tr>
						<td class="tabletitle">장애번호 :</td>
						<td colspan="2"><input class="input" id="u_disabledno"
							name="u_disabledno" maxlength="6"></td>
						<td><div id="u_disable_noDiv"></div></td>
					</tr>
					<tr>
						<td colspan="4">
							<input type="button" id="idCheckBtn" class="loginbtn" value="확인하기" style="margin-top: 30px; font-weight: bold;"></input>
						</td>
					</tr>
					<tr>
						<td>
							<b id="resultDiv"></b>
						</td>
					</tr>
					<tr>
					<td>
						<b id="inputPw"></b>
					</td>
					</tr>
				</table>
				<div id = "inputHidden"></div>
				

		</div>
	</section>
	<footer>
		<div class="footer-container">
			<div>
				<img src="/resources/image/teamlogo.png" alt="BITS로고" />
			</div>
			<div>김혜지, 김아름, 김민주, 김주한, 신재구, 이충호, 황원혁</div>
		</div>
	</footer>
</body>

<script>
let dataForm;
let regexp =  /^[가-힣a-z0-9]{3,20}$/;
let regexpphone =   /^\d{3}-\d{3,4}-\d{4}$/;
let regexpno =  /^[0-9]{5,6}$/;
$("#u_userphonenum").blur(function(){
	var num = $("#u_userphonenum").val();
	blur(num)
});
$("#u_userphonenum").click(function(){
	var num = $("#u_userphonenum").val();
	focus(num);
});

function focus(num) {
	num = num.replace(/[^0-9]/g, '');
	$("#u_userphonenum").val(num);
}
function blur(num) {
	num = num.replace(/[^0-9]/g, '');
	var tmp = '';
	tmp += num.substr(0, 3);
	tmp += '-';
	tmp += num.substr(3, 4);
	tmp += '-';
	tmp += num.substr(7,4);
	$("#u_userphonenum").val(tmp);
}

/* $('#u_disabledno').blur(function(){
	//각각 변수에 넣어줌(두개 똑같아여~)
	var user_no = $('#u_disabledno').val();
	console.log(user_no);
	//정규식에 넣었을 시 맞는지 확인후
	if(!regexpno.test(user_no)){
		// 0 : 아이디 길이 / 문자열 검사
		$("#u_disable_noDiv").text("장애 번호는 6자리입니다.");
		$("#resultDiv").css("color", "red");
		return 0;
	}else{
		$("#u_disable_noDiv").text("");
	}
}) */
	
	$("#idCheckBtn").click(function() {	
	//DATA 1일시 일치하는 아이디 출력, 0일시 일치하는 정보 없음
	var username=$("#u_username").val();
	var name=$("#u_name").val();
	var phone=$("#u_userphonenum").val();
	var disno=$("#u_disabledno").val();
	if(name.length<=2){
		$("#resultDiv").text("이름이 너무짧아요");
		$("#resultDiv").css("color", "red");
		return 0;
	}
	if(username.length<=3){
		$("#resultDiv").text("아이디가 너무짧아요");
		$("#resultDiv").css("color", "red");
		return 0;
	}
	if(!regexpphone.test(phone)){
		$("#resultDiv").text("전화번호를 다시 입력해주세요.");
		$("#resultDiv").css("color", "red");
		return 0;
	}
	if(!regexpno.test(disno)){
		$("#resultDiv").text("장애 번호는 6자리입니다.");
		$("#resultDiv").css("color", "red");
		return 0;
	}
		$.ajax({
			url : '/user/findPw?u_userName='+username+'&u_name='+name+"&u_userphonenum="+phone+"&u_disabledno="+disno,
			type : 'get',
			
			 success : function(data) {
				console.log(data);
			  	if(data!=""){
					$("#resultDiv").text("본인인증에 성공했습니다");
					$("#resultDiv").css("color", "blue");
					 $('#inputHidden').html(                        
			                    '<form action="/user/selectPw" method="post" id="selecPw"></form>');
					 $('#inputPw').append (                        
			                    '<input class="input" type="button" onclick="selectPwAct()" value="비밀번호변경">'                    
			                );
					 dataForm=data;
				}else{
					$("#resultDiv").text("아이디가 없습니다");
					$("#resultDiv").css("color", "red");
				} 
				 
			},error : function() {
				console.log("실패");
			}
		});
	});
function selectPwAct() {
	var form = $('<form ></form>');
	form.attr('action', '/user/selectPw');
	form.attr('method', 'post');
	form.appendTo('body');
	form.append($('<input class="input" type="hidden" name="u_username" value="'+dataForm+'">'));
	

	form.submit();
	
}


</script>
</html>

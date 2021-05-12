<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EBTD - 로그인</title>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/v4-shims.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        body{
            margin: 0;
            padding: 0;
            border: 0;
            color: white;
            width: 450px; /*만들땐 450px에 두고 만들고 실제로 핸드폰 구현시는 100vw*/
        }
        .container {
            display: flex;
            justify-content: center;
            background-color : #0C3D6A;
            width: 450px;
            height: 80px;
            text-align: center;
        }
        .headertitle{
            padding-top: 10px;
            padding-right: 15px;
            font-size: 50px;
        }
        .headertitle img{
            height: 57px;
        } 
        .headerbell{
            color: yellow;
            padding-top: 25px;
            padding-right: 30px;
            font-size: 40px;
        }
        .footer-container img{
            height: 60px;
        }
        .main{
            background-color : #f6f4f4;
        }
        .mainview{
            display: flex;
            align-items: center; /*세로 가운데 정렬*/
            justify-content: center; /*가로 가운데 정렬*/
            text-align: center;
            height: 78vh;
            /*해당 웹페이지를 실행하고 있는 기기의 화면크기 비율 vw(viewport width), vh(viewport height)*/
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
            padding-top: 10px;
            padding-bottom: 20px;
            font-size: 10px;
        }
        .tabletitle{
            color: black;
            font-size: 25px;
        }
        .input{
            width: 200px;
            height: 32px;
            border-radius: 4px;
            border: none;
            margin-left: 5px;
            margin-right: 5px;
            font-size: 20px;
        }
        .loginbtn{
            font-size: 20px;
            padding-top: 25px;
            padding-bottom: 25px;
            padding-left: 15px;
            padding-right: 15px;
            background-color: #f6e056;
            color: #0C3D6A;
            border-radius: 8px;
            border: none;
            cursor: pointer;
        }
        .otherbtn{
            width: 190px;
            font-size: 20px;
            padding-top: 10px;
            padding-bottom: 10px;
            margin-top: 10px;
            background-color: #f6e056;
            color: #0C3D6A;
            border-radius: 8px;
            border: none;
            cursor: pointer;
            
        }
        table{
            display: flex;
            justify-content: center;
        }
        .titlename{
            font: bold;
            font-size: 60px;
            color: black;
        }
    </style>
</head>
<body>
    <header>
        <div class="container">
            <div class="headertitle">&nbsp;<img src="/resources/image/mainlogo.png" alt="EBTD메인로고"/></div>
        </div>
    </header>
    <section class="main">
        <div class="mainview">
            <form action="/user/loginAccess" name="login" method="post" onsubmit="return check()">
                <table class="formtable">
                    <tr>
                        <td class="tabletitle" style="font-weight: bold;">I D :</td>
                        <td colspan="2"><input class="input" type="text" id="username" name="u_username"></td>
                        <!-- <td rowspan="2"><input id="logbtn" class="loginbtn" type="button" value="LOGIN"></td>-->
                        <td rowspan="2"><button id="logbtn" class="loginbtn" style="font-weight: bold;">Login</button> </td>
                    </tr>
                    <tr>
                        <td class="tabletitle" style="font-weight: bold;">P W :</td>
                        <td colspan="2"><input class="input" type="password" id="password" name="u_password"></td>
                    </tr>
                    </form>
                </table>
                <table>
                    <tr>
						<form action="/user/joinForm" method="get">
	                        <!-- <td><input class="otherbtn" type="button" value="회원가입"></td>-->
							<td><button class="otherbtn">회원가입</button></td>
						</form>
						<form action="/user/findForm" method="get">
                        	<td><input class="otherbtn" type="submit" value="ID/PW 찾기"></td>
						</form>
                    </tr>
                </table>
            
        </div>
    </section>
    <footer>
        <div class="footer-container">
            <div>
                <img src="/resources/image/teamlogo.png" alt="BITS로고"/>
            </div>
            <div>
                김혜지, 김아름, 김민주, 김주한, 신재구, 황원혁
            </div>
        </div>
    </footer>
</body>

<script>
	function check() {
		if($("#username").val() != ''&& $("#password").val() != ''){return true;}
			alert('아이디 혹은 비밀번호를 확인해주세요');
			return false;
		
	}
	console.log(${msg});
</script>
</html>

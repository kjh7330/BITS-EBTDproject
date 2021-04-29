<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
            position: fixed;
            background-color : #0C3D6A;
            left: 0px;
            top: 0px;
            width: 450px; /*만들땐 450px에 두고 만들고 실제로 핸드폰 구현시는 100vw*/
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
            height: 93vh; 
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
        }
        .jointable input{
            height: 180px;
            width: 180px;
            font-size: 20px;
            padding-top: 10px;
            padding-bottom: 10px;
            margin-top: 10px;
            color: #0C3D6A;
            border-radius: 20px;
            border: none;
        }
        .otherbtn1{
            background-color: #afd19f;
        }
        .otherbtn2{
            background-color: #a2c2e4;
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
        .title1{
            font: bold;
            font-size: 40px;
            color: black;
            height: 20px;
        }
        .title2{
            color: black;
        }
        .content{
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
            <table class="jointable">
                    <tr>
                        <td colspan="2"><p class="title1">회원가입</p></td>
                    </tr>
                    <tr>
                        <td colspan="2"><p class="title2">이용 타입을 선택해주세요.</p></td>
                    </tr>
                    <tr>
                        <!--아래 아이콘이 CSS효과가 안먹어서 태그에 넣음!-->
                        <form id="joinWheel" action="/user/wheel/join">
                        	<td class="otherbtn3"><input class="otherbtn1" type="button"><i class="fas fa-wheelchair" style="position: absolute; color: black; font-size: 100px; left: 90px; padding-top:42px;"></i></td>
                        </form>
                        <form id="joinBlind" action="/user/blind/join">
                        	<td class="otherbtn4"><input class="otherbtn2" type="button"><i class="fas fa-blind" style="position: absolute; color: black; font-size: 100px; left: 290px; padding-top:42px;"></i></td>
                        </form>
                    </tr>
                    <tr>
                        <td><p class="content">휠체어 이용자</p></td>
                        <td><p class="content">시각 장애인</p></td>
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
                김혜지, 김아름, 김민주, 김주한, 신재구, 이충호, 황원혁
            </div>
        </div>
    </footer>
</body>

<script type="text/javascript">
$('.otherbtn1, .otherbtn3').click(function() {
	$('#joinWheel').submit();
});
$('.otherbtn2, otherbtn4').click(function() {
	$('#joinBlind').submit();
});
</script>
</html>
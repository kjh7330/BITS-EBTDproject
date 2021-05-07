<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>wUser Header</title>
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
        .headerbtn{
            padding-top: 8px;
            padding-bottom: 8px;
            border-radius: 8px;
            background-color: yellow;
            color: #0C3D6A;
            font-size: 20px;
        }
        .navdiv{
            display: flex;
            height: 100%;
            background-color: lightgray;
            color: black;
        }
        .navcontent {
            display: flex;
            align-items: center; /*세로 가운데 정렬*/
            justify-content: center; /*가로 가운데 정렬*/
            margin-right: 15px;
            background-color: lightgray;
            color: #0C3D6A;
            font-size: 18px;
            border: none;
            cursor: pointer;
            height: 40px;
            width: 240px;
            flex-grow: 1;
        }
        main{
            min-height: 100%;
        }



    </style>

</head>
<body>
    <header>
        <div class="container">
            <div class="headertitle">&nbsp;<a style="text-decoration: none;" href="/user/loginForm"><img src="/resources/image/mainlogo.png" alt="EBTD메인로고"/></a></div>
        </div>


        <nav class="navdiv">
            <div class="navcontent">
                <p>${sessionScope.u_username}</p>님 환영합니다😊
            </div>
        </nav>
    </header>
</body>
<script type="text/javascript">
$('#logout').click(function () {
	location.href = '/user/logout';
});
</script>
</html>
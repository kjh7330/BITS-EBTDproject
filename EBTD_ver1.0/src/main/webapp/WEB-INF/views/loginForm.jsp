<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login page입니다.</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/v4-shims.css">
</head>
      <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/v4-shims.css">
    <style>
        .container {
            position: fixed;
            background-color : #0C3D6A;
            left: 0px;
            top: 0px;
            width: 100%;
            height: 80px;
            text-align: center;
        }
        .headertitle img{
            height: 70px;
        } 
        .headertitle{
            padding-top: 15px;
            padding-left: 20px;
            font-size: 50px;
        }
        body{ /*html*/
            margin: 0;
            padding: 0;
            border: 0;
            background-color: #0C3D6A;
            width: 100vw;
        }
        .mainview{
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            height: 93vh;
        }
        footer{
            position: fixed;
            left: 0px;
            bottom: 0px;
            height: 100px;
            width: 100%;
            color: white;
        }
        .footer-container{
            background-color : #0C3D6A;
            height: 80px;
            text-align: center;
            padding-top: 10px;
            padding-bottom: 20px;
            font-size: 10px;
        }
        .footer-container img{
            height: 60px;
        }
        .logintable{
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .tabletitle{
            color: white;
            
        }
        #logbtn{
            font-size: 15px;
            padding-top: 12px;
            padding-bottom: 12px;
            border-radius: 8px;
        }
        #newcompany{
            position: absolute;
            top: 55%;
            border: none;
        }
        #newcompanybtn{
            font-size: 13px;
            color: white;
            background-color:#0C3D6A;
            border: none;
            cursor:pointer;
        }
        #newcompany a{
         	text-decoration:none;
         	color:white;
        }
    </style>

<body>
<header>
        <div class="container">
            <div class="headertitle">
                <img src="resources/image/mainlogo.png" alt="EBTD메인로고" />&nbsp;
            </div>
        </div>
    </header>
    <section class="mainview">
      	
        <form action="login" name="login" method="post" onsubmit="return check()">
        <table class="logintable">
            <tr id="inputid">
                <td class="tabletitle">
                    ID : 
                </td>
                <td colspan="3" ><input id="username" name="c_username" type="text" style="border-radius: 8px"/></td>
                <td rowspan="2">
                <button id="logbtn">Login</button> 
                </td>
            </tr>
            
            <tr>
                <td class="tabletitle">
                    PW : 
                </td>
                <td colspan="3"><input id="password" name="c_password" type="password" style="border-radius: 8px"/></td>
            </tr>
        </table>  
		</form>
        <div id="newcompany">
        	<form action="joinForm" method="get"><button>신규 회사</button></form></a><br/><a>ID/PW찾기</a>
        </div>
        
    </section>
    <footer>
        <div class="footer-container">
            <div>
                <img src="resources/image/teamlogo.png" alt="BITS로고"/>
            </div>
            <div>
                김혜지, 김아름, 김민주, 김주한, 신재구, 이충호, 황원혁
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
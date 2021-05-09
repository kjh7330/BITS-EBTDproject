<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인페이지</title>
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
        main{
            min-height: 100%;
        }
        .mainview{
            position: relative;
            font-size: 40px;
            color: black;
            padding: 20px;
            padding-bottom: 120px; /*footer여백*/
        }
        .maindetail{
            height: 27vh;
            text-align: center;
            padding-left: 10px;
        }
        .maindetail table{
            width: 391px;
            height: 175px;
            background-color: #f9eb99;
            text-align: center;
            border-radius: 8px;
            border: none;
        }
        .mainbtn{
            text-align: center;
        }
        .mainbtn button{
            width: 190px;
            font-size: 30px;
            padding-top: 40px;
            padding-bottom: 40px;
            margin-top: 10px;
            background-color: #0C3D6A;
            color: #f6e056;
            border-radius: 8px;
            border: none;
            cursor: pointer;
        }
        .reservationCheck{
        	text-align: center;
        	
        }
    </style>
</head>
<body>
	<div id="userheader"><%@ include file="/WEB-INF/views/include/userheader.jsp"%></div>
    <main class="mainview">
        <div class="maindetail">
            <!--예약 내용 readonly -->
            <table class = "reservationCheck">

            </table>
        </div>
        <div class="mainbtn">
            <button onclick="location.href='/user/getBusList'">예약하기</button>
            <button onclick="location.href='/user/getReservationInfo'">예약확인</button>
            <button onclick="location.href='/user/getBookmarkList' ">즐겨찾기</button>
            <button onclick="location.href='/user/myPage'">마이페이지</button>
        </div>
    </main>
    <div id="userfooter"><%@ include file="/WEB-INF/views/include/userfooter.jsp"%></div>
</body>

<script type="text/javascript">
	console.log(${urList});
 	let i = 0;
	let str = '';
	
	if(${urList}.length == 0){
		str+='<tr><td><input type="text" value = "예약한 내역이 없습니다." readonly = "readonly"></td></tr>';
		$('.reservationCheck').append(str);
	}else{
		$('#reservationCheck').val('');
		for(i=0; i<${urList}.length; i++){
			str+='<tr><td style = "font-size : 13px; width : 250px;">경로 : '+${urList}[i]["s_nameStart"]+'->'+${urList}[i]["s_nameLast"];
			str+='</td>'
			if(${urList}[i]["ur_state"]==0){
				str+='<td style="color : orange; font-size : 13px; font-weight: bolder;">탑승 대기중</td>';
			}else{
				str+='<td style="color : blue; font-size : 13px; font-weight: bolder;">탑승중</td>';
			};
			str+='</tr>';
			
		};
		$(".reservationCheck").append(str); 
	}
	
</script>
</html>
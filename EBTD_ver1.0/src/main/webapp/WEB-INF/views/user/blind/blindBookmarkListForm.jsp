<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EBTD - 즐겨찾기</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!--font-awesome CDN-->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
	rel="stylesheet">
</head>

<style>
.maindiv{
		color: black;
		text-align: center;
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
    .mainbtn{
    	width: 350px;
    	height: 150px;
    	font-size: 50px;
    	margin-top: 95px;
    	background-color: #0C3D6A;
    	color: #f9eb99;
    	border-radius: 15px;
    	cursor: pointer;
    }
	#bookListDiv{ /* 즐겨찾기 전체 div */
		height: 90px;
		text-align: center;
		font-size: 14px;
		color: black; /* width: 300px */
	}
	.bookList { /* 즐겨찾기 개인 div */
		height: 90px;
		text-align: center;
		font-size: 14pt;
		color: black; /* width:50px; */
		padding-top: 15px; /* margin: 20px; */
		border: 0.2px solid;
	}
	.btn{
		width: 350px;
		height: 80px;
		font-size: 30px;
    	margin-top: 20px;
    	background-color: #0C3D6A;
    	color: #f9eb99;
    	border-radius: 15px;
    	cursor: pointer;
	}
	 #plusBox {
		height: 80px;
		color: black;
		height: 90px;
		text-align: center;
		color: black; /* width: 300px */
		margin-top: 30px;
	}
	#stopList{
		cursor: pointer;
	}

</style>
<body>
	<div id="userheader"><%@ include
			file="/WEB-INF/views/include/userBlindHeader.jsp"%></div>

	<div id="bookListDiv">
	</div>
	
	
	<footer>
	     <div class="footer-container">
	         	<!--  button id="btn1" class="footerbtn" onmousedown="mouseDown1()" onmouseup="mouseUp1()"><i style="font-size:95px;color:#f9eb99;" class="fas fa-arrow-left"></i></button>
	         	  button id="btn2" class="footerbtn" onmousedown="mouseDown2()" onmouseup="mouseUp2()"><i style="font-size:95px;color:#f9eb99;" class="fas fa-arrow-down"></i></button>
	         	 button id="btn3" class="footerbtn" onmousedown="mouseDown3()" onmouseup="mouseUp3()"><i style="font-size:95px;color:#f9eb99;" class="fas fa-arrow-right"></i></button>-->
	         	<button id="btn1" class="footerbtn"><i style="font-size:95px;color:#f9eb99;" class="fas fa-arrow-left"></i></button>
	         	<button id="btn2" class="footerbtn"><i style="font-size:95px;color:#f9eb99;" class="fas fa-arrow-down"></i></button>
	         	<button id="btn3" class="footerbtn"><i style="font-size:95px;color:#f9eb99;" class="fas fa-arrow-right"></i></button>
	     </div>
	</footer>
</body>

	<script type="text/javascript">
		let uBookList = ${uBookList};
		let str = '';
		
		let i = 0;//			4 0 1 2 3 4 5
		for(i = 0; i < uBookList.length; i++){
			str += '<button id="mbtn'+i+'" class="btn">'+uBookList[i].ub_alias+'</button>';
			str += '<input type="hidden" class="ub_no'+i+'" name="ub_no" value="'+uBookList[i].ub_no+'">';	//즐겨찾기 번호
			str += '<input type="hidden" class="b_no" name="b_no" value="'+uBookList[i].b_no+'">';//버스번호
			str += '<input type="hidden" class="s_nameStart" name="s_nameStart" value="'+uBookList[i].s_namestart+'">';	//출발정류장
			str += '<input type="hidden" class="s_nameLast" name="s_nameLast" value="'+uBookList[i].s_namelast+'">';	//도착정류장
			str += '<input type="hidden" class="s_noStart" name="s_noStart" value="'+uBookList[i].s_nostart+'">';	//도착정류장ID
			str += '<input type="hidden" class="s_noLast" name="s_noLast" value="'+uBookList[i].s_nolast+'">';	//도착정류장ID
		}
		str+= '<div id="plusBox"><i class="fas fa-plus-circle fa-4x" id = "stopList" style="color: #0C3D6A"></i></div>';
		
		$('#bookListDiv').append(str); 
		
		
		//즐겨찾기 클릭
		$('.btn').click(function (){
			for( child of $(this).parent().children() ){
				if ( $(this).attr('id').substring(4) == $(child).attr('class').substring(5) ){
					location.href = '/user/getBookmarkDetail?ub_no='+$(child).val();
				} 
			}
		});
		
		$('#stopList').click(function () {
			location.href = '/user/stopList';
		});
		
		
		let idx = 0;
		
		
		let check = 0;
		$('.footerbtn').click(function () {
			if( check == 0 ) check = 1;
			else
				if( $(this).attr('id').substring(3)  == 1 ) { // 이전거
					idx--;
					if (idx < 0)	idx = i-1;
				}
				else if( $(this).attr('id').substring(3)  == 3 ) { // 다음거
					idx++;
					if (idx == i )	idx = 0; 
				}
			
			$('.btn').css('background-color', 'rgb(12, 61, 106)');
			$('.btn').css('color', 'rgb(249, 235, 153)');
			$('#mbtn'+idx+'').css('background-color','rgb(249, 235, 153)');
			$('#mbtn'+idx+'').css('color','rgb(12, 61, 106)');
		});
		
		let timer1;
		
		$('#btn1').mousedown(function(){
			timer1 = setTimeout(function () {
				location.href = '/user/reservationCheck';
			},2000);
		});
		$('#btn1').mouseup(function () {
			clearTimeout(timer1);
		});
		let timer2;  
		$('#btn2').mousedown(function(){
			timer2 = setTimeout(function () {
				location.href = '/user/getBookmarkDetail?ub_no='+$('.ub_no'+idx+'').val();
			},2000);
		});
		$('#btn2').mouseup(function () {
			alert($('#mbtn'+idx).html());
			clearTimeout(timer2);
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
			alert('이전페이지가 없음!!');
			//location.href = '/user/???';
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

		</script>

</html>
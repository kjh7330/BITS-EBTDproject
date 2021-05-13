<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시각 - 예약 상세보기</title>
<style>

	.reservation{
		background-color: lightgray; 
		height: 404px;
		margin: 20px; padding: 20px;
	}
	
	#nearBus{
		color: red; font-weight:bold; background-color: lightgray;
		border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
	}
	
	.reservationContent{
		margin: 10px; padding: 10px;
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
    	margin-top: 75px;
    	background-color: #0C3D6A;
    	color: #f9eb99;
    	border-radius: 15px;
    	cursor: pointer;
    	
    	
    }
    .mainview {
	position: relative;
	top: 120px;
	color: black;
	padding: 20px;
	padding-bottom: 120px; /*footer여백*/
	z-index: 1;
	font-size: 18px;
	background-color : #f6f4f4;
}
	#userheader {
	position: absolute;
	z-index: 3;
}
input{
	font-size: 18px;
	cursor: pointer;
}
input:focus{
	outline: none;
}
</style>
</head>
<body>
	<div id="userheader"><%@ include
			file="/WEB-INF/views/include/userheader.jsp"%></div>
	<div class="mainview">
		<form name="reservationCancel" id="reservationCancel" action="/user/reservationCancel" method="post"></form>
		<div id="reserveDetail" style="color:black">
		</div>
	</div>
<!-- 버튼 왜 안들어가지? -->
<footer>
     <div class="footer-container">
         	<button id="btn1" class="footerbtn" onmousedown="mouseDown1()" onmouseup="mouseUp1()"><i style="font-size:95px;color:#f9eb99;" class="fas fa-arrow-left"></i></button>
         	<button id="btn2" class="footerbtn" onmousedown="mouseDown2()" onmouseup="mouseUp2()"><i style="font-size:95px;color:#f9eb99;" class="fas fa-arrow-down"></i></button>
         	<button id="btn3" class="footerbtn" onmousedown="mouseDown3()" onmouseup="mouseUp3()"><i style="font-size:95px;color:#f9eb99;" class="fas fa-arrow-right"></i></button>
     </div>
</footer>

</body>
<script type="text/javascript">
	//예약 내역
	let reserveDetail = ${reservation};
	let $brList = ${brList};
	let str = "";
	console.log(reserveDetail);
	 
		str += "<div class='reservation'>"
		str += '<div class="reservationContent">예약번호: ' +reserveDetail.ur_no + '</div>'; //예약번호
		str += '<div class="reservationContent">예약일자: ' +reserveDetail.ur_date + '</div>'; //예약일자
		str += '<div class="reservationContent">버스번호: ' +reserveDetail.b_no +'&nbsp<input type="button" id="nearBus"></div>'; //버스번호
		str += '<div class="reservationContent">버스회사: ' +reserveDetail.c_username + '</div>'; //예약번호
		str += '<div class="reservationContent">출발정류장: '+reserveDetail.s_namestart + '['+reserveDetail.s_nostart+']</div>'; //출발지
		str += '<div class="reservationContent">도착정류장: '+reserveDetail.s_namelast + '['+reserveDetail.s_nolast+']</div>';//도착지
		str += '<input type="hidden" class="ur_no" name="ur_no" value="'+reserveDetail.ur_no +'"><br>'; //예약넘버	
		str += '<input type="button" id="btn7" class="cancelBtn" value="예약취소" style="margin-left: 94px; width:150px; height:40px; background-color:#f9eb99; color:#0C3D6A;">';
		str += "</div>";
	
		
	$("#reserveDetail").empty();
	$("#reserveDetail").append(str);
	$.ajax({
		url : '/user/allbus',
		data : { 'b_No' : reserveDetail.b_no },
		dataType : 'json'
	}).done(function (data) {
		$abList = data;
		$('.route_td').html('');
		
		let start_turn;
	 	let last_turn;
	 	let r_up_down;
	 	let b_up_down;
	 	let br_size = $brList.length;
    	$('#nearBus').val("도착 예정 없음"); 
	    for( ab_data of $abList){
	    	for( br_data of $brList){
	    		if( br_data['s_name'] == reserveDetail.s_namestart ){
	    			start_turn = br_data['r_turn'];
	    		}
	    		if( br_data['s_name'] == reserveDetail.s_namelast ){
	    			last_turn = br_data['r_turn'];
	    		}
	    	}
	    	if(ab_data['ab_updown'] != null){
	    		
		    	if(start_turn < last_turn)	r_up_down = 1;
		    	else if ( start_turn > last_turn )						r_up_down = 0;
		    	
		    	if(r_up_down == 1){ // 유저 하행
		    		if ( ab_data['r_turn'] <= start_turn && ab_data['ab_updown'] == 1 && start_turn >= 8){
		    			if		( ( start_turn - ab_data['r_turn'] ) == 1 )
		    				$('#nearBus').val("잠시 후 도착합니다.");
		    			else if ( ( start_turn - ab_data['r_turn'] ) < 8 && ( ( start_turn - ab_data['r_turn'] ) != 0 ) )
		    				$('#nearBus').val( ( ( start_turn - ab_data['r_turn'] ) * 3 ) + "분 남았습니다");
		    			else{
					    	$('#nearBus').val("도착 예정 없음"); 
		    			}
		    		}else if ( ab_data['r_turn'] <= start_turn && ab_data['ab_updown'] == 1 && start_turn < 8){
	    				if	( start_turn - ab_data['r_turn'] == 1){
		    				$('#nearBus').val("잠시 후 도착합니다.");
	    				}else if ( ( start_turn - ab_data['r_turn'] ) < 8 && ( start_turn - ab_data['r_turn'] ) != 0 ){
		    				$('#nearBus').val( ( ( start_turn - ab_data['r_turn'] ) * 3 ) + "분 남았습니다");
	    				}else{
					    	$('#nearBus').val("도착 예정 없음"); 
	    				}
		    		}else if ( ab_data['r_turn'] <= (8-start_turn) && ab_data['ab_updown'] == 0 && start_turn < 8){
						if( ( start_turn + ab_data['r_turn'] - 2 ) == 1 ){
		    				$('#nearBus').val("잠시 후 도착합니다.");
						}else if (  ( start_turn + ab_data['r_turn'] - 2 ) < 8 ){
		    				$('#nearBus').val( ( start_turn + ab_data['r_turn'] - 2 ) * 3 + "분 남았습니다." );
						}else{
					    	$('#nearBus').val("도착 예정 없음"); 
						}
		    		}
		    	}else if (r_up_down == 0){				// 유저 상행
		    	
		    		if ( ab_data['r_turn'] >= start_turn && ab_data['ab_updown'] == 0 && ( br_size - 7 ) >= start_turn ){
		    			console.log()
		    			if		( ( ab_data['r_turn'] - start_turn ) == 1 )
		    				$('#nearBus').val("잠시 후 도착합니다.");
		    			else if ( ( ab_data['r_turn'] - start_turn ) < 8 && ( ( start_turn - ab_data['r_turn'] ) != 0 ) )
			    			$('#nearBus').val( ( ( ab_data['r_turn'] - start_turn ) * 3 ) + "분 남았습니다");
		    			else 
					    	$('#nearBus').val("도착 예정 없음");
		    		}else if ( ab_data['r_turn'] >= start_turn && ab_data['ab_updown'] == 0 && ( br_size - 7 ) < start_turn ){
		    			if		( ( ab_data['r_turn'] - start_turn ) == 1 )
		    				$('#nearBus').val("잠시 후 도착합니다.");
	    			else if ( ( ab_data['r_turn'] - start_turn ) < 8 && ( ab_data['r_turn'] - start_turn ) != 0)
			    			$('#nearBus').val( ( ( ab_data['r_turn'] - start_turn ) * 3 ) + "분 남았습니다");
		    			else
					    	$('#nearBus').val("도착 예정 없음");
		    		}else{
		    			if( ( br_size - ab_data['r_turn'] ) * 2 +ab_data['r_turn'] - start_turn == 1 )
		    				$('#nearBus').val("잠시 후 도착합니다.");
		    			else if ( ( br_size - ab_data['r_turn'] ) * 2 + ab_data['r_turn'] - start_turn < 8)
		    				$('#nearBus').val( ( ( br_size - ab_data['r_turn'] ) * 2 + ab_data['r_turn'] - start_turn ) * 3 + "분 남았습니다.");
						else
					    	$('#nearBus').val("도착 예정 없음");
		    		}
		    	}
	    	}
	    }
	}).fail(function (err) {
		console.log(err,'!!!!!!!!');
	});
	let timer = setInterval(function () {
		$.ajax({
			url : '/user/allbus',
			data : { 'b_No' : reserveDetail.b_no },
			dataType : 'json'
		}).done(function (data) {
			$abList = data;
			$('.route_td').html('');
			
			let start_turn;
		 	let last_turn;
		 	let r_up_down;
		 	let b_up_down;
		 	let br_size = $brList.length;
	    	$('#nearBus').val("도착 예정 없음"); 
		    for( ab_data of $abList){
		    	for( br_data of $brList){
		    		if( br_data['s_name'] == reserveDetail.s_namestart ){
		    			start_turn = br_data['r_turn'];
		    		}
		    		if( br_data['s_name'] == reserveDetail.s_namelast ){
		    			last_turn = br_data['r_turn'];
		    		}
		    	}
		    	if(ab_data['ab_updown'] != null){
		    		
			    	if(start_turn < last_turn)	r_up_down = 1;
			    	else if ( start_turn > last_turn )						r_up_down = 0;
			    	
			    	if(r_up_down == 1){ // 유저 하행
			    		if ( ab_data['r_turn'] <= start_turn && ab_data['ab_updown'] == 1 && start_turn >= 8){
			    			if		( ( start_turn - ab_data['r_turn'] ) == 1 )
			    				$('#nearBus').val("잠시 후 도착합니다.");
			    			else if ( ( start_turn - ab_data['r_turn'] ) < 8 && ( ( start_turn - ab_data['r_turn'] ) != 0 ) )
			    				$('#nearBus').val( ( ( start_turn - ab_data['r_turn'] ) * 3 ) + "분 남았습니다");
			    			else{
						    	$('#nearBus').val("도착 예정 없음"); 
			    			}
			    		}else if ( ab_data['r_turn'] <= start_turn && ab_data['ab_updown'] == 1 && start_turn < 8){
		    				if	( start_turn - ab_data['r_turn'] == 1){
			    				$('#nearBus').val("잠시 후 도착합니다.");
		    				}else if ( ( start_turn - ab_data['r_turn'] ) < 8 && ( start_turn - ab_data['r_turn'] ) != 0 ){
			    				$('#nearBus').val( ( ( start_turn - ab_data['r_turn'] ) * 3 ) + "분 남았습니다");
		    				}else{
						    	$('#nearBus').val("도착 예정 없음"); 
		    				}
			    		}else if ( ab_data['r_turn'] <= (8-start_turn) && ab_data['ab_updown'] == 0 && start_turn < 8){
							if( ( start_turn + ab_data['r_turn'] - 2 ) == 1 ){
			    				$('#nearBus').val("잠시 후 도착합니다.");
							}else if (  ( start_turn + ab_data['r_turn'] - 2 ) < 8 ){
			    				$('#nearBus').val( ( start_turn + ab_data['r_turn'] - 2 ) * 3 + "분 남았습니다." );
							}else{
						    	$('#nearBus').val("도착 예정 없음"); 
							}
			    		}
			    	}else if (r_up_down == 0){				// 유저 상행
			    	
			    		if ( ab_data['r_turn'] >= start_turn && ab_data['ab_updown'] == 0 && ( br_size - 7 ) >= start_turn ){
			    			console.log()
			    			if		( ( ab_data['r_turn'] - start_turn ) == 1 )
			    				$('#nearBus').val("잠시 후 도착합니다.");
			    			else if ( ( ab_data['r_turn'] - start_turn ) < 8 && ( ( start_turn - ab_data['r_turn'] ) != 0 ) )
				    			$('#nearBus').val( ( ( ab_data['r_turn'] - start_turn ) * 3 ) + "분 남았습니다");
			    			else 
						    	$('#nearBus').val("도착 예정 없음");
			    		}else if ( ab_data['r_turn'] >= start_turn && ab_data['ab_updown'] == 0 && ( br_size - 7 ) < start_turn ){
			    			if		( ( ab_data['r_turn'] - start_turn ) == 1 )
			    				$('#nearBus').val("잠시 후 도착합니다.");
		    			else if ( ( ab_data['r_turn'] - start_turn ) < 8 && ( ab_data['r_turn'] - start_turn ) != 0)
				    			$('#nearBus').val( ( ( ab_data['r_turn'] - start_turn ) * 3 ) + "분 남았습니다");
			    			else
						    	$('#nearBus').val("도착 예정 없음");
			    		}else{
			    			if( ( br_size - ab_data['r_turn'] ) * 2 +ab_data['r_turn'] - start_turn == 1 )
			    				$('#nearBus').val("잠시 후 도착합니다.");
			    			else if ( ( br_size - ab_data['r_turn'] ) * 2 + ab_data['r_turn'] - start_turn < 8)
			    				$('#nearBus').val( ( ( br_size - ab_data['r_turn'] ) * 2 + ab_data['r_turn'] - start_turn ) * 3 + "분 남았습니다.");
							else
						    	$('#nearBus').val("도착 예정 없음");
			    		}
			    	}
		    	}
		    }
		}).fail(function (err) {
			console.log(err,'!!!!!!!!');
		});
	}, 2000);
	
	
	//예약취소버튼 누르면
	$(".cancelBtn").click(function(){
		let ur_no = $(this).parent().children('.ur_no').val();
		console.log(ur_no);

		$('#reservationCancel').append('<input type="hidden" class="ur_no" name="ur_no" value="'+reserveDetail.ur_no +'">');
		$('form').trigger('submit');
	});
	
	
	$('#btn1').click(function(){
		if(      $('#btn7').css("background-color") == 'rgb(255, 165, 0)' ){
			     $('#btn7').css("background-color","rgb(249, 235, 153)").css("color","rgb(255, 0, 0)");
		}else if($('#btn7').css("background-color") == 'rgb(249, 235, 153)' ){
		  		 $('#btn7').css("background-color","rgb(255, 165, 0)").css("color","rgb(12, 61, 106)");
		}
	});
	
	$('#btn2').click(function(){
		if(  $('#btn7').css("background-color") == 'rgb(255, 165, 0)' ){
			alert("예약취소");
		}
		
/* 		if( $('#mbtn').css('color') == 'rgb(12, 61, 106)' ){
			alert($('.mainbtn').html());
		}else if( $('#mbtn2').css('color') == 'rgb(12, 61, 106)' ){
			location.href = '/user/myPage';
		} */
	});
	$('#btn3').click(function(){
		if(      $('#btn7').css("background-color") == 'rgb(255, 165, 0)' ){
		     	 $('#btn7').css("background-color","rgb(249, 235, 153)").css("color","rgb(255, 0, 0)");
		}else if($('#btn7').css("background-color") == 'rgb(249, 235, 153)' ){
		  		 $('#btn7').css("background-color","rgb(255, 165, 0)").css("color","rgb(12, 61, 106)");
		}
	});
	//버튼 두번 클릭 혹은 롱 클릭
	let timer1;
	let timer2;
	let timer3;
	let istrue = false;
	function mouseDown1(){
		timer1 = setTimeout(function(){holding1();},2000);
	}
	function mouseUp1(){
		clearTimeout(timer1);
	}
	function holding1(){
		window.history.back();
	}
	function mouseDown2(){
		timer2 = setTimeout(function(){holding2();},2000);
	}
	function mouseUp2(){
		clearTimeout(timer2);
	}
	function holding2(){
			$('.cancelBtn').trigger('click');
	}
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
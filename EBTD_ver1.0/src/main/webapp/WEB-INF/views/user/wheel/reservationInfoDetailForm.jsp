<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EBTD - 예약 상세보기</title>
<style>
.reservation {
	background-color: lightgray;
	height: 500px;
	margin: 10px;
	padding-left: 20px;
	padding-right: 20px;
	padding-top: 10px;
	padding-bottom: 55px;
	font-size: 20px;
}

#nearBus {
	color: red;
	font-weight: bold;
	background-color: lightgray;
	border: none;
	border-right: 0px;
	border-top: 0px;
	boder-left: 0px;
	boder-bottom: 0px;
}

.reservationContent {
	margin: 10px;
	padding: 10px;
}

.mainview {
	position: relative;
	top: 130px;
	color: black;
	padding: 20px;
	padding-bottom: 120px; /*footer여백*/
	z-index: 1;
	background-color : #f6f4f4;
}

#userheader {
	position: absolute;
	z-index: 3;
}
#btn {
	text-align: center;
	background-color: #f9eb99;
	border-radius: 8px;
	margin: 10px;
	width: 100px;
	height: 40px;
	margin-left: 114px;
	font-size: 20px;
	cursor: pointer;
}
#btn:hover{
	background-color: #ff9292;
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
	<div id="userfooter"><%@ include
			file="/WEB-INF/views/include/userfooter.jsp"%></div>
</body>
<script type="text/javascript">
	//예약 내역
	let reserveDetail = ${reserveDetail};
	let $brList = ${brList};
	let str = "";
	console.log(reserveDetail);
	 
		str += "<div class='reservation'>"
		str += '<div class="reservationContent">예약번호: ' +reserveDetail.ur_no + '</div>'; //예약번호
		str += '<div class="reservationContent">예약일자: ' +reserveDetail.ur_date + '</div>'; //예약일자
		str += '<div class="reservationContent">버스번호: ' +reserveDetail.b_no +'&nbsp<input type="button" id="nearBus"></div>'; //버스번호
		str += '<div class="reservationContent">버스회사: ' +reserveDetail.c_username + '</div>'; //예약번호
		str += '<div class="reservationContent">출발정류장: '+reserveDetail.s_namestart + '['+reserveDetail.s_nostart+']</div>'; //출발지
		str += '<div class="reservationContent">출발정류장 정보: '+ reserveDetail.s_detail_start + '</div>';
		str += '<div class="reservationContent">도착정류장: '+reserveDetail.s_namelast + '['+reserveDetail.s_nolast+']</div>';//도착지
		str += '<div class="reservationContent">도착정류장 정보: '+ reserveDetail.s_detail_last + '</div>';
		str += '<input type="hidden" class="ur_no" name="ur_no" value="'+reserveDetail.ur_no +'">'; //예약넘버	
		str += '<input type="button" id="btn" class="cancelBtn" value="예약취소">';
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
	
	
</script>
</html>
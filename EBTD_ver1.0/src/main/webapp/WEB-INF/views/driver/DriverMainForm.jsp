<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EBTD Driver Display</title>
<style type="text/css">
	body{
		margin : 0;
		backround-color : lightgray;
	}
	.on_wheel{
		position : relative;
		background-color : #c4f5b1;
		z-index : 3;
		border : none;
		width : 10px;
		transform : translate(-17px, 0px);
	}
	.out_wheel{
		position : relative;
		background-color : #f5dcb1;		
		width : 10px;
		z-index : 3;
		border : none;
		transform : translate(-17px, 0px);
	}
	.on_blind{
		position : relative;
		width : 10px;
		background-color : #b1d2f5;
		border : none;
		z-index : 3;
		transform : translate(-17px, 0px);
	}
	.out_blind{
		position : relative;
		width : 10px;
		border : none;
		background-color : #f5b1b1;
		z-index : 3;
		transform : translate(-17px, 0px);
	}
	.arrow{
		position : absolute;
		width : 80px;
		height : 26px;
		z-index : -1;
		transform : translate(-17px, 0px);
	}
	.img_blind{
		width : 16px;
		padding-left : 10px;
		transform : translate(-17px, 0px);
	}
	td{
		width : 80px;
	}
	.img_wheel{
		padding-left : 10px;
		transform : translate(-17px, 0px);
	}
	#logo_table{
		width : 100%;
		background-color: #0C3D6a;
		text-align : center;
	}
	.logo_td{
		font-size : 11px;
		color : #f9eb99;
		font-weight : bold;
	}
	.logo{
		width: 50px;
	}
	#all_cnt td{
		background-color : lightgray; 
	}
	div{
		position : absolute;
		width : 100%;
		height : 100%; 
		text-align : center;
		margin-left  : auto;
		margin-right  : auto;
		z-index : -5;
	}
	#all_wheel,#all_blind{
		width : 17px;
		text-align : center;
	}
	#main_table{
		margin : auto;
	}
	.s_name_input{
		text-align : center;
		border : 0.5px black solid;
	}#logo_table td{
		width : 33%;
	} button{
            text-align: center;
            background-color: #f9eb99;
            border-radius: 8px;
            width : 80px;
            height : 30px;
            border: none;
            margin: 5px;
	}
	button:hover{
	   background-color: #cec380;
	   cursor : pointer;
	}
</style>
</head>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/v4-shims.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<body>
<header>
	<table id = 'logo_table'>
		<tr>
			<td class = 'logo_td'>${c_username}
			</td>
			<td class = 'logo_td'> <img class="logo" alt="logo" src="/resources/image/mainlogo.png">
			</td>
			<td class = 'logo_td'>${b_no}번 버스<br> ${d_name}기사님</td>
		</tr>
		<tr id = 'all_cnt'>
			<td><img style = "width : 16px;" alt="blind_img" src="/resources/image/blind.png"> : <input id='all_blind' value=0></td>
			<td style = 'font-weight : bold; font-size:11px;'>현재 탑승 인원</td>
			<td><i class="fas fa-wheelchair"></i> : <input id='all_wheel' value=0></td>
		</tr>
	</table>
</header>

	<div>
	<br>
	<table id = 'main_table'>
		<tr>
			<td><img id = 'img_b_on_nnext' class = 'arrow' alt="on_blind" src="/resources/image/on_blind.png"/>
				<img id = 'img_b_on_nnext2' class = 'img_blind' alt="blind_img" src="/resources/image/blind.png">
				<input class = 'on_blind' id="nnext_on_blind" value=0></td>
			<td>다다음 정류장</td>
			<td><img id = 'img_b_out_nnext' class = 'arrow' alt="out_blind" src="/resources/image/out_blind.png"/>
				<img id = 'img_b_out_nnext2' class = 'img_blind' alt="blind_img" src="/resources/image/blind.png">
				<input class = 'out_blind' id="nnext_out_blind" value=0></td>
		</tr>
		<tr>
			<td><img id = 'img_w_on_nnext' class = 'arrow' alt="on_wheel" src="/resources/image/on_wheel.png"/>
				<i style = "padding-left : 10px; transform : translate(-17px, 0px);" id = 'img_w_on_nnext2' class="fas fa-wheelchair"></i>
				<input class = 'on_wheel' id="nnext_on_wheel" value=0></td>
			<td><input id="nnext_stop_name" class = 's_name_input'></td>
			<td><img id = 'img_w_out_nnext' class = 'arrow' alt="out_wheel" src="/resources/image/out_wheel.png"/>
				<i style = "padding-left : 10px; transform : translate(-17px, 0px);" id = 'img_w_out_nnext2' class="fas fa-wheelchair"></i>
				<input class = 'out_wheel'  id="nnext_out_wheel" value=0></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td><img id = 'img_b_on_next' class = 'arrow' alt="on_blind" src="/resources/image/on_blind.png"/>
				<img id = 'img_b_on_next2' class = 'img_blind'  alt="blind_img" src="/resources/image/blind.png">
				<input class = 'on_blind' id="next_on_blind" value=0></td>
			<td>다음 정류장</td>
			<td><img id = 'img_b_out_next' class = 'arrow' alt="out_blind" src="/resources/image/out_blind.png"/>
				<img id = 'img_b_out_next2' class = 'img_blind'  alt="blind_img" src="/resources/image/blind.png">
				<input class = 'out_blind' id="next_out_blind" value=0></td>
		</tr>
		<tr>
			<td><img id = 'img_w_on_next' class = 'arrow' alt="on_wheel" src="/resources/image/on_wheel.png"/>
				<i style = "padding-left : 10px; transform : translate(-17px, 0px);" id = 'img_w_on_next2' class="fas fa-wheelchair"></i>
				<input class = 'on_wheel'  id="next_on_wheel" value=0></td>
			<td><input id="next_stop_name" class = 's_name_input'></td>
			<td><img id = 'img_w_out_next' class = 'arrow' alt="out_wheel" src="/resources/image/out_wheel.png"/>
				<i style = "padding-left : 10px; transform : translate(-17px, 0px);" id = 'img_w_out_next2' class="fas fa-wheelchair"></i>
				<input class = 'out_wheel'  id="next_out_wheel" value=0></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td><img id = 'img_b_on_curr' class = 'arrow' alt="on_blind" src="/resources/image/on_blind.png"/>
				<img id = 'img_b_on_curr2' class = 'img_blind'  alt="blind_img" src="/resources/image/blind.png">
				<input class = 'on_blind' id="cur_on_blind" value=0></td>
			<td>현재 위치</td>
			<td><img id = 'img_b_out_curr'class = ' arrow' alt="out_blind" src="/resources/image/out_blind.png"/>
				<img id = 'img_b_out_curr2' class = 'img_blind'  alt="blind_img" src="/resources/image/blind.png">
				<input class = 'out_blind' id="cur_out_blind" value=0></td>
		</tr>
		<tr>
			<td><img id = 'img_w_on_curr' class = 'arrow' alt="on_wheel" src="/resources/image/on_wheel.png"/>
				<i style = "padding-left : 10px; transform : translate(-17px, 0px);" id = 'img_w_on_curr2' class="fas fa-wheelchair"></i>
				<input class = 'on_wheel'  id="cur_on_wheel" value=0></td>
			<td><input id="cur_stop_name" class = 's_name_input'></td>
			<td><img id = 'img_w_out_curr' class = 'arrow' alt="out_wheel" src="/resources/image/out_wheel.png"/>
				<i style = "padding-left : 10px; transform : translate(-17px, 0px);" id = 'img_w_out_curr2' class="fas fa-wheelchair"></i>
				<input class = 'out_wheel'  id="cur_out_wheel" value=0></td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		
		<tr>
			<td><button id='start'>운행시작</button></td>
			<td><button id='change'>교대</button></td>
			<td><input type = 'checkbox' id = 'infinite'>반복</td>
		</tr>
	</table>
	</div>



	<script type="text/javascript">
		let up = true;
		let s_list = ${s_list};
		let i = 0; 
		let all_blind = 0;					
		let all_wheel = 0;					
		let cur_on_blind_cnt = 0;					
		let cur_on_wheel_cnt = 0;					
		let next_on_blind_cnt = 0;					
		let next_on_wheel_cnt = 0;					
		let nnext_on_blind_cnt = 0;					
		let nnext_on_wheel_cnt = 0;
		let cur_out_blind_cnt = 0;					
		let cur_out_wheel_cnt = 0;
		let next_out_blind_cnt = 0;					
		let next_out_wheel_cnt = 0;					
		let nnext_out_blind_cnt = 0;					
		let nnext_out_wheel_cnt = 0;
		
		$('input').attr('readonly',true);
		$('#cur_stop_name').val(s_list[i]['s_name']);
		$('#next_stop_name').val(s_list[i+1]['s_name']);
		$('#nnext_stop_name').val(s_list[i+2]['s_name']);
		
		$('#cur_stop_name').css('background-color', ( i % 2 == 0 ? 'lightgray':'white' ) );
		$('#next_stop_name').css('background-color', ( i % 2 == 0 ? 'white':'lightgray' ) );
		$('#nnext_stop_name').css('background-color', ( i % 2 == 0 ? 'lightgray':'white' ) );
		
		$('#cur_on_wheel').css('visibility', ( $('#cur_on_wheel').val() == 0 ? 'hidden':'visible' ) );
		$('#cur_on_blind').css('visibility', ( $('#cur_on_wheel').val() == 0 ? 'hidden':'visible' ) );
		$('#next_on_wheel').css('visibility', ( $('#cur_on_wheel').val() == 0 ? 'hidden':'visible' ) );
		$('#next_on_blind').css('visibility', ( $('#cur_on_wheel').val() == 0 ? 'hidden':'visible' ) );
		$('#nnext_on_wheel').css('visibility', ( $('#cur_on_wheel').val() == 0 ? 'hidden':'visible' ) );
		$('#nnext_on_blind').css('visibility', ( $('#cur_on_wheel').val() == 0 ? 'hidden':'visible' ) );
		$('#cur_out_wheel').css('visibility', ( $('#cur_on_wheel').val() == 0 ? 'hidden':'visible' ) );
		$('#cur_out_blind').css('visibility', ( $('#cur_on_wheel').val() == 0 ? 'hidden':'visible' ) );
		$('#next_out_wheel').css('visibility', ( $('#cur_on_wheel').val() == 0 ? 'hidden':'visible' ) );
		$('#next_out_blind').css('visibility', ( $('#cur_on_wheel').val() == 0 ? 'hidden':'visible' ) );
		$('#nnext_out_wheel').css('visibility', ( $('#cur_on_wheel').val() == 0 ? 'hidden':'visible' ) );
		$('#nnext_out_blind').css('visibility', ( $('#cur_on_wheel').val() == 0 ? 'hidden':'visible' ) );
		
		$('#img_b_on_curr').css('opacity', ( $('#cur_on_wheel').val() == 0 ? '0.2':'1' ) );
		$('#img_b_out_curr').css('opacity', ( $('#cur_on_wheel').val() == 0 ? '0.2':'1' ) );
		$('#img_b_on_next').css('opacity', ( $('#cur_on_wheel').val() == 0 ? '0.2':'1' ) );
		$('#img_b_out_next').css('opacity', ( $('#cur_on_wheel').val() == 0 ? '0.2':'1' ) );
		$('#img_b_on_nnext').css('opacity', ( $('#cur_on_wheel').val() == 0 ? '0.2':'1' ) );
		$('#img_b_out_nnext').css('opacity', ( $('#cur_on_wheel').val() == 0 ? '0.2':'1' ) );
		$('#img_w_on_curr').css('opacity', ( $('#cur_on_wheel').val() == 0 ? '0.2':'1' ) );
		$('#img_w_out_curr').css('opacity', ( $('#cur_on_wheel').val() == 0 ? '0.2':'1' ) );
		$('#img_w_on_next').css('opacity', ( $('#cur_on_wheel').val() == 0 ? '0.2':'1' ) );
		$('#img_w_out_next').css('opacity', ( $('#cur_on_wheel').val() == 0 ? '0.2':'1' ) );
		$('#img_w_on_nnext').css('opacity', ( $('#cur_on_wheel').val() == 0 ? '0.2':'1' ) );
		$('#img_w_out_nnext').css('opacity', ( $('#cur_on_wheel').val() == 0 ? '0.2':'1' ) );
		
		$('#img_b_on_curr2').css('visibility', ( $('#cur_on_wheel').val() == 0 ? 'hidden':'visible' ) );
		$('#img_b_out_curr2').css('visibility', ( $('#cur_on_wheel').val() == 0 ? 'hidden':'visible' ) );
		$('#img_b_on_next2').css('visibility', ( $('#cur_on_wheel').val() == 0 ? 'hidden':'visible' ) );
		$('#img_b_out_next2').css('visibility', ( $('#cur_on_wheel').val() == 0 ? 'hidden':'visible' ) );
		$('#img_b_on_nnext2').css('visibility', ( $('#cur_on_wheel').val() == 0 ? 'hidden':'visible' ) );
		$('#img_b_out_nnext2').css('visibility', ( $('#cur_on_wheel').val() == 0 ? 'hidden':'visible' ) );
		$('#img_w_on_curr2').css('visibility', ( $('#cur_on_wheel').val() == 0 ? 'hidden':'visible' ) );
		$('#img_w_out_curr2').css('visibility', ( $('#cur_on_wheel').val() == 0 ? 'hidden':'visible' ) );
		$('#img_w_on_next2').css('visibility', ( $('#cur_on_wheel').val() == 0 ? 'hidden':'visible' ) );
		$('#img_w_out_next2').css('visibility', ( $('#cur_on_wheel').val() == 0 ? 'hidden':'visible' ) );
		$('#img_w_on_nnext2').css('visibility', ( $('#cur_on_wheel').val() == 0 ? 'hidden':'visible' ) );
		$('#img_w_out_nnext2').css('visibility', ( $('#cur_on_wheel').val() == 0 ? 'hidden':'visible' ) );
		
		$('#start').click(function () {
			let go = true;
			i = 0;
			let first_check = 0;
			let cycle_check = 0;
			let cnt = 0; 
			let test = [];
			let on_cnt = 0;
			let out_cnt = 0;
			let on_data = [];
			let out_data = [];
			let name;
			let refresh = setInterval(function name() {
				$.ajax({
					url : '/driver/refresh',
					data : 	{
								'car' : i+1,
								'go' : true,
								'out' : test,
								'blind' : all_blind,
								'wheel' : all_wheel,
								'up' : up
							},
					dataType : 'json',
					method : 'get'
				}).done(function (r_list) {
					let name = ''; 
					cur_on_blind_cnt = next_on_blind_cnt;					
					cur_on_wheel_cnt = next_on_wheel_cnt;					
					next_on_blind_cnt = nnext_on_blind_cnt;	
					next_on_wheel_cnt = nnext_on_wheel_cnt;
					nnext_on_blind_cnt = 0;
					nnext_on_wheel_cnt = 0;
					
					cur_out_blind_cnt = next_out_blind_cnt;					
					cur_out_wheel_cnt = next_out_wheel_cnt;					
					next_out_blind_cnt = nnext_out_blind_cnt;					
					next_out_wheel_cnt = nnext_out_wheel_cnt;					
					nnext_out_blind_cnt = 0;
					nnext_out_wheel_cnt = 0;
					
					if(i == s_list.length-1)	up = false;
					for( idx in r_list ){
						if(up){
							if( r_list[idx]['up'] ){
								if(i != s_list.length-2){
									if( r_list[idx]['ur_start_turn'] == s_list[i+2]['r_turn'] && r_list[idx]['ur_state'] == 0 )
										if( r_list[idx]['u_type'] == 1 )	{
											nnext_on_blind_cnt++;
											test[cnt++] =  { ur_no : r_list[idx]['ur_no'], name : name, ur_state : 0 };
										}
										else{
											nnext_on_wheel_cnt++;
											name = ''+idx;  
											test[cnt++] =  { ur_no : r_list[idx]['ur_no'], name : name, ur_state : 0 };
										}
									
									if( r_list[idx]['ur_last_turn'] == s_list[i+2]['r_turn'] && r_list[idx]['ur_state'] == 1 )
										if( r_list[idx]['u_type'] == 1 )	nnext_out_blind_cnt++;
										else								nnext_out_wheel_cnt++;
								}
							}else{
								if(i == s_list.length-2){
									if( r_list[idx]['ur_start_turn'] == s_list[i]['r_turn'] && r_list[idx]['ur_state'] == 0 )
										if( r_list[idx]['u_type'] == 1 )	{
											nnext_on_blind_cnt++;
											name = ''+idx;  
											test[cnt++] =  { ur_no : r_list[idx]['ur_no'], name : name, ur_state : 0 };
										}
										else								{
											nnext_on_wheel_cnt++;
											name = ''+idx;  
											test[cnt++] =  { ur_no : r_list[idx]['ur_no'], name : name, ur_state : 0 };
										}
									
									if( r_list[idx]['ur_last_turn'] == s_list[i]['r_turn'] && r_list[idx]['ur_state'] == 1 )
										if( r_list[idx]['u_type'] == 1 )	nnext_out_blind_cnt++;
										else								nnext_out_wheel_cnt++;
								}if(i == s_list.length-3){
									if( r_list[idx]['ur_start_turn'] == s_list[i+2]['r_turn'] && r_list[idx]['ur_state'] == 0 )
										if( r_list[idx]['u_type'] == 1 )	{
											nnext_on_blind_cnt++;
											name = ''+idx;  
											test[cnt++] =  { ur_no : r_list[idx]['ur_no'], name : name, ur_state : 0 };
										}
										else								{
											nnext_on_wheel_cnt++;
											name = ''+idx;  
											test[cnt++] =  { ur_no : r_list[idx]['ur_no'], name : name, ur_state : 0 };
										}
									
									if( r_list[idx]['ur_last_turn'] == s_list[i+2]['r_turn'] && r_list[idx]['ur_state'] == 1 )
										if( r_list[idx]['u_type'] == 1 )	nnext_out_blind_cnt++;
										else								nnext_out_wheel_cnt++;
								}
							}
						}
						else{
							if( !r_list[idx]['up'] ){
								if( i != 1 ){
									if( r_list[idx]['ur_start_turn'] == s_list[i-2]['r_turn'] && r_list[idx]['ur_state'] == 0 )
										if( r_list[idx]['u_type'] == 1 )	{
											nnext_on_blind_cnt++;
											name = ''+idx;  
											test[cnt++] =  { ur_no : r_list[idx]['ur_no'], name : name, ur_state : 0 };
										}
										else								{
											nnext_on_wheel_cnt++;
											name = ''+idx;  
											test[cnt++] =  { ur_no : r_list[idx]['ur_no'], name : name, ur_state : 0 };
										}
								
									if( r_list[idx]['ur_last_turn'] == s_list[i-2]['r_turn'] && r_list[idx]['ur_state'] == 1 )
										if( r_list[idx]['u_type'] == 1 )	nnext_out_blind_cnt++;
										else								nnext_out_wheel_cnt++;
								}
							}else{
								if( i == 1 ){
									if( r_list[idx]['ur_start_turn'] == s_list[i]['r_turn'] && r_list[idx]['ur_state'] == 0 )
										if( r_list[idx]['u_type'] == 1 )	{
											nnext_on_blind_cnt++;
										}
										else								{
											nnext_on_wheel_cnt++;
										}
									
									if( r_list[idx]['ur_last_turn'] == s_list[i]['r_turn'] && r_list[idx]['ur_state'] == 1 )
										if( r_list[idx]['u_type'] == 1 )	nnext_out_blind_cnt++;
										else								nnext_out_wheel_cnt++;
								}if( i == 2 ){
									if( r_list[idx]['ur_start_turn'] == s_list[i-2]['r_turn'] && r_list[idx]['ur_state'] == 0 )
										if( r_list[idx]['u_type'] == 1 )	{
											nnext_on_blind_cnt++;
										}
										else								{
											nnext_on_wheel_cnt++;
										}
									
									if( r_list[idx]['ur_last_turn'] == s_list[i-2]['r_turn'] && r_list[idx]['ur_state'] == 1 )
										if( r_list[idx]['u_type'] == 1 )	nnext_out_blind_cnt++;
										else								nnext_out_wheel_cnt++;
								}
							} 
						}
						
						if( first_check == 0 ){
							if(up){
								if( r_list[idx]['ur_start_turn'] == s_list[i]['r_turn'] && r_list[idx]['ur_state'] == 0 )
									if( r_list[idx]['u_type'] == 1 )	{
										cur_on_blind_cnt++;
										name = ''+idx;  
										test[cnt++] =  { ur_no : r_list[idx]['ur_no'], name : name, ur_state : 0 };
									}
									else								{
										cur_on_wheel_cnt++;
										name = ''+idx;  
										test[cnt++] =  { ur_no : r_list[idx]['ur_no'], name : name, ur_state : 0 };
									}
								else if( r_list[idx]['ur_start_turn'] == s_list[i+1]['r_turn'] && r_list[idx]['ur_state'] == 0 )
									if( r_list[idx]['u_type'] == 1 )	{
										next_on_blind_cnt++;
										name = ''+idx;  
										test[cnt++] =  { ur_no : r_list[idx]['ur_no'], name : name, ur_state : 0 };
									}
									else								{
										next_on_wheel_cnt++;
										name = ''+idx;  
										test[cnt++] =  { ur_no : r_list[idx]['ur_no'], name : name, ur_state : 0 };
									}
								
								if( r_list[idx]['ur_last_turn'] == s_list[i]['r_turn'] && r_list[idx]['ur_state'] == 1 )
									if( r_list[idx]['u_type'] == 1 )	cur_out_blind_cnt++;
									else								cur_out_wheel_cnt++;								
								else if( r_list[idx]['ur_last_turn'] == s_list[i+1]['r_turn'] && r_list[idx]['ur_state'] == 1 )
									if( r_list[idx]['u_type'] == 1 )	next_out_blind_cnt++;
									else								next_out_wheel_cnt++;
								
							}
					}
						
						if( r_list[idx]['ur_last_turn'] == s_list[i]['r_turn'] && r_list[idx]['ur_state'] == 1 ){
							if( ( ( (i == s_list.length-1) || ( i == 0 ) ) && (r_list[idx]['up'] != up) ) || (r_list[idx]['up'] == up ) ) {
								console.log('무야호! ' + s_list[i]['s_name'] + "정류장에서 예약번호" + r_list[idx]['ur_no'] + '번 손님 내림!');
								out_data[out_cnt++] = r_list[idx]['ur_no'];
							}
							
						}
						
						if( r_list[idx]['ur_start_turn'] == s_list[i]['r_turn'] && r_list[idx]['ur_state'] == 0 ){
								if(r_list[idx]['up'] == up ) {
									console.log('무야호! ' + s_list[i]['s_name'] + "정류장에서 예약번호" + r_list[idx]['ur_no'] + '번 손님 올라 탐!');
									on_data[on_cnt++] = r_list[idx]['ur_no'];
								}
						}
						
						
						
						/*for(jdx in test){
								if( r_list[idx]['ur_last_turn'] == s_list[i]['r_turn'] && test[jdx]['ur_state'] == 1 ){
									if(r_list[idx]['ur_no'] == test[jdx]['ur_no']){
										if( ( (i == s_list.length-1) && (r_list[idx]['up'] != up) ) || (r_list[idx]['up'] == up ) ) {
											console.log('무야호! ' + s_list[i]['s_name'] + "정류장에서 예약번호" + r_list[idx]['ur_no'] + '번 손님 내림!');
											out_data[out_cnt++] = test[jdx]['ur_no'];
											test.splice(jdx, 1);
											cnt--;
										}
									}
								}
								
								if( r_list[idx]['ur_start_turn'] == s_list[i]['r_turn'] ){
									if(r_list[idx]['ur_no'] == test[jdx])
										if(r_list[idx]['up'] == up ) {
											console.log('무야호! ' + s_list[i]['s_name'] + "정류장에서 예약번호" + r_list[idx]['ur_no'] + '번 손님 올라 탐!');
											on_data[on_cnt++] = test[jdx]['ur_no'];
										}
								}
						}*/
						
					}// for each end
					
					let on_out_data = {};
					
					on_out_data.on_data = on_cnt > 0 ? on_data : ['999999'];
					on_out_data.out_data = out_cnt > 0 ? out_data : ['999999'];
					
					if( on_cnt + out_cnt > 0)
						$.ajax({
							url : '/driver/on_out',
							data : on_out_data,
							dataType : 'json'
						}).done(function (data) {
							on_cnt = 0;
							out_cnt = 0;
						}).fail(function (err) {
							console.log(err,'!!!!!!!!!!!');
						});
					
					
					all_blind += cur_on_blind_cnt - cur_out_blind_cnt;
					all_wheel += cur_on_wheel_cnt - cur_out_wheel_cnt;
					
					$('#all_blind').val(all_blind);
					$('#all_wheel').val(all_wheel);
					$('#cur_on_blind').val(cur_on_blind_cnt);
					$('#cur_on_wheel').val(cur_on_wheel_cnt);
					$('#next_on_blind').val(next_on_blind_cnt);
					$('#next_on_wheel').val(next_on_wheel_cnt);
					$('#nnext_on_blind').val(nnext_on_blind_cnt);
					$('#nnext_on_wheel').val(nnext_on_wheel_cnt);
					
					$('#cur_out_blind').val(cur_out_blind_cnt);
					$('#cur_out_wheel').val(cur_out_wheel_cnt);
					$('#next_out_blind').val(next_out_blind_cnt);
					$('#next_out_wheel').val(next_out_wheel_cnt);
					$('#nnext_out_blind').val(nnext_out_blind_cnt);
					$('#nnext_out_wheel').val(nnext_out_wheel_cnt);
					
					$('#img_b_on_curr').css('opacity', ( $('#cur_on_blind').val() == 0 ? '0.2':'1' ) );
					$('#img_b_out_curr').css('opacity', ( $('#cur_out_blind').val() == 0 ? '0.2':'1' ) );
					$('#img_b_on_next').css('opacity', ( $('#next_on_blind').val() == 0 ? '0.2':'1' ) );
					$('#img_b_out_next').css('opacity', ( $('#next_out_blind').val() == 0 ? '0.2':'1' ) );
					$('#img_b_on_nnext').css('opacity', ( $('#nnext_on_blind').val() == 0 ? '0.2':'1' ) );
					$('#img_b_out_nnext').css('opacity', ( $('#nnext_out_blind').val() == 0 ? '0.2':'1' ) );
					
					$('#img_w_on_curr').css('opacity', ( $('#cur_on_wheel').val() == 0 ? '0.2':'1' ) );
					$('#img_w_out_curr').css('opacity', ( $('#cur_out_wheel').val() == 0 ? '0.2':'1' ) );
					$('#img_w_on_next').css('opacity', ( $('#next_on_wheel').val() == 0 ? '0.2':'1' ) );
					$('#img_w_out_next').css('opacity', ( $('#next_out_wheel').val() == 0 ? '0.2':'1' ) );
					$('#img_w_on_nnext').css('opacity', ( $('#nnext_on_wheel').val() == 0 ? '0.2':'1' ) );
					$('#img_w_out_nnext').css('opacity', ( $('#nnext_out_wheel').val() == 0 ? '0.2':'1' ) );
					
					$('#img_b_on_curr2').css('visibility', ( $('#cur_on_blind').val() == 0 ? 'hidden':'visible' ) );
					$('#img_b_out_curr2').css('visibility', ( $('#cur_out_blind').val() == 0 ? 'hidden':'visible' ) );
					$('#img_b_on_next2').css('visibility', ( $('#next_on_blind').val() == 0 ? 'hidden':'visible' ) );
					$('#img_b_out_next2').css('visibility', ( $('#next_out_blind').val() == 0 ? 'hidden':'visible' ) );
					$('#img_b_on_nnext2').css('visibility', ( $('#nnext_on_blind').val() == 0 ? 'hidden':'visible' ) );
					$('#img_b_out_nnext2').css('visibility', ( $('#nnext_out_blind').val() == 0 ? 'hidden':'visible' ) );
					$('#img_w_on_curr2').css('visibility', ( $('#cur_on_wheel').val() == 0 ? 'hidden':'visible' ) );
					$('#img_w_out_curr2').css('visibility', ( $('#cur_out_wheel').val() == 0 ? 'hidden':'visible' ) );
					$('#img_w_on_next2').css('visibility', ( $('#next_on_wheel').val() == 0 ? 'hidden':'visible' ) );
					$('#img_w_out_next2').css('visibility', ( $('#next_out_wheel').val() == 0 ? 'hidden':'visible' ) );
					$('#img_w_on_nnext2').css('visibility', ( $('#nnext_on_wheel').val() == 0 ? 'hidden':'visible' ) );
					$('#img_w_out_nnext2').css('visibility', ( $('#nnext_out_wheel').val() == 0 ? 'hidden':'visible' ) );
					
						first_check = 1;
					console.log(i);
					if( up ){
													$('#cur_stop_name').val(s_list[i]['s_name']);
													$('#next_stop_name').val(s_list[i+1]['s_name']);
						if(i == s_list.length-2)	$('#nnext_stop_name').val(s_list[i]['s_name']);
						else						$('#nnext_stop_name').val(s_list[i+2]['s_name']);
					}
					else{
						$('#cur_stop_name').val(s_list[i]['s_name']);
						if(i == 0)			$('#next_stop_name').val(s_list[i+1]['s_name']);
						else				$('#next_stop_name').val(s_list[i-1]['s_name']);
						if(i == 0)			$('#nnext_stop_name').val(s_list[i+2]['s_name']);
						else if ( i == 1 )	$('#nnext_stop_name').val(s_list[i]['s_name']);
						else				$('#nnext_stop_name').val(s_list[i-2]['s_name']);						
					}
					$('#cur_stop_name').css('background-color', ( i % 2 == 0 ? 'lightgray':'white' ) );
					$('#next_stop_name').css('background-color', ( i % 2 == 0 ? 'white':'lightgray' ) );
					$('#nnext_stop_name').css('background-color', ( i % 2 == 0 ? 'lightgray':'white' ) );
					
					$('#cur_on_wheel').css('visibility', ( $('#cur_on_wheel').val() == 0 ? 'hidden':'visible' ) );
					$('#cur_on_blind').css('visibility', ( $('#cur_on_blind').val() == 0 ? 'hidden':'visible' ) );
					$('#next_on_wheel').css('visibility', ( $('#next_on_wheel').val() == 0 ? 'hidden':'visible' ) );
					$('#next_on_blind').css('visibility', ( $('#next_on_blind').val() == 0 ? 'hidden':'visible' ) );
					$('#nnext_on_wheel').css('visibility', ( $('#nnext_on_wheel').val() == 0 ? 'hidden':'visible' ) );
					$('#nnext_on_blind').css('visibility', ( $('#nnext_on_blind').val() == 0 ? 'hidden':'visible' ) );
					$('#cur_out_wheel').css('visibility', ( $('#cur_out_wheel').val() == 0 ? 'hidden':'visible' ) );
					$('#cur_out_blind').css('visibility', ( $('#cur_out_blind').val() == 0 ? 'hidden':'visible' ) );
					$('#next_out_wheel').css('visibility', ( $('#next_out_wheel').val() == 0 ? 'hidden':'visible' ) );
					$('#next_out_blind').css('visibility', ( $('#next_out_blind').val() == 0 ? 'hidden':'visible' ) );
					$('#nnext_out_wheel').css('visibility', ( $('#nnext_out_wheel').val() == 0 ? 'hidden':'visible' ) );
					$('#nnext_out_blind').css('visibility', ( $('#nnext_out_blind').val() == 0 ? 'hidden':'visible' ) );
					
					
					
					if(cycle_check == 1){
						if( !$('#infinite').is(":checked") )	{
							clearInterval(refresh);
							all_blind = 0;
							all_wheel = 0;
							$('#all_blind').val(0);
							$('#all_wheel').val(0);
							$('#cur_on_blind').val(0);
							$('#cur_on_wheel').val(0);
							$('#next_on_blind').val(0);
							$('#next_on_wheel').val(0);
							$('#nnext_on_blind').val(0);
							$('#nnext_on_wheel').val(0);
							
							$('#cur_out_blind').val(0);
							$('#cur_out_wheel').val(0);
							$('#next_out_blind').val(0);
							$('#next_out_wheel').val(0);
							$('#nnext_out_blind').val(0);
							$('#nnext_out_wheel').val(0);
							$.ajax({
								url : '/driver/refresh',
								data : 	{
											'car' : i+1,
											'go' : false,
											'blind' : '0',
											'wheel' : '0',
											'up' : up
										},
								dataType : 'json',
								method : 'get'
							}).done(function () {
								console.log('한바퀴 깔쌈하게 완료'); 
							});
							
						}
							cycle_check = 0;
					}
					if( up )	i++;
					else {
						i--;
						if ( i == 0 )	{
							up = true;
							cycle_check = 1;
						}
					}
				}).fail(function (err) {
					console.log(err,'!!!!!!!!!!!!!!');
				});	
			}, 2000);
		});
		$('#change').click(function () {
			location.href = 'getDriverList?ab_no=${ab_no}&b_no=${b_no}&b_type=${b_type}';
		});
		console.log(${ab_no});
	</script>

</body>
</html>
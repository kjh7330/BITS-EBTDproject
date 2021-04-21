<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<body>
	<h1>기사 메인화면</h1>

	현재 ${c_username}의 ${b_no}번 버스 ${d_name}기사님 운행중입니다.
	<br>
	<br> 이용자 총원
	<br> BLIND&nbsp; :
	<input id='all_blind' value=0>
	<br> WHEEL :
	<input id='all_wheel' value=0>
	<br>
	<br>


	<table>
		<tr>
			<td><input id="nnext_on_blind" value=0></td>
			<td>다다음 정류장</td>
			<td><input id="nnext_out_blind" value=0></td>
		</tr>
		<tr>
			<td><input id="nnext_on_wheel" value=0></td>
			<td><input id="nnext_stop_name"></td>
			<td><input id="nnext_out_wheel" value=0></td>
		</tr>
		<tr>
			<td>-----</td>
		</tr>
		<tr>
			<td><input id="next_on_blind" value=0></td>
			<td>다음 정류장</td>
			<td><input id="next_out_blind" value=0></td>
		</tr>
		<tr>
			<td><input id="next_on_wheel" value=0></td>
			<td><input id="next_stop_name"></td>
			<td><input id="next_out_wheel" value=0></td>
		</tr>
		<tr>
			<td>-----</td>
		</tr>
		<tr>
			<td><input id="cur_on_blind" value=0></td>
			<td>현재 위치</td>
			<td><input id="cur_out_blind" value=0></td>
		</tr>
		<tr>
			<td><input id="cur_on_wheel" value=0></td>
			<td><input id="cur_stop_name"></td>
			<td><input id="cur_out_wheel" value=0></td>
		</tr>
	</table>

	<button id='start'>운행시작</button>
	<button id='change'>교대</button> <br><br>
	<input type = 'checkbox' id = 'infinite'>노동에 끝은 없다. 무한히 달려라!


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
	
		$('#start').click(function () {
			let go = true;
			i = 0;
			let first_check = 0;
			let cycle_check = 0;
			let cnt = 0; 
			let test = [];
			let refresh = setInterval(function name() {
				$.ajax({
					url : 'refresh',
					data : 	{
								'car' : i+1,
								'go' : true,
								'out' : test,
								'blind' : all_blind,
								'wheel' : all_wheel
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
									if( r_list[idx]['ur_start_turn'] == s_list[i+2]['r_turn'] )
										if( r_list[idx]['u_type'] == 0 )	{
											nnext_on_blind_cnt++;
											name = ''+idx;  
											test[cnt++] =  { ur_no : r_list[idx]['ur_no'], name : name };
										}
										else{
											nnext_on_wheel_cnt++;
											name = ''+idx;  
											test[cnt++] =  { ur_no : r_list[idx]['ur_no'], name : name };
										}
									
									if( r_list[idx]['ur_last_turn'] == s_list[i+2]['r_turn'] )
										if( r_list[idx]['u_type'] == 0 )	nnext_out_blind_cnt++;
										else								nnext_out_wheel_cnt++;
								}
							}else{
								if(i == s_list.length-2){
									if( r_list[idx]['ur_start_turn'] == s_list[i]['r_turn'] )
										if( r_list[idx]['u_type'] == 0 )	{
											nnext_on_blind_cnt++;
											name = ''+idx;  
											test[cnt++] =  { ur_no : r_list[idx]['ur_no'], name : name };
										}
										else								{
											nnext_on_wheel_cnt++;
											name = ''+idx;  
											test[cnt++] =  { ur_no : r_list[idx]['ur_no'], name : name };
										}
									
									if( r_list[idx]['ur_last_turn'] == s_list[i]['r_turn'] )
										if( r_list[idx]['u_type'] == 0 )	nnext_out_blind_cnt++;
										else								nnext_out_wheel_cnt++;
								}if(i == s_list.length-3){
									if( r_list[idx]['ur_start_turn'] == s_list[i+2]['r_turn'] )
										if( r_list[idx]['u_type'] == 0 )	{
											nnext_on_blind_cnt++;
											name = ''+idx;  
											test[cnt++] =  { ur_no : r_list[idx]['ur_no'], name : name };
										}
										else								{
											nnext_on_wheel_cnt++;
											name = ''+idx;  
											test[cnt++] =  { ur_no : r_list[idx]['ur_no'], name : name };
										}
									
									if( r_list[idx]['ur_last_turn'] == s_list[i+2]['r_turn'] )
										if( r_list[idx]['u_type'] == 0 )	nnext_out_blind_cnt++;
										else								nnext_out_wheel_cnt++;
								}
							}
						}
						else{
							if( !r_list[idx]['up'] ){
								if( i != 1 ){
									if( r_list[idx]['ur_start_turn'] == s_list[i-2]['r_turn'] )
										if( r_list[idx]['u_type'] == 0 )	{
											nnext_on_blind_cnt++;
											name = ''+idx;  
											test[cnt++] =  { ur_no : r_list[idx]['ur_no'], name : name };
										}
										else								{
											nnext_on_wheel_cnt++;
											name = ''+idx;  
											test[cnt++] =  { ur_no : r_list[idx]['ur_no'], name : name };
										}
								
									if( r_list[idx]['ur_last_turn'] == s_list[i-2]['r_turn'] )
										if( r_list[idx]['u_type'] == 0 )	nnext_out_blind_cnt++;
										else								nnext_out_wheel_cnt++;
								}
							}else{
								if( i == 1 ){
									if( r_list[idx]['ur_start_turn'] == s_list[i]['r_turn'] )
										if( r_list[idx]['u_type'] == 0 )	{
											nnext_on_blind_cnt++;
										}
										else								{
											nnext_on_wheel_cnt++;
										}
									
									if( r_list[idx]['ur_last_turn'] == s_list[i]['r_turn'] )
										if( r_list[idx]['u_type'] == 0 )	nnext_out_blind_cnt++;
										else								nnext_out_wheel_cnt++;
								}if( i == 2 ){
									if( r_list[idx]['ur_start_turn'] == s_list[i-2]['r_turn'] )
										if( r_list[idx]['u_type'] == 0 )	{
											nnext_on_blind_cnt++;
										}
										else								{
											nnext_on_wheel_cnt++;
										}
									
									if( r_list[idx]['ur_last_turn'] == s_list[i-2]['r_turn'] )
										if( r_list[idx]['u_type'] == 0 )	nnext_out_blind_cnt++;
										else								nnext_out_wheel_cnt++;
								}
							} 
						}
						
						if( first_check == 0 )
							if(up){
								if( r_list[idx]['ur_start_turn'] == s_list[i]['r_turn'] )
									if( r_list[idx]['u_type'] == 0 )	{
										cur_on_blind_cnt++;
										name = ''+idx;  
										test[cnt++] =  { ur_no : r_list[idx]['ur_no'], name : name };
									}
									else								{
										cur_on_wheel_cnt++;
										name = ''+idx;  
										test[cnt++] =  { ur_no : r_list[idx]['ur_no'], name : name };
									}
								else if( r_list[idx]['ur_start_turn'] == s_list[i+1]['r_turn'] )
									if( r_list[idx]['u_type'] == 0 )	{
										next_on_blind_cnt++;
										name = ''+idx;  
										test[cnt++] =  { ur_no : r_list[idx]['ur_no'], name : name };
									}
									else								{
										next_on_wheel_cnt++;
										name = ''+idx;  
										test[cnt++] =  { ur_no : r_list[idx]['ur_no'], name : name };
									}
								
								if( r_list[idx]['ur_last_turn'] == s_list[i]['r_turn'] )
									if( r_list[idx]['u_type'] == 0 )	cur_out_blind_cnt++;
									else								cur_out_wheel_cnt++;								
								else if( r_list[idx]['ur_last_turn'] == s_list[i+1]['r_turn'] )
									if( r_list[idx]['u_type'] == 0 )	next_out_blind_cnt++;
									else								next_out_wheel_cnt++;
								
							}
					
						for(jdx in test){
							if( r_list[idx]['ur_last_turn'] == s_list[i]['r_turn'] )
								if(r_list[idx]['ur_no'] == test[jdx]['ur_no']) 
									if(r_list[idx]['up'] == up ){
										console.log('무야호! ' + s_list[i]['s_name'] + "정류장에서 예약번호" + r_list[idx]['ur_no'] + '번 손님 내림!');
										test.splice(jdx, 1);
										cnt--;
									}
						}
					}// for each end
					
					for(idx in test){
						console.log(test[idx]['ur_no'],'번 예약손님 탑승중');
						console.log('--');
					}
					console.log('------------');
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
					
						first_check = 1;
					
					if( up ){
						$('#cur_stop_name').val(s_list[i]['s_name']);
						$('#next_stop_name').val(s_list[i+1]['s_name']);
						if(i == s_list.length-2)	$('#nnext_stop_name').val(s_list[i]['s_name']);
						else						$('#nnext_stop_name').val(s_list[i+2]['s_name']);
					}
					else{
						$('#cur_stop_name').val(s_list[i]['s_name']);
						$('#next_stop_name').val(s_list[i-1]['s_name']);
						if(i == 1)	$('#nnext_stop_name').val(s_list[i]['s_name']);
						else		$('#nnext_stop_name').val(s_list[i-2]['s_name']);						
					}
					
					if(cycle_check == 1){
						if( !$('#infinite').is(":checked") )	{
							clearInterval(refresh);
							all_blind = 0;
							all_wheel = 0;
							$('#all_blind').val(0);
							$('#all_wheel').val(0);
						}
						$.ajax({
							url : 'refresh',
							data : 	{
										'car' : i+1,
										'go' : false,
										'blind' : '0',
										'wheel' : '0'
									},
							dataType : 'json',
							method : 'get'
							
						}).done(function () {
							console.log('한바퀴 깔쌈하게 완료'); 
						});
						cycle_check = 0;
					}
					
					if( up )	i++;
					else	{
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
			location.href = 'getDriverList?ab_no=${ab_no}&b_no=${b_no}';
		});
		console.log(${ab_no});
		
		function sleep(ms) {
			  const wakeUpTime = Date.now() + ms
			  while (Date.now() < wakeUpTime) {}
			}
		
		
		
		
		
		
	
	</script>

</body>
</html>
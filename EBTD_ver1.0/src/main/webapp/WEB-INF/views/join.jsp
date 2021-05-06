<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입창 입니다.</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">
	input {
		border-radius: 8px;
		height : 29px;
		width : 130px;
		font-size : 16px;
		padding-left : 8px;
	}
	button {
		border-radius: 8px;
		font-size : 16px;
	}
	#div_all {
		width: 100%;
		height : 100%;
	}
	#div_contents {
		width: 700px;
		padding: 0px;
		position: absolute;
		top : 5%;
		left : 50%; 
		transform: translate(-35.5%, 0%); 
		
	}
	#div_space{
		width : 200px;
		height : 10px; 
		margin-right : 100px;
	}
	html {
		background-color: #0C3D6A;
	}
	body {
		border : 0px;
	}
	img {
		width: 90px;
	}
	#div_logo {
		width: 90px;
		margin-left: auto;
	}
	.title {
		color: white;
	}
	.title_width{
		color: white;
		width: 80px;
	}
	p {
		color: #b5b3b3;
		margin: 0px;
		font-size: 10px;
	}
	button{
		background-color : lightgray;
	}
	button:hover{
		background-color : gray;	
	}
	.add_column{
		background-color : #f9eb99;
		width : 23px;
		height : 23px;
		border-radius: 15px;
		font-size:15px;
	}
	.add_column:hover{
		background-color : #dccf87;
	}
	#add_driver_btn{
		margin-top: 10px;
		background-color : #f9eb99;
		border-radius: 15px;
		height: 40px;
		width: 80px;
		font-size: 17px;
	}
	#add_driver_column{
		background-color : #f9eb99;
	}
	#add_driver_column:hover{
		background-color : #dccf87;
	}
	#add_driver_btn:hover{
		background-color : #dccf87;
	}
	.del_column, .del_d_column_class{
		background-color : #f77373;
		width : 23px;
		height : 23px;
		border-radius: 15px;
		font-size:15px;
	}
	.del_column:hover{
		background-color : #bf5858;
	}
	select{
		border-radius: 8px;
		border : none;
	}
	select option{
		width : 90px;
	}
	.new_bus, #new_driver_table{
		border: 1px solid black;
		margin-bottom: 5px;
		padding: 8px;
		width : 430px;
		background-color : rgba( 255, 255, 255, 0.5 ); 
		border-radius : 8px;
		text-align : center;
	}
	.new_bus tr td, #new_driver_table tr td {
		margin: 0px;
		padding: 2px; 
		margin-bottom: 3px;
		width : 130px;
	}
	td {
		margin: 0px;
		padding: 0px;
		color: white;
	}
	.bus_no {
		width: 120px;
	}
	.sel_low {
		height : 29px;		
	}
	#new_driver_table {
		border: 1px solid black;
		font-size : 16px;
	}
	#new_driver_table tr td{
		width : 80.6px;
		text-align : center;
	}
	.bus_modal, .dr_modal {
		position: fixed;
		width: 100%;
		height: 100%;
		background: rgba(70, 70, 70, 0.8);
		top: 0;
		left: 0;
		display: none;
	}
	.bus_modal_content, .dr_modal_content {
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -60%);
		width: 500px;
		height: 370px;
		background: lightgray;
		border: solid black 5px;
		border-radius: 8px;
	}
	#add_driver_table{
		margin-left: auto;
		margin-right: auto;
	}
	#add_driver_table tr td{
		color: #0C3D6A; 
	}
	#add_driver_table tr td input{
		width : 140px;
		color: #0C3D6A;
		margin-top : 4px;
	}
	#add_driver_table tr td select{
		width : 148px;
		color: #0C3D6A;
	}
	#dr_title{
		margin-left: auto;
		margin-right: auto;
		color: #0C3D6A;
	}
	#bus_sel{
		margin-top: 3px;
		padding-left: 6px;
		height: 29px;
		font-size: 15px;
	}
	#d_enterDate{
		margin-bottom: 2px;
		width: 150px;
	}
	#td_logo{
		padding-right : 78px;
	}
	#add_new_bus{
		margin-bottom : 10px;
	}
</style>
</head>
<body>
	<div id = 'div_all'>
		<div id='div_contents'>
			<form action="/company/main/join" method="post" id = 'mainform'>
				<div id=''>
					<table id='table_contents'>
						<tr>
							<td/>
							<td id = 'td_logo' colspan = 2> 
								<div id = 'div_logo'>
									<img alt="logo" src="/resources/image/mainlogo.png">
								</div>
							</td>
						</tr>
						<tr>
							<td><br><br></td> 
						</tr>
						<tr>
							<td class='title'>업체명 :</td>
							<td><input name="c_username" id="c_username" />
							<td class='title'>&nbsp;사업자 등록번호 :</td>
							<td><input name="c_no" id="c_no"/>
						</tr>
						<tr>
							<td/>
							<td colspan = 2>
								<div class="check_font" id="id_check">업체명을 입력해주세요</div></td>
							</td>
						</tr>
						<tr>
							<td class='title'>비밀번호 :</td>
							<td><input id='pw' name="c_password" type='password' /> <br>
							</td>
							<td class='title'>비밀번호 확인 :</td>
							<td><input id='pw_check' type='password' /> <br></td>
						</tr>
						<tr>
							<td class='title' />
							<td>
								<p id='pw_check_text'>비밀번호가 맞는지 확인 해주세요.</p>
							</td>
						</tr>


						<tr>
						</tr>
						<tr>
							<td rowspan=20 class='title' style = 'vertical-align : top;'>노선 등록 :</td>
							<td id = 'add_bus_td' colspan = 4>
						</tr>
					</table>

					<table>
						<tr>
							<td class='title_width' />
							<td id='btn_area' colspan=2>
								<button id='add_new_bus' type='button'>노선도 추가</button>
								<button type="button" id="del_new_bus">노선도 삭제</button>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td class='title_width'>기사 목록 :</td>
							<td>
								<table id='new_driver_table'>
									<tr>
										<td class='new_driver_td'>버스노선</td>
										<td class='new_driver_td'>기사이름</td>
										<td class='new_driver_td'>전화번호</td>
										<td class='new_driver_td'>입사일</td>
										<td class='new_driver_td'><button type='button' id='add_driver_column'>추가</button></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>

					<table> 
						<tr>
							<td class='title_width' />
							<td>
							</td>
						</tr>
					</table>
				</div>
			</form>
			<button id='submit_btn' type = 'button'>업체 등록 신청</button>
		</div>
	</div>

	<div class="bus_modal">
		<div class="bus_modal_content">
			<div class="modal_header">
				<p style="color: black; text-align: center;">새로운 노선 등록 신청</p>
			</div>
			<div class="modal_content" style="text-align: center;">
				<p style="color: black;">동, 읍, 면 선택</p>
				<select id="mTownSelect"></select>
				<p style="color: black;">차고지 선택</p>
				<select id="mStopSelect">
					<option selected = true>동, 읍, 면을 먼저 선택해주세요.</option>
				</select>
				<p style = "color: black;">다음 추천 정류장</p>
				<select id="mRecommendStop">
					<option selected = true>차고지를 먼저 선택해주세요.</option>
				</select>
				<input type = "button" id = "recommendConfi" value = "선택">
				
			</div>
			<div id = "busRouteSelect"></div>
			<button type = 'button' id="add_Route">노선 추가 완료</button>
		</div>
	</div>
	<div class="dr_modal">
		<div class="dr_modal_content">
			<h2 id = 'dr_title' style = 'text-align : center;' >기사 등록</h2>
			<table id = 'add_driver_table'>
			<tr>
				<td><br></td>
			</tr>
				<tr>
					<td class = 'title'>기사 이름 : </td>
					<td class = 'content_td'>
						<input type="text" id="d_name" name="d_name"><br>
					</td>
	      		</tr>
				<tr>
					<td class = 'title'>핸드폰 번호 : </td>
					<td class = 'content_td'>
						<input type="text" id="d_phoneNum" name="d_phoneNum"><br>
					</td>
	      		</tr>
				<tr>
					<td class = 'title'>입사일 : </td>
					<td class = 'content_td'>
						<input type="date" id="d_enterDate" name="d_enterDate"><br>
					</td>
	      		</tr>
				<tr>
					<td class = 'title'>운행노선 : </td>
					<td class = 'content_td'>
						<select id = 'bus_sel'/>
					</td>
	      		</tr>
	      		<tr>
	      			<td class = 'title'></td>
	      			<td>
						<button id = 'add_driver_btn' type="button" >추가</button>   
	      			</td>
	      		</tr>
			</table>
		</div>
	</div>
</body>

<script type="text/javascript">

	$('#submit_btn').click(function (){
		if( $('#c_username').val() == '' ){
			alert("업체명을 입력해주세요");
			return;
		}
		if( $('#c_no').val() == '' ){
			alert("사업자 등록번호를 입력해주세요");
			return;
		}
		if( $('#pw').val() == '' ){
			alert("비밀번호를 입력해주세요");
			return;
		}
		if( $('#pw_check').val() == '' ){
			alert("비밀번호 확인을 입력해주세요");
			return;
		}
		if( $('#pw').val() != $('#pw_check').val() ){
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다");
			return;
		}
		let check = 1;
		let check_stop = 1;
		idx--;
		for( data of $('.new_bus') )	$('#mainform').append("<input name = 'new_line_car_size_" + check++ + "' value = '" + $(data).find('.car_no').length + "' style = ' display : none; '>");			
		for( data of $('.s_no') )		$('#mainform').append("<input name = 'new_line_stop_size_" + check_stop++ + "' value = '" + $(data).find('.car_no').length + "' style = ' display : none; '>");			
		
		$('#mainform').append("<input name = 'new_line_size' value = '" + table_idx + "'style = ' display : none; '>");
		$('#mainform').append("<input name = 'driver_cnt' value = '" + idx + "'style = ' display : none; '>");
		
		
		for( data of $('#mainform').find('input') ){
			console.log( $(data).attr('name') + ' = ' + $(data).val());
		}
		for( data of $('#mainform').find('select') ){
			console.log( $(data).attr('name') + ' = ' + $(data).val());
		}
		
		$('form').trigger('submit');
	});
	
	let car_idx = 0;
	$('#add_Route').click(function () { // 버스 노선 하나씩 다 정하고 난 뒤 노선 등록 버튼 눌렀을때
		let tx = '';
		car_idx++;
		let stop_idx = 0;
		for( child of $('.stopRouteNum') ){
			console.log(access_idx + '번째 신청 버스입니다.' + access_bus_no +'번 버스의 ' + $(child).attr('id').substring(11) + '번째 정류장 번호는 ' + $(child).val());
			
			tx += '<input class = "s_no'+access_idx+'" name = "s_no_' + access_idx + '_' + $(child).attr('id').substring(11) + '" value = "' + $(child).val() + '" style = " display : none; ">';
			stop_idx++;
		}	
		tx +='<input class = "s_no_size_' + access_idx + '" name = "s_no_size_' + access_idx + '" value = "' + stop_idx + '" style = " display : none; ">';
		$('.s_no'+access_idx+'').remove();
		$('.s_no_size_'+access_idx+'').remove();
		$('#mainform').append(tx);
		/*		
				for( child of $('.stopRouteNum') )	
				access_idx : 해당 노선 등록 칸이 몇번째 칸인지
				access_bus_no : 해당 노선 등록의 버스 번호가 무엇인지				name = 'b_no'
				$(child).attr('id').substring(11) : 해당 버스의 정류장 순서 	name = 'apde_turn'
				$(child).val() : 해당 순서의 정류장 번호						name = 's_no'
		*/
		$(".bus_modal").fadeOut();
	});
	
	let new_line = {};
	let new_lines = {};

	let table_idx = 0;
	let column_idx = 0;
	make_new_bus_table(column_idx);
	$('#btn_area').css('width','300px');
	$('#add_new_bus').click(function () {
		make_new_bus_table(column_idx);
		$('.title').css('text-align','right').css;
	});
	$('#del_new_bus').css('display','none');
	
	$('#add_driver_column').click(function () {
		$(".dr_modal").fadeIn();
		let tx = '<option value = "">노선 선택</option>';
		
		for(data of $('#add_bus_td').children() ){
			if( $(data).children().children().children().children().first().val() != ''){
				tx += "<option val = '" + $(data).children().children().children().children().first().val() + "'>"
				tx += $(data).children().children().children().children().first().val() + "</option>";
			}
		}
		$('#bus_sel').html(tx);
	});
	
	let idx = 1;  
	$('#add_driver_btn').click(function () {
		if( $('#d_name').val() == '' ){
			alert('이름 입력!');
			return;		
		}
		if( $('#d_phoneNum').val() == '' ){
			alert('전화번호 입력!');
			return;		
		}
		if( $('#d_enterDate').val() == '' ){
			alert('입사일 선택!');
			return;		
		}
		if( $('#bus_sel').val() == '' ){
			alert('담당 노선 선택!');
			return;		
		}
		let tx = '';
		tx += '<tr id = "d_column_' + idx + '">';
		tx += '<td>' + $('#bus_sel').val() + '</td>';
		tx += '<td>' + $('#d_name').val() + '</td>';
		tx += '<td>' + $('#d_phoneNum').val() + '</td>';
		tx += '<td>' + $('#d_enterDate').val() + '</td>';
		tx += '<td><button class = "del_d_column_class" id = "del_d_column_' + idx + '">-</button></td>'; 
		tx += '</tr>';
		$('#new_driver_table').append(tx);
		
		$('#del_d_column_'+idx+'').click(function () {
			$(this).parent().parent().remove();
			idx--;
		});
		$(".dr_modal").fadeOut(); 
		
		tx = '';
		tx += '<input name = "d_name_' + idx + '" value = ' + $('#d_name').val()  + ' style = " display : none; ">';
		tx += '<input name = "d_phoneNum_' + idx + '" value = ' + $('#d_phoneNum').val() + ' style = "display : none;">';
		tx += '<input name = "d_enterDate_' + idx + '" value = ' + $('#d_enterDate').val() + ' style = "display : none;">';
		tx += '<input name = "d_b_no_' + idx + '" value = ' + $('#bus_sel').val() + ' style = "display : none;">';
		$('#mainform').append(tx);
		idx++;
		
		$('#bus_sel').val('');
		$('#d_name').val('');
		$('#d_phoneNum').val('');
		$('#d_enterDate').val('');
	});
	
	$(".bus_modal").click(function(e){
		if($('.bus_modal').is(e.target))	$(".bus_modal").fadeOut(); 
	});
	$(".dr_modal").click(function(e){
		if($('.dr_modal').is(e.target))	$(".dr_modal").fadeOut(); 
	});
	$('#del_new_bus').click(function () {
		$('#add_bus_td').children().last().remove();
		table_idx--;
		if(table_idx < 2) $('#del_new_bus').css('display','none');
	});
	
	function make_new_bus_table(column_idx) {
		table_idx++; 
		column_idx++;
		let tx = "<table id = 'table_" + table_idx + "' class = 'new_bus'><tr>";   
		tx += "<td> &nbsp;노선 " + table_idx + "</td><td><input name = 'bus_no_" + table_idx + "' style = 'width : 100px;' id = 'bus_no_" + table_idx + "' class = 'bus_no'></td><td><button class = 'dup_check_btn' style = 'margin-top : 2px;' id = 'choice_" + table_idx + "' type = 'button'>노선 선택</button></td></tr>";
		tx += "<tr>";
		tx += "<td></td><td>차량번호</td>";
		tx += "<td>버스종류</td><td><button id = 'add_column_"+table_idx +"_" + column_idx+"' class = 'add_column' type = 'button'>+</button></td></tr><tr>";
		tx += "<td></td><td><input style = 'width : 100px;' id = 'car_no_"+table_idx +"_" + column_idx+"' name = 'car_no_"+table_idx +"_" + column_idx+"' class = 'car_no'></td>";
		tx += "<td><select style = 'width : 85px;'class = 'sel_low' name = 'is_low_"+table_idx +"_" + column_idx+"'>";
		tx += "<option value = 0 selected = true >일반버스</option><option value = 1>저상버스</option>"
		tx += "</select></td></tr>";
		tx += "</table>";
		//$('#table_contents').children().children().last().append(tx);
		$('#add_bus_td').append(tx);
		$('#choice_' + table_idx + '').css('background-color','#ffbc7d').hover(function () {
			$(this).css('background-color','#ff8c20');
		},function() {
			$(this).css('background-color','#ffbc7d');
		});
		
		$('#car_no_'+table_idx +"_" + column_idx+'').focusout(function () {
			let check_idx = 0;
			let $this = $(this);
			for( data of $('.car_no') )	if ( ( $(this).val() != '' ) && ( $(this).val() == $(data).val() ) )	check_idx++;
			if( check_idx > 1 ){
				alert('등록하시려는 차량번호 중 중복되는 차량번호가 이미 존재합니다.');
				$(this).val('');
				$(this).focus();
				
				return;
			}
			if( $(this).val() != ''){
				$.ajax({
					url : "/company/main/carNumberDupCheck",
					data : {ab_no : $(this).val()},
					dataType : 'html'
				}).done(function (data) {
					if(data > 0){
						$($this).val('').focus();
						alert('등록하시려는 차량번호는 타 업체에서 이미 사용중입니다.');
					}
					else	console.log('사용가능 비동기');
					
				}).fail(function (err) {
					console.log(err,'!!!!!!!');
				});
			}
		});
		
		$("#choice_" + table_idx + '').on("click", function(){
			$('#mTownSelect option:eq(0)').prop("selected",true);
			$('#mStopSelect').html("<option value ='' selected = true>동, 읍, 면을 먼저 선택해주세요.</option>");
			$('#mRecommendStop').html("<option value = '' selected = true>차고지를 먼저 선택해주세요.</option>");
			$('#busRouteSelect').html('');
			access_idx = $(this).attr('id').substring(7);
			access_bus_no = $('#bus_no_' + access_idx + '').val();
			
			let check_idx = 0;
			
			for( data of $('.bus_no') )	if( access_bus_no == $(data).val() && $(data).val() !='' )	check_idx++;
				
			if(check_idx > 1){
				alert('등록하시려는 버스번호 중 중복되는 버스번호가 이미 존재합니다.');
				$('#bus_no_'+ access_idx +'').val('');
				$('#bus_no_'+ access_idx +'').focus();
				return;
			}
			
			$.ajax({
				type : 'get',
				url : '/company/bus/busNumCheck',
				data : {'busNum' : $('#bus_no_' + access_idx + '').val()},
				dataType : 'html'
			}).done(function (data) {
				if($('#bus_no_' + access_idx + '').val() != '') {
					if(data==0){
						$('#mBusNum').val($('#busNum').val());
						$(".bus_modal").fadeIn();
						//$("#overlay").css({ visibility:"visible", opacity:1 });
						//$("#myModal").css({ display: "inline"});
				  	} else if(data!=0) {
					 	alert("타 업체에 이미 등록된 버스번호입니다.");
					 	$('#bus_no_' + access_idx + '').val('');
						$('#bus_no_'+ access_idx +'').focus();
				 	}
				} else {
					alert("노선번호를 입력하세요.");
				}
			}).fail(function (err) {
				alert(err,"!!!!!!!!!!!!");
			});
		});
		
		$('#add_column_'+table_idx +'_'+column_idx+'').click(function () {
			column_idx++;
			let text = "<tr><td></td><td><input style = 'width : 100px;'  id = 'car_no_" + $(this).attr('id').split('_')[2] + "_" + column_idx+"' name = 'car_no_" + $(this).attr('id').split('_')[2] + "_" + column_idx+"' class = 'car_no'></td>";
			text += "<td><select style = 'width : 85px;' class = 'sel_low' name = 'is_low_" + $(this).attr('id').split('_')[2] + "_" + column_idx+"'>";
			text += "<option value = 0 selected = true >일반버스</option><option value = 1>저상버스</option>";
			text += "</select></td><td><button type = 'button' class = 'del_column' id = 'del_column_" + $(this).attr('id').split('_')[2] +"_" + column_idx+"'>-</button></td></tr>";
			$(this).parent().parent().parent().append(text);
			$('#car_no_'+table_idx +"_" + column_idx+'').focusout(function () {
				let check_idx = 0;
				let $this = $(this);
				for( data of $('.car_no') )	if ( ( $(this).val() != '' ) && ( $(this).val() == $(data).val() ) )	check_idx++;
				if( check_idx > 1 ){
					alert('등록하시려는 차량번호 중 중복되는 차량번호가 이미 존재합니다.');
					$(this).val('');
					$(this).focus();
				}
				if( $(this).val() != ''){
					$.ajax({
						url : "/company/main/carNumberDupCheck",
						data : {ab_no : $(this).val()},
						dataType : 'html'
					}).done(function (data) {
						if(data > 0){
							alert('등록하시려는 차량번호는 타 업체에서 이미 사용중입니다.');
							$($this).val('').focus();
						}
						else	console.log('사용가능 비동기');
						
					}).fail(function (err) {
						console.log(err,'!!!!!!!');
					});
				}
			});
			$('#del_column_' + $(this).attr('id').split('_')[2] +'_'+ column_idx+'').click(function () {
				column_idx--;				
				$(this).parent().parent().remove();
			});
		});
		$('#del_column_'+table_idx +'_'+column_idx+'').click(function () {
				$(this).parent().parent().remove();
		});
		$('#bus_no').css('width','150px');
		$('.del_btn').css('text-align','right');
		if(table_idx >= 1)   $('#del_new_bus').css('display','inline');
	}
	
	$('.title').css('text-align','right');
	$('.title_width').css('text-align','right').css('vertical-align','top');
	$('#id_check').css('color','#b5b3b3').css('font-size', '10px');
	
	let pw_check = 0;
	
	$('#pw_check').blur(function () { 
		if($(this).val() != '')
			if($(this).val() == $('#pw').val()){
				$('#pw_check_text').html('비밀번호가 일치합니다.').css('color', '#21e460');
				pw_check = 1;
			}
			else                                 {
				$('#pw_check_text').html('비밀번호가 일치하지 않습니다.').css('color', 'red');
				pw_check = 0;
   }
	}); 
	$('#pw').blur(function () {
		if($(this).val() != '')
			if($(this).val() == $('#pw_check').val()){
				$('#pw_check_text').html('비밀번호가 일치합니다.').css('color', '#21e460');
				pw_check = 1;
			}
			else                                 {
				$('#pw_check_text').html('비밀번호가 일치하지 않습니다.').css('color', 'red');
				pw_check = 0;
			}
	}); 
	
	
	
	//중복확인 비동기통신
	$('#c_username').blur(function() {
		if($('#c_username').val() != ''){
			let regexp =  /^[가-힣0-9]{4,20}$/;
			let isCheck = false;   
			var idVal =$('#c_username').val();
			var user_id = $('#c_username').val();
			$.ajax({
				url : '/join/checkId?c_username='+user_id,
				type : 'get',
				success : function(data) {
					if(data == 1){
						$("#id_check").text("사용중인 업체명입니다");
						$("#id_check").css("color", "red");
						$("#submit").attr("disabled", true);
					}else {
						if(regexp.test(user_id)){
							// 0 : 아이디 길이 / 문자열 검사
							$("#id_check").text("사용 가능한 업체명 입니다.");
							$('#id_check').css('color', '#21e460');
							$("#submit").attr("disabled", false);
						} else if(user_id == ""){
							$('#id_check').text('아이디를 입력해주세요');
							$('#id_check').css('color', 'red');
							$("#submit").attr("disabled", true);            
						} else {
							$('#id_check').text("아이디는 문자, 숫자를 조합해, 4~20자리 입니다.");
							$('#id_check').css('color', 'red'); 
							$("#reg_submit").attr("disabled", true);
							$('#c_username').val('');
						}
					}
				},error : function(err) {
					console.log(err,'!!!!!!!!!!!');
				}
			});
		}
	});   //중복확인 end @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
/*    function replaceAll(str, searchStr, replaceStr) {
		return str.split(searchStr).join(replaceStr);
   	}
    $("#c_no").blur(function(){
       
//	   let num = $("#u_disabled_no").val().replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
	   let num = $("#u_disabled_no").val();
	   num = num.replaceAll(num,' ','');
	   var tmp = 
	   tmp += num.substr(0, 3);
	   tmp += '-';
	   tmp += num.substr(3, 5);
	   tmp += '-';
	   tmp += num.substr(5,10);
	   $("#c_no").val(tmp);
    });
    $("#c_no").click(function(){
       var num = $("#c_no").val();
	   num = num.replace(/[^0-9]/g, '');
	   $("#c_no").val(num);
    });*/
    	 



	
	let tList = ${tList};
	let sList = ${sList};
	var startX;
	var startY;
	let tName;
	var j = 1;
	let dup_check = 0;
	
	$('#mTownSelect').append("<option value ='' selected = true>동 선택</option>");
	
	for(let i in tList) {
	let tName = tList[i]['t_NAME'];
		$('#mTownSelect').append("<option value ='"+tName+"'>"+tName+"</option>");
	}
	// 모달창 열기 이벤트
	let access_idx;
	

	  // 모달창 닫기 이벤트 
	 $(document).on("click", function(e){  
	    if( $("#overlay").is(e.target) ) {
	        $("#overlay").css({ visibility:"hidden", opacity:0 });
	    }
	  });

	  // esc 누를시 모달창 닫기
	  $(document).keydown(function(event) {
	    if ( event.keyCode == 27 || event.which == 27 ) {
	        $("#overlay").css({ visibility:"hidden", opacity:0 });
	    }
	});
	//동,읍,면 선택 시 해당 지역의 정류장 리스트 불러오기
	$('#mTownSelect').on('change', function() {	
		
		let townSelect = $('#mTownSelect').val();
		$('#busRouteSelect').html('');
		if( $(this).val() == ''){
			$('#mStopSelect').html("<option value ='' selected = true>동, 읍, 면을 먼저 선택해주세요.</option>");
			$('#mRecommendStop').html("<option value ='' selected = true>차고지를 먼저 선택해주세요.</option>")
		}
		else						$('#mStopSelect').html("<option selected = true>차고지 선택</option>");
		
		for (let i in sList) {
			if(sList[i]['t_NAME'] == townSelect) {
				$('#mStopSelect').append("<option value ='"+sList[i]['s_NAME']+"'>"+sList[i]['s_NAME']+"</option>");
			}
		}
		
		
	});
	//정류장 루트 짜기
	let check = 0;
	$('#mStopSelect').on('change', function() {
		let selectStop = $('#mStopSelect').val();
		let stopRoute = $('.stopRoute').val();
		$('#busRouteSelect').html('');
		let selectX;
		let selectY;
		let selectStopNumber;
		j = 1;
		//선택한 정류장 번호 가져오기
		$('#busRouteSelect').append("<input type = 'text' class = 'stopRoute' value = '" + j + " : " + $('#mStopSelect').val() + "' readOnly id = 'route_" + table_idx + "_" + j + "'>");
		for(let i in sList){
			if($('#mStopSelect').val() == sList[i]['s_NAME'] && $('#mTownSelect').val() == sList[i]['t_NAME']) {
				$('#busRouteSelect').append("<input type = 'text' class = 'stopRouteNum' value = '" + sList[i]['s_NO'] + "' readOnly id = 'route_no_" + table_idx + "_" + j + "'><br>");
			}
		}
		//선택한 정류장 찍기
		//선택한 정류장의 좌표 가져오기
		for(let i in sList) {
			if(selectStop == sList[i]['s_NAME']) {
				selectX = sList[i]['s_X'];
				selectY = sList[i]['s_Y'];
			}
		};
		//범위 안에 정류장 가져오기
		$('#mRecommendStop').html("<option value = 0 selected = true>다음 정류장을 선택해주세요.</option>");
		for(let i in sList) {
			if(selectX-5 < sList[i]['s_X'] && sList[i]['s_X'] < selectX+5 && selectY-5 < sList[i]['s_Y'] && sList[i]['s_Y'] < selectY+5 && selectStop != sList[i]['s_NAME'] ) {
				for(data of $('.stopRouteNum') )
					if(sList[i]['s_NO'] == $(data).val())  {
						console.log('중복 정류장은 너굴맨이 처리했으니 안심하라구!');
						dup_check = 1;
					}
				if( dup_check == 0 )	$('#mRecommendStop').append("<option value ='"+sList[i]['s_NAME']+"'>"+sList[i]['s_NAME']+"</option>");
				dup_check = 0;
				check = 1;
			};
		};
		//출발 정류장 셀렉박스 비활성화
		startX = selectX;
		startY = selectY;
		j++;
	});  


	//추천 정류장 선택 버튼 클릭 
	$('#recommendConfi').on('click', function() {
		var recommendSelect = $('#mRecommendStop').val();
		let recommendStopNumber;
		//선택한 정류장 정류장 번호 가져오기
		if( $("#mRecommendStop option:selected").val() == 0 ){
			alert( $('#mRecommendStop option:selected').html() );
			
			return;
		}
		for(let i in sList) {
			if(recommendSelect == sList[i]['s_NAME']) {
				recommendStopNumber = sList[i]['s_NO'];
			};	
		};
		//선택한 정류장 찍기
		$('#busRouteSelect').append("<input type = 'text' class = 'stopRoute' value = '" + j + " : "+recommendSelect+"' readOnly id = 'route_" + table_idx + "_" + j + "'>");
		$('#busRouteSelect').append("<input type = 'text' class = 'stopRouteNum'  value = '"+recommendStopNumber+"' readOnly id = 'route_no_" + table_idx + "_" + j + "'><br>");
		$('#stopCount').val(j);
		//select 박스 초기화
		$('#mRecommendStop').html('');
		if( check == 0 )	$('#mRecommendStop').html("<option value = 0 selected = true>추천 정류장이 없습니다.</option>");
		else				$('#mRecommendStop').html("<option value = 0 selected = true>다음 정류장을 선택해주세요.</option>");
		check = 0;
		//선택한 정류장 좌표 가져오기
		for(let i in sList) {
			if(recommendSelect == sList[i]['s_NAME']) {
				recommendX = sList[i]['s_X'];
				recommendY = sList[i]['s_Y'];
				};
		};
		//범위 안에 선택 할 정류장 가져오기
		var recommendStopName;
		//x축 +, y축 + 인 경우
		if(startX < recommendX && startY < recommendY) {
			for(let i in sList) {
				if((recommendX-5 < sList[i]['s_X'] && sList[i]['s_X'] < recommendX+5 && recommendY < sList[i]['s_Y'] && sList[i]['s_Y'] < recommendY+10)||(recommendX < sList[i]['s_X'] && sList[i]['s_X'] < recommendX+5 && recommendY-5 < sList[i]['s_Y'] && sList[i]['s_Y'] < recommendY)) {
					recommendStopName = sList[i]['s_NAME'];
					for(data of $('.stopRouteNum') )
						if(sList[i]['s_NO'] == $(data).val())  {
							console.log('중복 정류장은 너굴맨이 처리했으니 안심하라구!');
							dup_check = 1;
						}
					if( dup_check == 0 )	$('#mRecommendStop').append("<option value ='"+recommendStopName+"'>"+recommendStopName+"</option>");
					dup_check = 0;
					check = 1;
					
					
				};
			};//for문 end
		}//if문 end
		//x축 +, y축 - 인 경우
		else if(startX < recommendX && recommendY < startY) {
			for(let i in sList) {
				 if((recommendX < sList[i]['s_X'] && sList[i]['s_X'] < recommendX+5 && recommendY < sList[i]['s_Y'] && sList[i]['s_Y'] < recommendY+5)||(recommendX-5 < sList[i]['s_X'] && sList[i]['s_X'] < recommendX+5 && recommendY-5 < sList[i]['s_Y'] && sList[i]['s_Y'] < recommendY-5)) {
					recommendStopName = sList[i]['s_NAME'];
					for(data of $('.stopRouteNum') )
						if(sList[i]['s_NO'] == $(data).val())  {
							console.log('중복 정류장은 너굴맨이 처리했으니 안심하라구!');
							dup_check = 1;
						}
					if( dup_check == 0 )	$('#mRecommendStop').append("<option value ='"+recommendStopName+"'>"+recommendStopName+"</option>");
					dup_check = 0;	
					check = 1;
					}
			}//for문 end
		}// if문 end
		//x축 -, y축 - 인 경우
		else if(recommendX < startX && recommendY < startY) {
			for(let i in sList) {
				if((recommendX-5< sList[i]['s_X'] && sList[i]['s_X'] < recommendX+5 && sList[i]['s_Y'] < recommendY && recommendY-5 < sList[i]['s_Y'])||(recommendX-5 < sList[i]['s_X'] && sList[i]['s_X'] < recommendX && sList[i]['s_Y'] < recommendY+5 && recommendY < sList[i]['s_Y'])) {
					recommendStopName = sList[i]['s_NAME'];
					for(data of $('.stopRouteNum') )
						if(sList[i]['s_NO'] == $(data).val())  {
							console.log('중복 정류장은 너굴맨이 처리했으니 안심하라구!');
							dup_check = 1;
						}
					if( dup_check == 0 )	$('#mRecommendStop').append("<option value ='"+recommendStopName+"'>"+recommendStopName+"</option>");
					dup_check = 0;
					check = 1;
				}
			}//for문 end 
		}// if문 end 
		//x축 -, y축 + 인 경우 
		else if(recommendX < startX && startY < recommendY) {
			for(let i in sList) {
				if((recommendX-5 < sList[i]['s_X'] && sList[i]['s_X'] < recommendX && recommendY-5 < sList[i]['s_Y'] && sList[i]['s_Y'] < recommendY)||(recommendX-5 < sList[i]['s_X'] && sList[i]['s_X'] < recommendX+5 && recommendY < sList[i]['s_Y'] && sList[i]['s_Y'] < recommendY+5)) {
					recommendStopName = sList[i]['s_NAME'];
					for(data of $('.stopRouteNum') )
						if(sList[i]['s_NO'] == $(data).val())  {
							console.log('중복 정류장은 너굴맨이 처리했으니 안심하라구!');
							dup_check = 1;
						}
					if( dup_check == 0 )	$('#mRecommendStop').append("<option value ='"+recommendStopName+"'>"+recommendStopName+"</option>");
					dup_check = 0;
					check = 1;
				}
			}//for문 end
		}//if문 end
		//x축 0, y축 + 인 경우
		else if(recommendX==startX && startY < recommendY) {
			for(let i in sList) {
				if(recommendX-5 < sList[i]['s_X'] && sList[i]['s_X'] < recommendX+5 && recommendY < sList[i]['s_Y'] && sList[i]['s_Y'] < recommendY) {
					recommendStopName = sList[i]['s_NAME'];
					for(data of $('.stopRouteNum') )
						if(sList[i]['s_NO'] == $(data).val())  {
							console.log('중복 정류장은 너굴맨이 처리했으니 안심하라구!');
							dup_check = 1;
						}
					if( dup_check == 0 )	$('#mRecommendStop').append("<option value ='"+recommendStopName+"'>"+recommendStopName+"</option>");
					dup_check = 0;
					check = 1;
				}
			}//for문 end
		}//if문 end
		//x축 0, y축 - 인 경우
		else if(recommendX==startX && recommendY < startY) {
			for(let i in sList) {
				if(recommendX-5 < sList[i]['s_X'] && sList[i]['s_X'] < recommendX+5 && recommendY-5 < sList[i]['s_Y'] && sList[i]['s_Y'] < recommendY) {
					recommendStopName = sList[i]['s_NAME'];
					for(data of $('.stopRouteNum') )
						if(sList[i]['s_NO'] == $(data).val())  {
							console.log('중복 정류장은 너굴맨이 처리했으니 안심하라구!');
							dup_check = 1;
						}
					if( dup_check == 0 )	$('#mRecommendStop').append("<option value ='"+recommendStopName+"'>"+recommendStopName+"</option>");
					dup_check = 0;
					check = 1;
				}
			}//for문 end 
		}//if문 end
		//x축 +, y축 0 인 경우
		else if(startX<recommendX && recommendY==startY) {
			for(let i in sList) {
				if(recommendX < sList[i]['s_X'] && sList[i]['s_X'] < recommendX+5 && recommendY-5 < sList[i]['s_Y'] && sList[i]['s_Y'] < recommendY+5) {
					recommendStopName = sList[i]['s_NAME'];
					for(data of $('.stopRouteNum') )
						if(sList[i]['s_NO'] == $(data).val())  {
							console.log('중복 정류장은 너굴맨이 처리했으니 안심하라구!');
							dup_check = 1;
						}
					if( dup_check == 0 )	$('#mRecommendStop').append("<option value ='"+recommendStopName+"'>"+recommendStopName+"</option>");
					dup_check = 0;
					check = 1;
				}
			}//for문 end
		}//if문 end
		//x축 -, y축 0 인 경우
		else if(startX<recommendX && recommendY==startY) {
			for(let i in sList) {
				if(recommend-5 < sList[i]['s_X'] && sList[i]['s_X'] < recommendX && recommendY-5 < sList[i]['s_Y'] && sList[i]['s_Y'] < recommendY+5) {
					recommendStopName = sList[i]['s_NAME'];
					for(data of $('.stopRouteNum') )
						if(sList[i]['s_NO'] == $(data).val())  {
							console.log('중복 정류장은 너굴맨이 처리했으니 안심하라구!');
							dup_check = 1;
						}
					if( dup_check == 0 )	$('#mRecommendStop').append("<option value ='"+recommendStopName+"'>"+recommendStopName+"</option>");
					dup_check = 0;
					check = 1;
				}
			}//for문 end
			
		}//if문 end
		startX = recommendX;
		startY = recommendY;
		j++;
	}); 

	var h = 2;
	var k = 2;
	$('#add').on('click', function() {
		$('#dispatch').append("<tr><td>차량번호 :</td><td><input type = 'text' class = 'motorNumber' name = 'motorNumber"+h+"'></td><td><select name = 'lowFloor"+h+"'><option value='일반'>일반</option><option value='저상'>저상</option></select></td></tr>");
		$("#motorCount").val(k);
		h++;
		k++;
	});
	$('#submitRoute').on('click', function(){
		h=2;
		k=1;
	});
</script>
</html>
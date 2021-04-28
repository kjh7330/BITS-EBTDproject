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
	body *{
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
		position: absolute;
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
			<form action="/driver/test" method="post">
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
							<td><input name="c_no" /></td>
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
								<button id='submit'>업체 등록 신청</button>
							</td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</div>

	<div class="bus_modal">
		<div class="bus_modal_content" title="클릭하면 창이 닫힙니다.">
			주한이형이 줄거임ㅋㅋ루삥빵뽕
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
	
	let idx = 0; 
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
		idx++;
		$(".dr_modal").fadeOut(); 
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
		tx += "<td> &nbsp;노선 " + table_idx + "</td><td><input style = 'width : 100px;' id = 'bus_no_" + table_idx + "'></td><td><button style = 'margin-top : 2px;' id = 'choice_" + table_idx + "' type = 'button'>노선 선택</button></td></tr>";
		tx += "<tr>";
		tx += "<td></td><td>차량번호</td>";
		tx += "<td>버스종류</td><td><button id = 'add_column_"+table_idx +"_" + column_idx+"' class = 'add_column' type = 'button'>+</button></td></tr><tr>";
		tx += "<td></td><td><input class = 'bus_no' style = 'width : 100px;' name = 'bus_no_"+table_idx +"_" + column_idx+"'></td>";
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
		}).click(function () {
			$(".bus_modal").fadeIn();
		});
		
		$('#add_column_'+table_idx +'_'+column_idx+'').click(function () {
			column_idx++;
			let text = "<tr><td></td><td><input style = 'width : 100px;' class = 'bus_no'></td>";
			text += "<td><select style = 'width : 85px;' class = 'sel_low' name = 'is_low_"+table_idx +"_" + column_idx+"'>";
			text += "<option value = 0 selected = true >일반버스</option><option value = 1>저상버스</option>";
			text += "</select></td><td><button type = 'button' class = 'del_column' id = 'del_column_"+table_idx +"_" + column_idx+"'>-</button></td></tr>";
			$(this).parent().parent().parent().append(text);
			$('#del_column_'+table_idx +'_'+ column_idx+'').click(function () {
				if($(this).parent().parent().parent().children().length > 3)
					$(this).parent().parent().remove();
				else   alert('버스번호는 최소 하나 이상 입력 하셔야 합니다.');
			});
		});
		$('#del_column_'+table_idx +'_'+column_idx+'').click(function () {
			if($(this).parent().parent().parent().children().length > 3)
				$(this).parent().parent().remove();
			else   alert('버스번호는 최소 하나 이상 입력 하셔야 합니다.');
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
						}
					}
				},error : function(err) {
					console.log(err,'!!!!!!!!!!!');
				}
			});
		}
	});   //중복확인 end
   
</script>
</html>


























<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입창 입니다.</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">
	input{
		border-radius : 8px;
	}
	button{
		border-radius : 8px;
	}
	#div_contents{
		width : 450px;
		margin-left : auto;
		margin-right : auto;
		padding : 0px;
	}
	#div_all{
		width : 100%;
	}
	html{
		background-color : #0C3D6A;
	}
	img{
		width : 90px;
	}
	#div_logo{
		width : 90px;
		margin-left : auto;
		margin-right : auto;
	}
	.title{
		color : white;
		width : 130px;
	}
	p{
		color : #b5b3b3;
		margin : 0px;
		font-size : 10px;
	} 
	.new_bus{
		border: 1px solid black;
		margin : 0px;
		padding : 0px;
	}
	.new_bus tr td{
		margin : 0px;
		padding : 0px;
	}
	td{
		margin : 0px;
		padding : 0px;
		color : white;
	}
	.bus_no{
		width : 120px;
	} 
	.sel_low{
		width : 100px;
	}
	#new_driver_table{
		border : 1px solid black;
	}
	.dr_modal{ 
		position : absolute; 
		width : 100%; 
		height : 100%; 
		background : rgba(70,70,70,0.8); 
		top : 0; 
		left : 0; 
		display : none; 
	}
	.dr_modal_content{
		position: absolute;
		top:50%;
		left:50%;
		transform: translate(-50%,-60%);
		width: 500px;
		height: 370px;
		background: white; 
		border : solid black 5px; 
		border-radius : 8px; 
	}
	.bus_modal{ 
		position : absolute; 
		width : 100%; 
		height : 100%; 
		background : rgba(70,70,70,0.8); 
		top : 0; 
		left : 0; 
		display : none; 
	}
	.bus_modal_content{
		position: absolute;
		top:50%;
		left:50%;
		transform: translate(-50%,-60%);
		width: 500px;
		height: 370px;
		background: white; 
		border : solid black 5px; 
		border-radius : 8px; 
	}

</style>
</head>
<body>
	<div id = 'div_all'>
		<div id = 'div_logo'> 
			<img alt="logo" src="resources/image/mainlogo.png">
		</div> 
		<div id = 'div_contents' > 
			<form action="joinAccess" method="post">
				<div id = ''>
					<table id = 'table_contents'> 
						<tr>
							<td/>
							<td>
							</td>
						</tr>
						<tr> 
							<td class = 'title'>업체명 : </td>
							<td>
								<input name = "c_username"  id = "c_username"/><div class="check_font" id="id_check">업체명을 입력해주세요</div>
							</td>
						</tr>
						<tr>
							<td class = 'title'>비밀번호 : </td>
							<td>
								<input id = 'pw' name = "c_password" type = 'password'/> <br>
							</td>
						</tr>
						<tr>
							<td class = 'title'>비밀번호 확인 : </td>
							<td>
								<input id = 'pw_check' type = 'password'/> <br> 
							</td>
						</tr>
						<tr>
							<td class = 'title'/>
							<td>
								<p id = 'pw_check_text'>비밀번호가 맞는지 확인 해주세요.</p> 
							</td>
						</tr>
						
						
						<tr>
							<td class = 'title'>사업자 등록번호 : </td>
							<td>
								<input name = "c_no"/> <br>
							</td>
						</tr>
						<tr>
							<td rowspan = 20 class = 'title'>
								노선 등록 : 
							</td>
						</tr> 
					</table>
					
					<table>
						<tr>
							<td class = 'title'/>
							<td id = 'btn_area' colspan = 2>
								<button id = 'add_new_bus'type = 'button'>노선도 추가</button><button type = "button" id = "del_new_bus">노선도 삭제</button>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td class = 'title'>기사 목록 : </td>
							<td>
								<table id = 'new_driver_table'>
									<tr>
										<td class = 'new_driver_td'>버스노선</td>
										<td class = 'new_driver_td'>기사이름</td>
										<td class = 'new_driver_td'>전화번호</td>
										<td class = 'new_driver_td'><button type = 'button' id = 'add_driver_column'>추가</button></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
					
					<table>
						<tr> 
							<td class = 'title'/>
							<td>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button id='#submit'>회원가입</button>  
							</td>
						</tr>
					</table>
				</div>
			</form>
		</div> 
	</div>
	
	<div class="bus_modal">
		<div class ="bus_modal_content" title="클릭하면 창이 닫힙니다."> 
			주한이형이 줄거임 ㅋㅋ루삥빵뽕
		</div>
	</div>
	<div class="dr_modal">
		<div class="dr_modal_content" title="클릭하면 창이 닫힙니다."> 
			혜지가 줄거임 ㅋㅋ루삥빵뽕
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
	});
	$(".bus_modal").click(function(){ 
		$(".bus_modal").fadeOut(); 
	});
	$(".dr_modal").click(function(){
		$(".dr_modal").fadeOut();
	});
	$('#del_new_bus').click(function () {
		$('#table_contents').children().children().children().last().remove();
		$('#table_contents').children().children().children().last().remove();
		table_idx--;
		if(table_idx < 2) $('#del_new_bus').css('display','none');
		console.log(table_idx); 
	});

	function make_new_bus_table(column_idx) {
		table_idx++; 
		column_idx++;
		let tx = "<table id = 'table_" + table_idx + "' class = 'new_bus'><tr>"; 
		tx += "<td colspan = 3>노선 " + table_idx + " : <input style = 'width : 100px;' readonly = true id = 'bus_no_" + table_idx + "'><button id = 'choice_" + table_idx + "' type = 'button'>노선 선택</button></td>";
		tx += "<tr>";
		tx += "<td>차량번호</td>";
		tx += "<td>버스종류</td><td><button id = '" + column_idx+"add_column"+table_idx +"' type = 'button'>+</button></td></tr><tr>";
		tx += "<td><input class = 'bus_no' name = '" + column_idx+"bus_no"+table_idx +"'></td>";
		tx += "<td><select class = 'sel_low' name = '" + column_idx+"is_low"+table_idx +"'>";
		tx += "<option value = 0 selected = true >일반버스</option><option value = 1>저상버스</option>"
		tx += "</select></td></tr>";
		tx += "</table><br>";
		$('#table_contents').children().children().last().append(tx);
		$('#choice_' + table_idx + '').click(function () {
			$(".bus_modal").fadeIn();
		});
		
		$('#'+column_idx+"add_column"+table_idx +'').click(function () {
			column_idx++;
			let text = "<tr><td><input class = 'bus_no'></td>";
			text += "<td><select class = 'sel_low' name = 'is_low1'>";
			text += "<option value = 0 selected = true >일반버스</option><option value = 1>저상버스</option>";
			text += "</select></td><td><button type = 'button' id = '"+column_idx+"del_column"+table_idx +"'>-</button></td></tr>";
			$(this).parent().parent().parent().append(text);
			$('#'+column_idx+"del_column"+table_idx +'').click(function () {
				if($(this).parent().parent().parent().children().length > 3)
					$(this).parent().parent().remove();
				else	alert('버스번호는 최소 하나 이상 입력 하셔야 합니다.');
			});
		});
		$('#'+column_idx+"del_column"+table_idx +'').click(function () {
			if($(this).parent().parent().parent().children().length > 3)
				$(this).parent().parent().remove();
			else	alert('버스번호는 최소 하나 이상 입력 하셔야 합니다.');
		});
		$('#bus_no').css('width','150px');
		$('.del_btn').css('text-align','right');
		if(table_idx >= 1)	$('#del_new_bus').css('display','inline');
		console.log(table_idx);
	}
	
	$('.title').css('text-align','right').css('vertical-align','top');
	$('#id_check').css('color','#b5b3b3').css('font-size', '10px');
	
	let pw_check = 0;
	
	
	$('#pw_check').blur(function () { 
		if($(this).val() != '')
			if($(this).val() == $('#pw').val()){
				$('#pw_check_text').html('비밀번호가 일치합니다.').css('color', '#21e460');
				pw_check = 1;
			}
			else											{
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
			else											{
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
			console.log(user_id);
			$.ajax({
				url : 'join/checkId?c_username='+user_id,
				type : 'get',
				success : function(data) {
					console.log("1 = 중복o / 0 = 중복x : "+ data);
					console.log('ajax접속');
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
				},error : function() {
					console.log("실패");
				}
			});
		}
	});	//중복확인 end
	
</script>
</html>



























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
	.table_new_bus{
		border : 1px solid black;
	}
	.bus_no{
		width : 120px;
	}
	.sel_low{
		width : 100px;
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
							<td id = 'td_add_bus'>
								
							</td>
						</tr>
					</table>
					
										
					
					
					
					
					
					<table>
						<tr>
							<td class = 'title'/>
							<td>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button id = 'add_new_bus'type = 'button'>노선도 추가</button>
							</td>
						</tr>
					</table>
					
					<table>
						<!-- 기사 목록 -->					
						<tr> 
							<td class = 'title'/>
							<td>
								<%--<button id='#submit'>회원가입</button> --%> 
							</td>
						</tr>
					</table>
				</div>
			</form>
		</div> 
	</div>
</body>

<script type="text/javascript">
	
	let table_idx = 1;
	
	make_new_bus_table('');
	
	$('#add_new_bus').click(function () {
		let tx = '<tr><td class = "title"></td><td>';
		
		
		
		make_new_bus_table(tx);
		$('.title').css('text-align','right');
	});
	function make_new_bus_table(tx) {
		tx += "<table id = 'table_" + table_idx + "'><tr><td>노선 " + table_idx + " : </td><td></td><td><button>삭제</button></td></tr><table>";
			/*<table id = 'new_bus_table'>
				<tr>
				<td class = 'title'>
					노선 1 : 
				</td>
				<td>
					<p>차고지 및 노선을 선택해주세요.</p>
					<p></p> 
				</td>
				<td>
					<button>노선도 선택</button>
				</td>
			</tr>
			<tr>
				<td></td>
				<td colspan = 3>
					<table class = 'table_new_bus'>
						<tr>
							<td>
								차량번호
							</td>
							<td>
								버스 종류
							</td>
						</tr>
						<tr>
							<td>
								<input class = 'bus_no'>
							</td>
							
							<td>
								<select class = 'sel_low' name = 'is_low1'>
									<option value = 0 selected = true >일반버스</option>
									<option value = 1>저상버스</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>
								<input class = 'bus_no'>
							</td>
							
							<td>
								<select class = 'sel_low' name = 'is_low2'>
									<option value = 0 selected = true >일반버스</option>
									<option value = 1>저상버스</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>
								<input class = 'bus_no'>
							</td>
							
							<td>
								<select class = 'sel_low' name = 'is_low3'>
									<option value = 0 selected = true >일반버스</option>
									<option value = 1>저상버스</option>
								</select>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>*/ 
		
		$('#td_add_bus').append(tx);
	}
	
	
	










	$('.title').css('text-align','right');
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



























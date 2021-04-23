<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입창 입니다.</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<form action="joinAccess" method="post">
	아이디 : <input name = "c_username"  id = "c_username" required/><div class="check_font" id="id_check"></div>
	비밀번호 : <input name = "c_password"/> <br>
	회사명 : <input name = "c_name"/> <br>
	사업자 등록번호 : <input name = "c_no"/> <br>
	<button></button>
</form>
<button id='#submit'>회원가입</button> 
</body>

<script type="text/javascript">
	let regexp =  /^[가-힣a-z0-9]{4,20}$/;
	let isCheck = false;	
	
	
	$('#c_username').blur(function() {
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
					$("#id_check").text("사용중인 아이디입니다");
					$("#id_check").css("color", "red");
					$("#submit").attr("disabled", true);
				}else {
					
					if(regexp.test(user_id)){
						// 0 : 아이디 길이 / 문자열 검사
						$("#id_check").text("");
						$("#submit").attr("disabled", false);
			
					} else if(user_id == ""){
						
						$('#id_check').text('아이디를 입력해주세요');
						$('#id_check').css('color', 'red');
						$("#submit").attr("disabled", true);				
						
					} else {
						$('#id_check').text("아이디는 한글, 소문자, 숫자로 4~20자리가 가능합니다");
						$('#id_check').css('color', 'red');
						$("#reg_submit").attr("disabled", true);
					}
				
				}
			},error : function() {
				console.log("실패");
			}
		});
	});
</script>
</html>



























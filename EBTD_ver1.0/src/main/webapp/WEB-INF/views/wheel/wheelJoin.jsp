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
<form action="/user/wheel/joinAccess" method="post" id="joinFrm">
	<input type="hidden" value="0" name = "u_type">

	아이디 : <input name = "u_username"  id = "u_username" required minlength="3"/><div class="check_font" id="id_check"></div>
	비밀번호 : <input name = "u_password" id = "u_password" minlength="4"/> <br>
	비밀번호 확인 : <input name = "u_password" id = "u_password2"/> <br>
	이름 : <input name = "u_name"/> <br>
	장애 등록 번호 : <input id='u_disable_no' name = "u_disable_no" minlength="6" maxlength="6" required="required"/><br><div class="check_font" id="no_check"></div>
	핸드폰 번호 : <input id = "u_userphonenum" name="u_userphonenum" placeholder="특수문자(-) 없이 입력해주세요" required minlength="11" maxlength="11"> <br>
	주소 : <select id="AddressArr"></select> <br>
	상세 주소 : <input id = "AddressArr2"> <br/>
	<div class="check_font" id="addr_check"></div>
	<input type="hidden" id='u_address' name = "u_address" >
	</form>
<!-- 	<div id='guardDiv' hidden="display:none">
		보호자 이름 : <input name = 'u_guardname'><br>
		보호자 핸드폰 번호 : <input name = 'u_guardphonenum'><br>
		보호자 관계 : <input name = 'u_guardrelation'><br>
	</div>
 -->	<button id='submitCheckBtn' disabled="disabled">회원가입</button>
</body>

<script type="text/javascript">
$('#joinFrm Input').val()

$('#AddressArr2,#AddressArr').blur(function() {
	console.log('ㅎㅇ');
	var addr = "인천시 "+$('#AddressArr').val() + " " +$('#AddressArr2').val();
	$('#u_address').val(addr);
	$('#addr_check').text(addr);
	$('#addr_check').css('color', 'blue');
	});

$(document).ready(function(){ 
    $("#u_userphonenum").blur(function(){
    	var num = $("#u_userphonenum").val();
    	blur(num)
    });
    $("#u_userphonenum").click(function(){
    	var num = $("#u_userphonenum").val();
    	focus(num);
    });
});

function focus(num) {
	num = num.replace(/[^0-9]/g, '');
	$("#u_userphonenum").val(num);
}

function blur(num) {
	num = num.replace(/[^0-9]/g, '');
	var tmp = '';
	tmp += num.substr(0, 3);
	tmp += '-';
	tmp += num.substr(3, 4);
	tmp += '-';
	tmp += num.substr(7,4);
	$("#u_userphonenum").val(tmp);
}

$('#submitCheckBtn').click(function () { 
	if($('#u_password').val != $('#u_password2').val){return 0;}
	chkValue();
		
	
});

function chkValue() {
	// 공통입력폼내의 모든 입력오브젝트 
	console.log('chkValue')
	var inputObjs = $("#joinFrm input");
	// 미입력여부(경우에 따라 사용)
	var bEmpty = true;
	var focus;

	// 각 오브젝트에 대해 입력체크
	inputObjs.each(function(index) {
		if ($(this).val() == '') {
			focus = $(this);
			bEmpty = false;

 			$(this).css('border','3px solid #ff0000');
			focus.focus();

			// 여기서는 each문을 탈출
			return false;
		}else{
			$(this).css('border','1px solid #ffffff');
		}
	});
	// 필수입력사항에 누락이 있으면 진행금지
	if (!bEmpty) return;
	$("#joinFrm").submit();
}

	var checkAll = false;

	let regexp =  /^[가-힣a-z0-9]{3,20}$/;
	let regexpno =  /^[0-9]{5,6}$/;
	let isCheck = false;
	var $townList = ${townList};
	console.log($townList);	
	for (i in $townList){
		$('#AddressArr').append("<option value="+$townList[i]+">"+$townList[i]+"</option>");
		console.log($townList[i]);
	}
	$('#u_username').blur(function() {
		var idVal =$('#u_username').val();
		var user_id = $('#u_username').val();
		console.log(user_id);
		$.ajax({
			url : '/wheel/join/checkId?u_username='+user_id,
			type : 'get',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);
				console.log('ajax접속');
				if(data == 1){
					$("#id_check").text("사용중인 아이디입니다");
					$("#id_check").css("color", "red");
					$("#submitCheckBtn").attr("disabled", true);
				}else {
					
					if(regexp.test(user_id)){
						// 0 : 아이디 길이 / 문자열 검사
						$("#id_check").text("");
						$("#submitCheckBtn").attr("disabled", false);
			
					} else if(user_id == ""){
						
						$('#id_check').text('아이디를 입력해주세요');
						$('#id_check').css('color', 'red');
						$("#submitCheckBtn").attr("disabled", true);				
						
					} else {
						$('#id_check').text("아이디는 한글, 소문자, 숫자로 3~20자리가 가능합니다");
						$('#id_check').css('color', 'red');
						$("#submitCheckBtn").attr("disabled", true);
					}
				
				}
			},error : function() {
				console.log("실패");
			}
		});
	});
	
	$('#u_disable_no').blur(function(){
		var noVal =$('#u_disable_no').val();
		var user_no = $('#u_disable_no').val();
		console.log(user_no);
		if(!regexpno.test(user_no)){
			// 0 : 아이디 길이 / 문자열 검사
			$("#no_check").text("");
			$("#submitCheckBtn").attr("disabled", true);
			return 0;
		}
		$.ajax({
			url : '/wheel/join/checkNo?u_disableno='+user_no,
			type : 'get',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);
				console.log('ajax접속');
				if(data == 1){
					$("#no_check").text("이미 등록된 번호입니다");
					$("#no_check").css("color", "red");
					$("#submitCheckBtn").attr("disabled", true);
				}else {
					 if(user_no == ""){
						$('#no_check').text('필수 입력사항입니다.');
						$('#no_check').css('color', 'red');
						$("#submitCheckBtn").attr("disabled", true);				
						
					}else{$("#submitCheckBtn").attr("disabled", false);}
				
				}
			},error : function() {
				console.log("실패");
			}
		});
	});
</script>
</html>



























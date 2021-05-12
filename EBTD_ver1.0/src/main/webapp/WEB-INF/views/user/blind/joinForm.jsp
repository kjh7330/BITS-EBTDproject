<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EBTD - 회원가입</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/v4-shims.css">
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css'/>
	<script src='https://code.jquery.com/jquery.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js'></script>
    <style>
        body{
            margin: 0;
            padding: 0;
            border: 0;
            color: white;
            width: 450px; /*만들땐 450px에 두고 만들고 실제로 핸드폰 구현시는 100vw*/
        }
        .container {
            display: flex;
            justify-content: center;
            background-color : #0C3D6A;
            width: 450px;
            height: 80px;
            text-align: center;
        }
        .headertitle{
            padding-top: 10px;
            padding-right: 15px;
            font-size: 50px;
        }
        .headertitle img{
            height: 57px;
        } 
        .headerbell{
            color: yellow;
            padding-top: 25px;
            padding-right: 30px;
            font-size: 40px;
        }
        .footer-container img{
            height: 60px;
        }
        .main{
            background-color : #f6f4f4;
        }
        .mainview{
            display: flex;
            align-items: center; /*세로 가운데 정렬*/
            justify-content: center; /*가로 가운데 정렬*/
          	text-align: center; 
            height: 75vh;
            /*해당 웹페이지를 실행하고 있는 기기의 화면크기 비율 vw(viewport width), vh(viewport height)*/
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
            padding-top: 10px;
            padding-bottom: 20px;
            font-size: 10px;
        }
        .tabletitle{
            color: black;
            font-size: 25px;
        }
        .input{
            width: 180px;
            height: 32px;
            border-radius: 4px;
            border: none;
            margin-left: 5px;
            margin-right: 5px;
            font-size: 20px;
        }
        .loginbtn{
            font-size: 20px;
            padding-top: 15px;
            padding-bottom: 18px;
            padding-left: 18px;
            padding-right: 15px;
            background-color: #f6e056;
            color: #0C3D6A;
            border-radius: 8px;
            border: none;
        }
        .otherbtn{
            width: 190px;
            font-size: 20px;
            padding-top: 10px;
            padding-bottom: 10px;
            margin-top: 10px;
            background-color: #f6e056;
            color: #0C3D6A;
            border-radius: 8px;
            border: none;
            
        }
        table{
            display: flex;
            justify-content: center;
        }
        .titlename{
            font: bold;
            font-size: 40px;
            color: black;
        }
    </style>
</head>
<body>
    <header>
        <div class="container">
            <div class="headertitle">&nbsp;<img src="/resources/image/mainlogo.png" alt="EBTD메인로고"/></div>
        </div>
    </header>
    <section class="main">
        <div class="mainview">
            <form action="/user/wheel/joinAccess" method="post" id="joinFrm">
            <input type="hidden" value="1" name = "u_type">
                <table class="formtable">
                    <!-- <tr>
                        <td class="titlename" colspan="4">회원가입</td>
                    </tr> -->
                    <tr>
                        <td class="tabletitle">I D :</td>
                        <td colspan="2"><input class="input" name = "u_username"  id = "u_username" required minlength="3"/><div style="font-size: 8px " class="check_font" id="id_check"></div></td>
                        <!-- <td rowspan="2"><input id="logbtn" class="loginbtn" type="button" value="LOGIN"></td>-->
                    </tr>
                    <tr>
                        <td class="tabletitle">비밀번호 :</td>
                        <td colspan="2"><input type="password" class="input" name = "u_password" id = "u_password" minlength="4"/></td>
                    </tr>
                    <tr>
                        <td class="tabletitle">비밀번호 확인 :</td>
                        <td colspan="2"><input type="password" class="input" id = "u_password2"/></td>
                    </tr>
                    <tr>
                        <td class="tabletitle">이름 :</td>
                        <td colspan="2"><input class="input" name = "u_name"/></td>
                    </tr>
                    <tr>
                        <td class="tabletitle" style="font-size: 15px;">장애 등록 번호 :</td>
                        <td colspan="2"><input class="input" id='u_disable_no' name = "u_disable_no" minlength="6" maxlength="6" required="required"/><div class="check_font" id="no_check"></div></td>
                    </tr>
                    <tr>
                        <td class="tabletitle" style="font-size: 20px;">핸드폰 번호 :</td>
                        <td colspan="2"><input class="input" id = "u_userphonenum" name="u_userphonenum" placeholder="특수문자(-) 없이 입력해주세요" required minlength="11" maxlength="11"></td>
                    </tr>
                    <tr>
                    </tr>
                    <tr>
                        <td class="tabletitle">주소 :</td>
                        <td colspan="2"><select class="input" id="AddressArr">
                        	<option value = "청학1동">청학1동</option>
                        	<option value = "청학2동">청학2동</option>
                        	<option value = "청학3동">청학3동</option>
                        	<option value = "송도1동">송도1동</option>
                        	<option value = "송도2동">송도2동</option>
                        	<option value = "송도3동">송도3동</option>
                        	<option value = "연수1동">연수1동</option>
                        	<option value = "연수2동">연수2동</option>
                        	<option value = "연수3동">연수3동</option>
                        </select></td>
                        <input type="hidden" id='u_address' name = "u_address">
                    </tr>
                    <tr>
                        <td class= "tabletitle">상세주소 :</td>
                        <td colspan="2"><input class="input" id = "AddressArr2"></td>
                    </tr>
                    <tr>
                        <td style="font-size: 15px;" class= "tabletitle">보호자와 관계 :</td>
                        <td colspan="2">
                        <select class="input" id="relation">
                        	<option value="부">부</option>
                        	<option value="모">모</option>
                        	<option value="자">자</option>
                        	<option value="녀">녀</option>
                        	<option value="조부">조부</option>
                        	<option value="조모">조모</option>
                        	<option value="친인척">친인척</option>
                        	<option value="지인">지인</option>
                        	<option value="기타">기타</option>
                        </select>
                        <input type ="hidden" class="input" name = "u_guardrelation" id = "u_guardrelation">
                        
                        </td>
                    </tr>
                    <tr>
                        <td class= "tabletitle">보호자명 :</td>
                        <td colspan="2"><input class="input" name = "u_guardname"></td>
                    </tr>
                    <tr>
                        <td style="font-size: 15px;" class= "tabletitle">보호자 핸드폰 :</td>
                        <td colspan="2"><input class="input" id='u_guardphonenum' name = "u_guardphonenum" minlength="11" maxlength="11"></td>
                    </tr>
                    
                    


                    <tr>
                    <td> <div  id="addr_check"></div> </td>
                        <td colspan="4"><button id="logbtn" class="loginbtn" >JOIN</button> </td>
                    </tr>
                    
                </table>
                </form>
                <br>
        </div>
    </section>
    <footer>
        <div class="footer-container">
            <div>
                <img src="/resources/image/teamlogo.png" alt="BITS로고"/>
            </div>
            <div>
                김혜지, 김아름, 김민주, 김주한, 신재구, 황원혁, 이민성
            </div>
        </div>
    </footer>
    
    
</body>

<script>
let guardianFlag = false;
var tx =""
//비밀번호 check

$('#u_password2').blur(function() {
	if($('#u_password').val() != $('#u_password2').val()) {
		if($('#u_password').val()!='') {
				alert("비밀번호가 일치하지 않습니다.");
				$('#u_password2').val('')
				$('#u_password2').focus();
			};		
		};
		
	});

//보호자 input 생성용 but안씀
$('#guardAdd').click(function () {
	make_new_bus_table(guardianFlag);
});
//보호자 input 생성용 but안씀
function make_new_bus_table(guardianFlag) {
	console.log(guardianFlag);
	if(guardianFlag===false){
		tx += "보호자 이름 : <input name = 'u_guardname'><br>"; 
		tx += "보호자 핸드폰 번호 : <input name = 'u_guardphonenum'><br>";
		tx += "보호자 관계 : <input name = 'u_guardrelation'><br>";
		guardianFlag = true;
	}else{tx = '';
	guardianFlag = false;
	}
	$('#guardDiv').append(tx);
}

//보호자 관계 select option 을 input창에 넣어 form에서 전송 가능하게 함
var relation;
$('#relation').blur(function() {
	relation = $("#relation option:selected").val();
	console.log(relation);
	$("#u_guardrelation").val(relation); 
}); 

//시 + 동 +상세주소 출력 및 input창에 넣어 form에서 전송 가능하게 함
$('#AddressArr2,#AddressArr').blur(function() {
	var addr = "인천시 "+$('#AddressArr').val() + " " +$('#AddressArr2').val();
	$('#u_address').val(addr);
	$('#addr_check').text(addr);
	$('#addr_check').css('color', 'blue');
	});


$(document).ready(function(){ 
	//유저 핸드폰번호 '-'추가
	/*여기서부터*/
    $("#u_userphonenum").blur(function(){
    	var num = $("#u_userphonenum").val();
    	blur(num)
    });
    $("#u_userphonenum").click(function(){
    	var num = $("#u_userphonenum").val();
    	focus(num);
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
    /*여기까지*/
    
    $("#u_guardphonenum").blur(function(){
    	var num2 = $("#u_guardphonenum").val();
    	blur2(num2)
    });
    $("#u_guardphonenum").click(function(){
    	var num2 = $("#u_guardphonenum").val();
    	focus2(num2);
    });
    function focus2(num2) {
    	num2 = num2.replace(/[^0-9]/g, '');
    	$("#u_guardphonenum").val(num2);
    }

    function blur2(num2) {
    	num = num2.replace(/[^0-9]/g, '');
    	var tmp2 = '';
    	tmp2 += num.substr(0, 3);
    	tmp2 += '-';
    	tmp2 += num.substr(3, 4);
    	tmp2 += '-';
    	tmp2 += num.substr(7,4);
    	$("#u_guardphonenum").val(tmp2);
    }
});



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
	
	//주소 select 에 option값 추가
	for (var i in $townList){
		$('#AddressArr').append("<option value="+$townList[i]+">"+$townList[i]+"</option>");
		console.log($townList[i]);
	}
	
	//아이디 중복체크
	$('#u_username').blur(function() {
		//아이디 값 변수에 넣음
		var idVal =$('#u_username').val();
		var user_id = $('#u_username').val();
		console.log(user_id);
		$.ajax({
			url : '/wheel/join/checkId?u_username='+user_id,
			type : 'get',
			//DATA 1일시 중복, 0일시 중복 아님
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
	
	
	//장애등록번호 중복 체크
	$('#u_disable_no').blur(function(){
		//각각 변수에 넣어줌(두개 똑같아여~)
		var noVal =$('#u_disable_no').val();
		var user_no = $('#u_disable_no').val();
		console.log(user_no);
		//정규식에 넣었을 시 맞는지 확인후
		if(!regexpno.test(user_no)){
			// 0 : 아이디 길이 / 문자열 검사
			$("#no_check").text("");
			$("#submitCheckBtn").attr("disabled", true);
			return 0;
		}
		//DATA 1일시 중복, 0일시 중복 아님
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
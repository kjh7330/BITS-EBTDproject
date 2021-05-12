<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EBTD - 즐겨찾기 추가</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!--font-awesome CDN-->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
	rel="stylesheet">
</head>

<style>
.maindiv{
		color: black;
		text-align: center;
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
        padding-bottom: 20px;
        display: flex;
        justify-content: space-around;
    }
    .footer-container img{
        height: 60px;
    }
    .footerbtn{
    	background-color: #0C3D6A;
    	border:none;
    	cursor: pointer;
    }
    .mainbtn{
    	width: 350px;
    	height: 150px;
    	font-size: 50px;
    	margin-top: 95px;
    	background-color: #0C3D6A;
    	color: #f9eb99;
    	border-radius: 15px;
    	cursor: pointer;
    }

</style>
<body>
	<div id="userheader"><%@ include
			file="/WEB-INF/views/include/userBlindHeader.jsp"%></div>
	
	<div style="color: black">
		<br> 
	<form action="addBookMark" method="post">	
		동 이름 : <select id="t_nameSelect">
				<option class="selectType" selected="selected">동 이름을 선택해주세요</option>
			  </select><br><br>
				
		노선번호 : <select id="b_noSelect" id="b_no" name="b_no">
				
				</select><br><br>
		

		출발 정류장 : <select class="check" id="startStopSelect"  name="s_nostart">
				</select><br><br>
				   
		<input type="text" id="s_nostart" style="display: none;">
				
		
		도착 정류장 : <select class="check" id="lastStopSelect"  name="s_nolast">
				</select><br>
		<input type="text" id="s_nolast" style="display: none;">
				
		<div id=checkBookMark style="visibility: hidden; width: 300px; height: 30px"> </div>
		
		즐겨찾기에 대한 별칭을 입력하세요(필수입력사항!)<br><br>
		<input type="text" id = "ub_alias" name="ub_alias" style="width: 70%" ><br><br>
		
		<button id="submitBtn">즐겨찾기 등록하기</button>
	</form>
	</div>






	
	<footer>
	     <div class="footer-container">
	         	<button id="btn1" class="footerbtn" onmousedown="mouseDown1()" onmouseup="mouseUp1()"><i style="font-size:95px;color:#f9eb99;" class="fas fa-arrow-left"></i></button>
	         	<button id="btn2" class="footerbtn" onmousedown="mouseDown2()" onmouseup="mouseUp2()"><i style="font-size:95px;color:#f9eb99;" class="fas fa-arrow-down"></i></button>
	         	<button id="btn3" class="footerbtn" onmousedown="mouseDown3()" onmouseup="mouseUp3()"><i style="font-size:95px;color:#f9eb99;" class="fas fa-arrow-right"></i></button>
	     </div>
	</footer>
</body>

	
<script>
console.log(${sList});
let i = 0;
let str='';
	for(i=0; i<${sList}.length; i++){
	str+='<option class = "t_name" id = "t_name">'+${sList}[i]['t_NAME']+'</option>';
	}
	$("#t_nameSelect").append(str);

	
	$('#t_nameSelect').change(function(){
		$('#b_noSelect').empty();
		$('#startStopSelect').empty();
		$('#lastStopSelect').empty();
		
		var t_name = $('#t_nameSelect').val();
		console.log(t_name);
		
		if( t_name == "동 이름을 선택해주세요" ){
			alert("동 이름을 선택해주세요");
			$("#b_noSelect").empty();
			$("#startStopSelect").empty();
			$("#lastStopSelect").empty();
			
		
		}else{
			console.log("첫번째 통신");
			$.ajax({
				url: '/user/getRouteBusList?t_name='+t_name, //필수입력값
				type: 'get',
				dataType : 'json',
				
				success: function(data){ 
					console.log("ajax통신 성공");
					console.log(data[0]);
					
					str = "";
					str2 = '';
					$("#b_noSelect").empty();
					str = '<option selected>노선번호를 선택해주세요</option>'
					str2 = '<option selected>정류장을 선택해주세요</option>'
					for (let i = 0; i < data.length; i++){
						str += '<option value='+data[i]+'>'+data[i]+'</option>'
					} //for end
					
					
					$("#b_noSelect").append(str);
					$("#startStopSelect").append(str2);
					$("#lastStopSelect").append(str2);
					
				},
				fail: function(err){
					console.log("ajax통신 fail");
					console.log(err);
				}
				
			});	//ajax end 

		}
	}); 
	
	$('#b_noSelect').change(function(){
		
		
		
		var b_no = $('#b_noSelect').val();
		console.log(t_name);
		console.log("두번째 통신");
		
		
			$.ajax({
				
				url: '/user/getRouteStopList?b_no='+b_no, //필수입력값
				type: 'get',
				dataType : 'json',
				
				success: function(data){ 
				console.log("ajax통신 성공");
				
				console.log(data)
					str = "";
					$("#startStopSelect").empty();
					$("#lastStopSelect").empty();
					str = '<option selected>정류장을 선택해주세요</option>'
					for (let i = 0; i < data.length; i++){
						str += '<option value='+data[i].s_NO+'>'+data[i].s_NAME+'</option>'
					} //for end
					
					$("#startStopSelect").append(str);
					$("#lastStopSelect").append(str);
					
				},
				fail: function(err){
					console.log("ajax통신 fail");
					console.log(err);
				}
			});	
			
		}); 
	

	$('#ub_alias').on('focus',function(){
		console.log($("#startStopSelect option:selected").val());	
		console.log($("#lastStopSelect option:selected").val());	
		
			$.ajax({
				type : 'get',
				url : 'checkBookMark',
				data : { 
							's_nostart' : $("#startStopSelect option:selected").val(),
							's_nolast' : $("#lastStopSelect option:selected").val()
						},
				dataType : 'html', 
				success : function(data) {
					console.log(data);
					if(data=="사용 가능 합니다."){
					$('#checkBookMark').css('visibility','visible');
					$('#checkBookMark').html(data).css('color','blue');
					}else{
					$('#checkBookMark').css('visibility','visible');
					$('#checkBookMark').html(data).css('color','red');	
					}},
				error : function(err) {
					$('#checkBookMark').html(err.responseText).css('color','red');
					console.log("err.status : ", err.status);
					}
				}); //ajax End
	}); //on End 

//유효성 검사
$('#submitBtn').click(function(){
	
	if($('#t_nameSelect option:selected').val() == '동 이름을 선택해주세요'){
		alert('동 이름을 선택해주세요');
		return false;
			
	}else if($('#b_noSelect option:selected').val() == '노선번호를 선택해주세요'){
		alert('노선번호를 선택해주세요');
		return false;	
		
	}else if($('#startStopSelect option:selected').val() == '정류장을 선택해주세요' || $('#lastStopSelect option:selected').val() == '정류장을 선택해주세요'){
		alert('정류장을 선택해주세요.');
		return false;
			
	}else if($('#ub_alias').val()==''){
		alert('별칭을 지정해주세요.');
		return false;
	}else if($('#checkBookMark').html() == '' || $('#checkBookMark').html()=='이미 즐겨찾기 리스트에 있습니다.'){
		alert('이미 즐겨찾기에 등록이 되어 있거나 정류장을 지정하시지 않았습니다.');
		return false;
	}else{
		alert('즐겨찾기 등록 완료');
		}
	});
	
		$('#btn1').click(function(){
			if(    $('#mbtn2').css('color') == 'rgb(249, 235, 153)' 
				&& $('#mbtn1').css('color') == 'rgb(249, 235, 153)' ){
				   $('#mbtn2').css("background-color","#f9eb99").css("color","#0C3D6A");
			}else if ( $('#mbtn2').css('color') == 'rgb(12, 61, 106)' 
					&& $('#mbtn1').css('color') == 'rgb(249, 235, 153)' ){
			  	   	   $('#mbtn2').css("background-color","#0C3D6A").css("color","#f9eb99");
				       $('#mbtn1').css("background-color","#f9eb99").css("color","#0C3D6A");
			}else if ( $('#mbtn2').css('color') == 'rgb(249, 235, 153)'
					&& $('#mbtn1').css('color') == 'rgb(12, 61, 106)' ){
			           $('#mbtn2').css("background-color","#f9eb99").css("color","#0C3D6A");
		  	   	   	   $('#mbtn1').css("background-color","#0C3D6A").css("color","#f9eb99");
			}
		});
		
		$('#btn2').click(function(){
			if( $('#mbtn1').css('color') == 'rgb(12, 61, 106)' ){
				//location.href = '/user/???';
				console.log("아직 페이지 이동할 곳이 없음!");
			}else if( $('#mbtn2').css('color') == 'rgb(12, 61, 106)' ){
				location.href = '/user/myPage';
			}
		});
		$('#btn3').click(function(){
			if(    $('#mbtn1').css('color') == 'rgb(249, 235, 153)' 
				&& $('#mbtn2').css('color') == 'rgb(249, 235, 153)' ){
				   $('#mbtn1').css("background-color","#f9eb99").css("color","#0C3D6A");
			}else if ( $('#mbtn1').css('color') == 'rgb(12, 61, 106)' 
					&& $('#mbtn2').css('color') == 'rgb(249, 235, 153)' ){
			  	   	   $('#mbtn1').css("background-color","#0C3D6A").css("color","#f9eb99");
				       $('#mbtn2').css("background-color","#f9eb99").css("color","#0C3D6A");
			}else if ( $('#mbtn1').css('color') == 'rgb(249, 235, 153)'
					&& $('#mbtn2').css('color') == 'rgb(12, 61, 106)' ){
			           $('#mbtn1').css("background-color","#f9eb99").css("color","#0C3D6A");
		  	   	   	   $('#mbtn2').css("background-color","#0C3D6A").css("color","#f9eb99");
			}
		});
		//버튼 두번 클릭 혹은 롱 클릭
		let timer;
		let istrue = false;
		function mouseDown1(){
			timer1 = setTimeout(function(){holding1();},2000);
		}
		function mouseUp1(){
			clearTimeout(timer1);
		}
		function holding1(){
			alert('이전페이지가 없음!!');
			//location.href = '/user/???';
		}
		function mouseDown2(){
			timer2 = setTimeout(function(){holding2();},2000);
		}
		function mouseUp2(){
			clearTimeout(timer2);
		}
		/* function holding2(){
			alert('holding');
		} */
		function mouseDown3(){
			timer3 = setTimeout(function(){holding3();},2000);
		}
		function mouseUp3(){
			clearTimeout(timer3);
		}
		/* function holding3(){
			location.href = '/user/loginForm';
		} */

		</script>

</html>
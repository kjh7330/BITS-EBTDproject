<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자 - 정류장 관리 페이지</title>
<style type="text/css">
	.checkBox {
		width: 180px;
		display: hidden;
	}
	#main-container{
		text-align: center;
		            width: 800px;
            color: black;
            left: 50%;
            padding-top:170px;
            margin-left: auto;
            margin-right: auto;
            padding-bottom: 140px;
	}
	.maindivinput{
		border: none;
        border-radius: 8px;
        text-align: center;
        width: 800px;
        background-color: pink;
        height: 50px;
        font-weight: bold;
        font-size: 20px;
	}
	#inputtable{
		width: 600px;
		margin-left: auto;
		margin-right: auto;
	}
	td{
		height: 40px;
	}
	#inputtable input{
		border: none;
		text-align: center;
	}
	.arrow{
		border: 1px solid black;
		width: 90px;
		height: 35px;
	}
	.arrow:hover {
		border: 1px solid #aaa;
	}
	#submit{
		margin-top: 20px;
		width: 200px;
		height: 45px;
		font-size: 20px;
		border-radius: 10px;
		background-color: lightgray;
	}
	#submit:hover{
		background-color: #ff8197;
	}
	#checktd, #checktd2{
		border: none;
	}
	
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<div id="adminheader"><%@ include
			file="/WEB-INF/views/include/adminheader.jsp"%></div>
	<div id="main-container">
	<div><input type="text" class="maindivinput" value="정류장 등록" readonly><br></div>
	<br>
	<form id="addStop" action="/admin/stop/addStop">
		<table id="inputtable" border="1" style="color: black">
			
			<tr>
				<td style="width: 200px" class="inputtitle">동 이름</td>
				<td>
				<select id="t_Name" class="arrow" name="T_NAME">
						<option>동 선택</option>
					<c:forEach var="stop" items="${sList}">
						<option>${stop.t_NAME}</option>
					</c:forEach>
				</select>
				</td>
			</tr>
			
			<tr>
				<td class="inputtitle">정류장 번호</td>
				<td><div><input type="text" id="checkNo" readonly="readonly"name="S_NO"></div></td>
			</tr>

			<tr>
				<td class="inputtitle">정류장 이름</td>
				<td><input type="text" id="s_Name" placeholder="입력하세요~!" name="S_NAME">
				<span class="checkBox" id="checkName" style="display: inline-block; width: 350px;"></span></td>
			</tr>

			<tr>
				<td class="inputtitle">x값</td>
				<td><input type="text" class="check" id="s_X" name="S_X" maxlength="3"></td>
			</tr>

			<tr>
				<td class="inputtitle">y값</td>
				<td><input type="text" class="check" id="s_Y" name="S_Y" maxlength="3">
				<span class="checkBox" id="checkPosition" style="display: inline-block; width: 350px;"></span></td>
			</tr>

			<tr>
				<td class="inputtitle">상세정보</td>
				<td><input type="text" id="s_Detail" name="S_DETAIL"></td>
			</tr>
		</table>
		<button id="submit">등록하기</button></td>
	</form>
	</div>
	<div id="adminfooter"><%@ include
			file="/WEB-INF/views/include/adminfooter.jsp"%></div>
</body>
<script type="text/javascript">
//유효성 검사
	$('#addStop').submit(function () {
		if($('#checkNo').val() == ''){
			alert('동을 선택하세요.');
			$('#s_No').focus();
			return false;	
			
		}else if($('#checkName').text() == '사용 불가능 합니다.'){
			alert('정류장 이름을 입력하세요.');
			$('#s_Name').focus();
			return false;
			
		}else if($('#s_X').val() == ''){
			alert('사용 불가능 합니다.');
			$('#s_X').focus();
			return false;
			
		}else if($('#s_X').val() == ''){
			alert('X좌표를 입력하세요.');
			$('#s_X').focus();
			return false;
			
		}else if($('#s_Y').val() == ''){
			alert('Y좌표를 입력하세요.');
			$('#s_Y').focus();
			return false;
			
		}else if($('#checkPosition').text() == '해당 위치에 정류장이 있습니다.'){
			alert('정류장 번호를 수정해주세요.');
			$('#s_X').focus();
			return false;
			
		}else if($('#checkPosition').text() == '좌표를 벗어났습니다.'){
			alert('죄표를 벗어났습니다.');
			$('#s_X').focus();
			return false;
			
		}else{
			alert('정류장 등록 완료');
		}
	});

$('#s_Name').on('focusout',function(){
	if($('#s_Name').val()!=''){
		$.ajax({
			type : 'get',
			url : 'checkName',
			data : { 
					's_Name' : $('#s_Name').val()
					},
			dataType : 'html', 
			success : function(data) {
				if(data=="사용 가능 합니다."){
				$('#checkName').css('visibility','visible');
				$('#checkName').html(data).css('color','blue');
				}else{
				$('#checkName').css('visibility','visible');
				$('#checkName').html(data).css('color','red');	
				}
			},
			error : function(err) {
				$('#checkName').html(err.responseText).css('color','red');
				console.log("err.status : ", err.status);
			}
		}); //ajax End
	}
}); //on End 

$('.check').on('focusout',function(){
	
	if($('#s_X').val()!='' &&$('#s_Y').val()!=''){
		$.ajax({
			type : 'get',
			url : 'checkPosition',
			data : { 
						's_X' : $('#s_X').val(),
						's_Y' : $('#s_Y').val()
					},
			dataType : 'html', 
			success : function(data) {
				if(data=="사용 가능 합니다."){
				$('#checkPosition').css('visibility','visible');
				$('#checkPosition').html(data).css('color','blue');
				}else{
				$('#checkPosition').css('visibility','visible');
				$('#checkPosition').html(data).css('color','red');	
				}},
			error : function(err) {
				$('#checkPosition').html(err.responseText).css('color','red');
				console.log("err.status : ", err.status);
			}
		}); //ajax End
	}
}); //on End 

//정류장 동네 선택시 정류장 번호 자동생성

	$('#t_Name').on('change', function() {
		if($(this).val() != '동 선택')
		$.ajax({
			type : 'get',
			url : 'checkStopNo',
			data : {
				't_Name' : $('#t_Name').val()
			},
			dataType : 'json',
			success : function(data) {
				console.log(data)
				$('#checkNo').val(data);
			},
			error : function(err) {
				$('#checkNo').html(err.responseText).css('color', 'black');
				console.log("err.status : ", err.status);
			}
		}); //ajax End
		
		else	$('#checkNo').val('');
	}); //on End
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>정류장 등록 페이지</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style type="text/css">
    .checkBox{
    	width : 180px;
    	display: hidden;
    }
    </style>
</head>
<body>
<div id="adminheader"><%@ include file="/WEB-INF/views/include/adminheader.jsp" %></div>
<div id="adminfooter"><%@ include file="/WEB-INF/views/include/adminfooter.jsp" %></div>

<form action="addStop">
        <table id="inputtable" border="1" style="color : black">
            <tr>
             <td class="inputtitle">
                 정류장 번호
             </td>
             <td><input type="text" id="s_No" name="S_NO"></td>
            </tr>
            
            <tr>
             <td class="inputtitle">
                 동 이름
             </td>
             <td><input type="text" id="t_Name" name="T_NAME"></td>
         </tr>
         
         <tr>
             <td class="inputtitle">
                 정류장 이름
             </td>
             <td><input type="text" id="s_Name" name="S_NAME"></td>
             <td><div class="checkBox" id="checkName"></div></td>
         </tr>
         
         <tr>
             <td class="inputtitle">
                 x값
             </td>
             <td><input type="text" id="s_X" name="S_X"></td>
         </tr>
         
         <tr>
             <td class="inputtitle">
                 y값
             </td>
             <td><input type="text" id="s_Y" name="S_Y"></td>
             <td><div class="checkBox" id="checkPosition"></div></td>
         </tr>
         
         <tr>
             <td class="inputtitle">
                 상세정보
             </td>
             <td><input type="text" id="s_Detail" name="S_DETAIL"></td>
         </tr>
         
         <td colspan="2" style="text-align: center;">
             <input id="submit" type="submit" value="등록하기">
         </td>
     </table>
</form>

</body>
<script type="text/javascript">
//유효성 검사(아직 작업중)
/* $(function(){
	if($('#s_No').val() == ''){
		alert('정류장 번호를 입력하세요.');
		$('#s_No').focus();
		return;	
	}else if($('#t_Name').val() == ''){
		alert('동네 이름을 입력하세요.');
		$('#t_Name').focus();
		return;
	}else if($('#s_Name').val() == ''){
		alert('정류장 이름을 입력하세요.');
		$('#s_Name').focus();
		return;	
	}else if($('#s_X').val() == ''){
		alert('X좌표를 입력하세요.');
		$('#s_X').focus();
		return;
	}else if($('#s_Y').val() == ''){
		$('#s_Y').focus();
		return;
	}else{
		alert('정류장 등록 완료');
	}
	$('#addStop').submit();
}); */

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
				$('#checkName').html(data).css('color','violet');
			},
			error : function(err) {
				$('#checkName').html(err.responseText).css('color','red');
				console.log("err.status : ", err.status);
			}
		}); //ajax End
	}
}); //on End 

$('#s_Y').on('focusout',function(){
	if($('#s_X').val()&&$('#s_Y').val()!=''){
		$.ajax({
			type : 'get',
			url : 'checkPosition',
			data : { 
						's_X' : $('#s_X').val(),
						's_Y' : $('#s_Y').val()
					},
			dataType : 'html', 
			success : function(data) {
				$('#checkPosition').html(data).css('color','violet');
			},
			error : function(err) {
				$('#checkPosition').html(err.responseText).css('color','red');
				console.log("err.status : ", err.status);
			}
		}); //ajax End
	}
}); //on End 

</script>
</html>
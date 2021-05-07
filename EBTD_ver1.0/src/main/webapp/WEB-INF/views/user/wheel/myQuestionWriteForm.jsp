<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"   %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 소리함</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/v4-shims.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
	.main-container{
		color: black;
	}
	.divinput{
		margin: 15px;
		font-size: 18px;
	}
	.inputtitle{
		width: 359px;
		height: 25px;
	}
	.inputcontent{
		margin-top: 5px;
		width: 412px;
		height: 380px;
	}
	.file{
		width: 80px;
		height: 30px;
		text-align: center;
		margin-top: 10px;
		margin-right: 10px;
		font-size: 18px;
	}
	.img{
		width: 313px;
		height: 30px;
		margin-top: 10px;
		font-size: 18px;
	}
	.btn{
		margin-top: 11px;
		margin-left: 39.5%;
		width: 90px;
		height: 45px;
		font-size: 18px;
		cursor: pointer;
		border-radius: 10px;
		border: none;
	}
	.btn:hover{
		background-color: #f9eb99;
	}
	.select{
		width: 100px;
		height: 30px;
		margin-top: 10px;
	}
	.input1{
		font-size: 18px;
		border: none;
		text-align: right;
	}
	
</style>
</head>
<body>
<div id="userheader"><%@ include file="/WEB-INF/views/include/userheader.jsp"%></div>
<div class="main-container">
	<div>
		<div class="divinput">
		<form action="setMyQuestionWrite" method="post">
		<!-- c:forEach var="v" items="${vList}"-->
			<input class="username" type="hidden" name="u_username" value="${v.u_username}">
			제목 : <input class="inputtitle" name="v_title" value="${v.v_title}">
			버스번호 : <select class="select"></select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			평가 : <select class="select" name="voc_recommend"><option value="1">추천</option><option value="-1">비추천</option></select>
			<input class="inputcontent" name="v_content" value="${v.v_content}">
			<input class="file" value="첨부파일"><input class="img" value="사진.${v.imgextention}">
		<!-- /c:forEach-->
			<a href="/user/getMyQuestionList"><input type="submit" class="btn" value="확인"></a>
		</form>
		</div>
	</div>

</div>
<div id="userfooter"><%@ include file="/WEB-INF/views/include/userfooter.jsp"%></div>
<script type="text/javascript">
	$.ajax({
		type : 'get',
		url : 'getReservationBusNum',
		dataType : 'json',
		data : {
			'u_username' : $('.username').val()
		},
		success : function(data){
			console.log(data);
			$('.option').html('');
			let op = '';
			for(i in data){
				op += '<option name="b_no">' + data[i]["b_no"] +'</option>';
			}
			$('.option').append(op);
		},
		error : function(err){
			console.log(err,'@@@@');
		}
	});

</script>
</body>
</html>
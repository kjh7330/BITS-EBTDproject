<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"   %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EBTD - 이용 내역</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/v4-shims.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
	.main-container{
		color: black;
		margin: 15px;
	}
	.maintable{
		width: 410px;
		height: 480px;
		margin-left:5px;
		font-size: 23px;
		text-align: center;
		background-color: #f9eb99;
	}
	.input{
		border: none;
		background-color: #f9eb99;
		font-size: 23px;
		text-align: center;
	}
	.input:focus{
		outline: none;
	}
	#add{
		width: 150px;
		height: 45px;
		font-size: 20px;
		border-radius: 8px;
	}
	#add:hover{
		background-color: #0C3D6A;
		color: white;
		cursor: pointer;
	}
	#ub_alias{
		width: 210px;
		height: 25px;
		font-size: 15px;
	}
	#submit{
		width: 50px;
		height: 30px;
	}
	#submit:hover{
		background-color: #0C3D6A;
		color: white;
		cursor: pointer;
	}
.maindiv{
	position: relative;
	top: 130px;
	color: black;
	padding-bottom: 120px; /*footer여백*/
	z-index: 1;
}
#userheader {
	position: absolute;
	z-index: 3;
}
	
</style>
</head>
<body>
<div id="userheader"><%@ include file="/WEB-INF/views/include/userheader.jsp"%></div>
<div class="main-container">
	<div class="maindiv">
	<form action="setBookMark" method="post">
		<table class="maintable">
			<c:forEach var="ubd" items="${ubdList}">
			<tr>
				<td style="width: 120px;">버스번호</td><td><input type="hidden" name="u_username" value="${ubd.u_username}"><input class="input" name="b_no" value="${ubd.b_no}" readonly></td>
			</tr>
			<tr>
				<td>출발지</td><td><input type="hidden" name="s_nostart" value="${ubd.s_nostart}"><input class="input" name="s_namestart" value="${ubd.s_namestart}" readonly></td>
			</tr>
			<tr>
				<td>도착지</td><td><input type="hidden" name="s_nolast" value="${ubd.s_nolast}"><input class="input" name="s_namelast" value="${ubd.s_namelast}" readonly></td>
			</tr>
			<tr>
				<td>이용시간</td><td><input class="input" name="ur_date" value="${ubd.ur_date}" readonly></td>
			</tr>
			<tr>
				<td style="height:110px;" colspan="2"><input type="button" id="add" value="즐겨찾기 추가"><br><input id="ub_alias" name="ub_alias" type="hidden" placeholder="즐겨찾기 이름을 입력하세요~!" maxlength='30' value=""><input id="submit" type="hidden" value="추가"></td>
			</tr>
			</c:forEach>
		</table>
	</form>
	</div>
</div>
<div id="userfooter"><%@ include file="/WEB-INF/views/include/userfooter.jsp"%></div>
<script>
	$('#add').click(function(){
		if(		 $('#ub_alias').prop("type") == "hidden" ){
				 $('#ub_alias').prop("type","text");
				 $('#submit').prop("type","submit");
		}else if($('#ub_alias').attr("type") == "text" ){
				 $('#ub_alias').prop("type","hidden");
				 $('#submit').prop("type","hidden");
		}
	});
</script>
</body>
</html>
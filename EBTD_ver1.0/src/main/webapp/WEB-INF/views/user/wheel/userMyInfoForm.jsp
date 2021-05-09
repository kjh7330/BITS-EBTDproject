<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"   %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 확인</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
	.main-container{
		color: black;
	}
	.maintable{
		font-size: 18px;
		font-weight: bold;
		height: 500px;
		margin-bottom: 20px;
	}
	.tdname{
		text-align: right;
	}
	.tablebtn1{
		width: 100px;
		height: 48px;
		background-color: #f9eb99;
		border: none;
		border-radius: 10px;
		font-size: 20px;
		cursor: pointer;
	}
	.tablebtn1:hover{
		background-color: orange;
	}
	.tablebtn2{
		width: 100px;
		height: 46px;
		background-color: #f9eb99;
		text-align: center;
		border: none;
		border-radius: 10px;
		font-size: 20px;
		cursor: pointer;
	}
	.tablebtn2:hover{
		background-color: orange;
	}
	.inputs{
		width: 275px;
		height: 30px;
		font-size: 18px;
		background-color: #fffbe5;
		border: 1px solid black;
		padding-left: 7px;
	}
	.inputss{
		width: 160px;
		height: 30px;
		font-size: 18px;
		background-color: #fffbe5;
		border: 1px solid black;
		padding-left: 7px;
	}
	.tablediv{
		margin: 5px;
	}
	.btndiv{
		text-align: center;
	}
</style>
</head>
<body>
<div id="userheader"><%@ include file="/WEB-INF/views/include/userheader.jsp"%></div>
<div class="main-container">
<c:forEach var="mi" items="${miList}">
<form action="setUserMyInfo" method="post">
<div class="tablediv">
<table class="maintable">
	<tr>
		<td class="tdname">ID : </td>
		<td class="tdcontent"><input class="inputs" type="text" name="u_userName" value="${mi.u_userName}" readonly></td>
	</tr>
	<tr>
		<td class="tdname">이름 : </td>
		<td class="tdcontent"><input class="inputs" type="text" name="u_name" value="${mi.u_name}" readonly></td>
	</tr>
	<tr>
		<td class="tdname">전화번호 : </td>
		<td class="tdcontent"><input class="inputs" type="text" name="u_userphonenum" value="${mi.u_userphonenum}"></td>
	</tr>
	<tr>
		<td class="tdname">주소 : </td>
		<td class="tdcontent">
		<select class="inputss" name="t_name">
		<c:forEach var="t" items="${tList}">
			<c:choose>
				<c:when test="${t.t_name eq tName}">
					<option selected>인천시 ${t.t_name}</option>
				</c:when>
				<c:otherwise>
					<option>인천시 ${t.t_name}</option>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		</select><br>
		<input style="margin-top: 5px;" class="inputs" name="aDetail" value="${aDetail}">
		</td>
	</tr>
	<tr>
		<td class="tdname">보호자 이름 : </td>
		<td class="tdcontent"><input class="inputs" type="text" name="u_guardname" value="${mi.u_guardname}"></td>
	</tr>
	<tr>
		<td class="tdname">보호자 연락처 : </td>
		<td class="tdcontent"><input class="inputs" type="text" name="u_guardphonenum" value="${mi.u_guardphonenum}"></td>
	</tr>
	<tr>
		<td class="tdname">보호자와의 관계 : </td>
		<td class="tdcontent"><input class="inputs" type="text" name="u_guardrelation" value="${mi.u_guardrelation}"></td>
	</tr>
</table>
</div>
<div class="btndiv">
<input type="hidden" name="u_type" value="${mi.u_type}">
<input class="tablebtn1" type="submit" value="수정">&nbsp;&nbsp;&nbsp;<a href="/user/myPage"><input class="tablebtn2" type="text" value="취소"></a>
</div>
</form>
</c:forEach>
</div>
<div id="userfooter"><%@ include file="/WEB-INF/views/include/userfooter.jsp"%></div>
</body>
</html>
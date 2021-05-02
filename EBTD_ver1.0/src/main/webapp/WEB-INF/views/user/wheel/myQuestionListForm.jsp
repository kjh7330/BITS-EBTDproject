<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"   %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 소리함</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
	.main-container{
		color: black;
	}
	.divbtn{
		margin-top: 20px;
		margin-right: 10px;
		text-align: right;
	}
	.btn{
		background-color: #f9eb99;
		width: 90px;
		height: 40px;
		font-size: 20px;
		border-radius: 10px;
		border: none;
		cursor: pointer;
	}
	.btn:hover{
		background-color: lightgray;
	}
	.divtable{
		margin-left: 15px;
		margin-top: 10px;
	}
	.tablestyle{
		width: 425px;
		border-bottom: 1px solid black;
		border-collapse: collapse;
		text-align: center;
	}
	.tablestyle td{
		border-bottom: 1px solid black;
		border-collapse: collapse;
		height: 30px;
	}
	.tabletitle{
		font-weight: bold;
	}
</style>
</head>
<body>
<div id="userheader"><%@ include file="/WEB-INF/views/include/userheader.jsp"%></div>
<div class="main-container">
	<div class="divbtn">
		<a href="/user/getMyQuestionWrite"><button class="btn">작성</button></a>
	</div>
	<div class="divtable">
	<table class="tablestyle">
		<tr style="background-color: lightgray;">
			<td class="tabletitle">번호</td>
			<td class="tabletitle">버스번호</td>
			<td class="tabletitle">제목</td>
			<td class="tabletitle">작성일</td>
		</tr>
		<tr>
			<td>번호</td>
			<td>버스번호</td>
			<td><a style="text-decoration: none; color:black" href="/user/getMyQuestionDetail?v_no=${v.v_no}">제목</a></td>
			<td>작성일</td>
		</tr>
		<c:forEach var="v" items="${vList}">
		<tr>
			<td>${v.v_no}</td>
			<td>${v.b_no}</td>
			<td><a style="text-decoration: none;" href="/user/getMyQuestionDetail?v_no=${v.v_no}">${v.v_title}</a></td>
			<td>${v.v_date}</td>
		</tr>
		</c:forEach>
	</table>
	</div>
</div>
<div id="userfooter"><%@ include file="/WEB-INF/views/include/userfooter.jsp"%></div>
</body>
</html>
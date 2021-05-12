<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"   %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EBTD - 고객 소리함</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
	.main-container{
		color: black;
		background-color : #f6f4f4;
		height: 100vh;
		margin-top: -10px;
	}
	.divbtn{
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
.main-container{
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
<br>
	<div class="divbtn">
		<a href="/user/getMyQuestionWrite"><button class="btn">작성</button></a>
	</div>
	<div class="divtable">
	<table class="tablestyle">
		<tr style="background-color: lightgray;">
			<td class="tabletitle">접수번호</td>
			<td class="tabletitle">버스번호</td>
			<td class="tabletitle">제목</td>
			<td class="tabletitle">작성일</td>
		</tr>
		<c:set var="aL" value="${aList}" />
		<c:if test="${empty aL}">
		<c:forEach var="v" items="${vList}">
		<tr>
			<td>${v.v_no}</td>
			<td>${v.b_no}</td>
			<td><a style="text-decoration: none;" href="/user/getMyQuestionDetail?v_no=${v.v_no}">${v.v_title}</a></td>
			<td>${v.v_date}</td>
		</tr>
		</c:forEach>
		</c:if>
		<c:if test="${not empty aL}">
		<c:forEach var="v" items="${vList}">
		<c:forEach var="a" items="${aList}">
		<c:set var="vv" value="${v.v_no}" />
		<c:set var="aa" value="${a.v_no}" />
		<tr>
			<td>${v.v_no}</td>
			<td>${v.b_no}</td>
			<td><a style="text-decoration: none;" href="/user/getMyQuestionDetail?v_no=${v.v_no}">${v.v_title}</a></td>
			<td>${v.v_date}</td>
		</tr>
		<c:if test="${aa eq vv}">
		<tr>
			<td>${a.v_no+1}</td>
			<td>${a.b_no}</td>
			<td><a style="text-decoration: none;" href="/user/getMyQuestionDetail?v_no=${a.v_no+1}">${a.v_title}</a></td>
			<td>${a.v_date}</td>
		</tr>
		</c:if>
		</c:forEach>
		</c:forEach>
		</c:if>
	</table>
	</div>
</div>
<div id="userfooter"><%@ include file="/WEB-INF/views/include/userfooter.jsp"%></div>
</body>
</html>
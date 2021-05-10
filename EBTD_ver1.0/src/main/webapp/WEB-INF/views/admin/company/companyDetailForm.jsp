<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"   %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 회사 관리 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
		.main-container{
		    position: absolute;
            left: 50%;
            transform: translate(-50%,27%);
			color: black;
			width: 800px;
            text-align: center;
			padding-bottom: 140px;
		}
		.maindivinput{
			border: none;
			background-color: #f9eb99;
			font-size: 20px;
			font-weight: bold;
			width: 800px;
			height: 50px;
			text-align: center;
			border-radius: 8px;
		}
		.maindivinput:focus{
			outline:none;
		}
		.maintable1{
			text-align: center;
			width: 450px;
			margin-left: auto;
			margin-right: auto;
		}
		.maintable2{
			margin-top: 20px;
			width: 800px;
			border: 1px solid black;
			margin-left: auto;
			margin-right: auto;
		}
		tr, td{
			border: 1px solid black;
			font-size: 18px;
		}
		td{
			height: 40px;
		}
		.qbtn{
			width: 150px;
			height: 50px;
			text-align: center;
			margin-top: 30px;
			font-size: 20px;
			background-color: lightgray;
			border: none;
			border-radius: 8px;
		}
		.qbtn:hover{
			background-color: #f9eb99;
		}
		.main-info{
			width: 800px;
		}

    </style>
</head>
<body>
<div id="adminheader"><%@ include file="/WEB-INF/views/include/adminheader.jsp" %></div>

<div class="main-container">
	<div>
		<input type="text" class="maindivinput" value="버스 회사 상세 정보" readonly><br>
	</div><br>
	<div class="main-info">
		<table class="maintable1">
			<tr style="background-color: lightgray;">
				<td style="width: 220px;">회사명 : </td><td>${cName.c_name}</td>
			</tr>
			<c:forEach var="vr" items="${vrCountList}">
			<tr>
				<td>총 민원 수 :</td><td>${vr.v_count}</td>
			</tr>
			<tr>
				<td>총 추천 수 :</td><td>${vr.voc_recommend}</td>
			</tr>
			</c:forEach>
		</table>
	</div>
	<div class="maindivtable">
		<table class="maintable2">
			<tr style="background-color: lightgray;">
				<td>운행노선</td><td>인가대수</td><td>저상버스</td><td>일반버스</td><td style="width: 165px;">기사수</td>
			</tr>
			<c:forEach var="bd" items="${bdCountList}">
			<c:forEach var="lr" items="${lrCountList}">
			<c:if test="${bd.b_no eq lr.b_no}">
			<tr>
				<td>${bd.b_no}</td><td>${bd.b_all_num}</td><td>${lr.b_lowfloor_num}</td><td>${lr.b_regular_num}</td><td>${bd.d_num}</td>
			</tr>
			</c:if>
			</c:forEach>
			</c:forEach>
		</table>
	</div>
	<div>
		<a href="/admin/company/getCompanyQuestionList?c_username=${cName.c_username}">
			<input class="qbtn" type="button" value="고객소리함">
		</a>
	</div>
</div>
	
<div id="adminfooter"><%@ include file="/WEB-INF/views/include/adminfooter.jsp" %></div>
</body>
</html>
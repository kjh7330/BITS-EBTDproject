<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"   %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사 관리 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
		#main-container{
			position: absolute;
			top: 13%;
            left: 50%;
            transform: translate(-50%,10%);
			color: black;
			text-align: center;
		}
		.maindivinput{
			border: none;
			border-radius: 15px;
			text-align: center;
			background-color: #c4ff0e;
			height: 80px;
			width: 400px;
			font-size: 30px;
		}
		.maintable1{
			width: 600px;
		}
		.maintable2{
			margin-top: 20px;
			width: 600px;
			border: 1px solid black;
		
		}
		tr, td{
			border: 1px solid black;
			font-size: 20px;
		}
		td{
			height: 40px;
		}
		.btn{
			width: 150px;
			height: 50px;
			text-align: center;
			margin-top: 30px;
			
		}

    </style>
</head>
<body>
<div id="adminheader"><%@ include file="/WEB-INF/views/include/adminheader.jsp" %></div>

	<div id="main-container">
		<div><br>
			<input type="text" class="maindivinput" value="버스 회사 상세 정보" readonly><br>
		</div><br>
		<div class="main-info">
			<table class="maintable1">
				<tr style="background-color: lightgray;">
					<td>회사명 : </td><td>${cName.c_name}</td>
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
					<td>운행노선</td><td>인가대수</td><td>저상버스</td><td>일반버스</td><td>기사수</td>
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
			<input class="btn" type="button" style="font-size: 20px;background-color: #c4ff0e;" value="고객소리함">
			</a>
		</div>
	</div>


	<div id="adminfooter"><%@ include file="/WEB-INF/views/include/adminfooter.jsp" %></div>
</body>
</html>
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
		.main-info{
			text-align: center;
		}
		.maintable1{
			width: 600px;
			margin: auto;
		}
		.maintable2{
			margin-top: 20px;
			width: 1000px;
			border: 1px solid black;
		
		}
		tr, td{
			border: 1px solid black;
			font-size: 18px;
		}
		td{
			height: 40px;
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
			<table class="maintable2">
				<tr style="background-color: lightgray;">
					<td style="width: 85px;">민원 번호</td>
					<td style="width: 70px;">평가</td>
					<td style="width: 85px;">버스번호</td>
					<td style="width: 200px;">제목</td>
					<td>내용</td>
					<td style="width: 110px;">고객아이디</td>
					<td style="width: 110px;">작성일</td>
				</tr>
				<c:forEach var="voc" items="${vocList}">
				<tr>
					<td>${voc.v_no}</td>
					<td><c:choose><c:when test="${voc.voc_recommend eq 1}">추천</c:when><c:when test="${voc.voc_recommend eq 0}">답변</c:when><c:when test="${voc.voc_recommend eq -1}">비추천</c:when></c:choose></td>
					<td>${voc.b_no}</td>
					<td>${voc.v_title}</td>
					<td>${voc.v_content}</td>
					<td>${voc.c_username}</td>
					<td>${voc.v_date}</td>
				
				</tr>
				
				</c:forEach>
			</table>
		</div>
		<div class="maindivtable">

		</div>
		<div>

		</div>
	</div>


	<div id="adminfooter"><%@ include file="/WEB-INF/views/include/adminfooter.jsp" %></div>
</body>
</html>
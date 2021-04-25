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
		.main-container{
			color: black;
			text-align: center;
		
		}

    </style>
</head>
<body>
<div id="adminheader"><%@ include file="/WEB-INF/views/include/adminheader.jsp" %></div>

<div class="main-container">
	<div><input value="노선 승인 내역" readonly></div>
	<div>
		정렬:
		<select>
			<option value="" selected>전체</option>
			<option value="v_date">승인일자</option>
			<option value="ap_state">승인종류</option>
			<option value="c_name">회사명</option>
		</select>
		정렬기간:
		<select>
			<option value="" selected>전체</option>
			<option value="v_date">일주일</option>
			<option value="ap_state">1개월</option>
			<option value="c_name">3개월</option>
		</select>
	</div>
	<div>
		<table class="maintable">
		<c:forEach var="ba" items="${baList}">
			<tr>
				<td>${ba.c_name}</td><td>${ba.ap_date}</td><td>${ba.ap_state}</td>
			</tr>
		</c:forEach>
		</table>
	</div>
</div>

<div id="adminfooter"><%@ include file="/WEB-INF/views/include/adminfooter.jsp" %></div>
<script type="text/javascript">
/* 	$.ajax({
		type : 'get',
		url : ''
		
	});
	
	$('.maintable') */

</script>
</body>
</html>
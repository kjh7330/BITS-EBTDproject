<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사 관리 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>


    </style>
</head>
<body>
<div id="adminheader"><%@ include file="/WEB-INF/views/include/adminheader.jsp" %></div>

	<div id="main-container">
		<div><br>
			<input type="text" class="maindivinput" value="버스 회사 리스트" readonly><br>
		</div><br><br>
		<div class="maindivtable">
			<table>
				<c:forEach var="c" items="${cList}">
					<tr>
						<td>
							<a href="/admin/company/getCompanyDetail?c_name=${c.c_name}">
							<input type="button" class="maintableinput" value="${c.c_name}" readonly>
							</a>
						</td>
					<tr>
				</c:forEach>
			</table>
		</div>
	</div>


	<div id="adminfooter"><%@ include file="/WEB-INF/views/include/adminfooter.jsp" %></div>
</body>
</html>
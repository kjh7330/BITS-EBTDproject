<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<body>
<div class="container">
	<div id="companyheader"><%@ include
			file="/WEB-INF/views/include/companyheader.jsp"%>
	</div>

		<div style="color: black; text-align: center">
			정류장 이름 검색 <input id="search" name="search">
			<!-- <select>
				<option value="all">전체</option>
				<option value="stopNumber">정류장 번호</option>
				<option value="stopName">정류장 이름</option>
			</select> <input id="search" name="search">&nbsp; -->
			<button onclick="searchStop()">조회</button>
		</div>

	<table class="table table-striped" style="color: black">
		<thead>
			<tr>
				<th>정류장 번호</th>
				<th>동 이름</th>
				<th>정류장 이름</th>
 				<!-- <th>X값</th>
				<th>Y값</th>
				<th>상세내용</th>  -->
			</tr>
		</thead>
		<tbody id="stopList">
		</tbody>
	</table>



	<div id="companyfooter"><%@ include
			file="/WEB-INF/views/include/companyfooter.jsp"%>

	</div>
</div>
</body>

<script src="http://code.jquery.com/jquery-latest.js">
</script>
<script type="text/javascript">

	
</script>
</html>
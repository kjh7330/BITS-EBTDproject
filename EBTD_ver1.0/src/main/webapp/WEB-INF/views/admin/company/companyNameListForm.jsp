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
            left: 50%;
            transform: translate(-50%,10%);
			color: black;
			width: 800px;
            text-align: center;
		}
		.maindivinput{
			border: none;
            border-radius: 8px;
            text-align: center;
            width: 800px;
            background-color: pink;
            height: 60px;
            font-weight: bold;
            font-size: 20px;
		}
		.maindivinput:focus{
			outline:none;
		}
		.maintableinput{
            border: none;
            border-radius: 8px;
            text-align: center;
            width: 798px;
            height: 40px;
            font-size: 18px;
		}
		.maintableinput:hover{
			background-color: #fe83ab;
		}
		.maintableinput:focus{
			outline:none;
		}

    </style>
</head>
<body>
<div id="adminheader"><%@ include file="/WEB-INF/views/include/adminheader.jsp" %></div>
<div id="main-container">

<div>
	<br>
	<input type="text" class="maindivinput" value="버스 회사 리스트" readonly>
	<br>
</div>
	<br><br>
<div class="maindivtable">
<table>
	<tr>
		<c:forEach var="c" items="${cList}">
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
<script>
/*
	function search(){
		$(input[name=input])
		
		let word = target.value;
		let encodeWord = encodeURL(word);
		console.log(word);
		console.log(encodeWord);
		
		//ajax
		$.ajax({
			type: 'get',
			dataType: 'json',
			url: "getCompanyNameSearch",
			success: 
		});
		
	}
*/

</script>
<div id="adminfooter"><%@ include file="/WEB-INF/views/include/adminfooter.jsp" %></div>

</body>
</html>
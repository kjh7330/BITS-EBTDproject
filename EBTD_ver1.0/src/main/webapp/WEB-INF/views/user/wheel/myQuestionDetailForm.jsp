<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"   %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 소리함</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/v4-shims.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
	.main-container{
		color: black;
	}
	.divinput{
		margin: 15px;
		font-size: 18px;
	}
	.inputtitle{
		width: 265px;
		height: 25px;
		font-size: 15px;
	}
	.inputcontent{
		margin-top: 5px;
		width: 412px;
		height: 350px;
		resize: none;
		font-size: 15px;
	}
	.inputcontent:focus{
		outline: none;
	}
	.file{
		width: 80px;
		height: 30px;
		text-align: center;
		margin-top: 10px;
		margin-right: 10px;
		font-size: 18px;
	}
	.img{
		width: 313px;
		height: 30px;
		margin-top: 10px;
		font-size: 18px;
	}
	.divbtn{
		text-align: center;
	}
	.btn{
		width: 90px;
		height: 45px;
		font-size: 18px;
		cursor: pointer;
		border-radius: 10px;
		border: none;
	}
	.btn:hover{
		background-color: #f9eb99;
	}
	.recom{
		width: 80px;
		font-size: 20px;
		border: none;
		text-align: center;
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
	<div>
		<div class="divinput">
		<c:forEach var="v" items="${vList}">
			제목 : <input class="inputtitle" value="${v.v_title}">
			<c:choose>
				<c:when test="${v.voc_recommend eq 1}">
					<input class="recom" type="text" value="추천👍">
				</c:when>
				<c:when test="${v.voc_recommend eq -1}">
					<input class="recom" type="text" value="비추천👎">
				</c:when>
			</c:choose>
			<br>내용<textarea class="inputcontent" name="v_content" cols="40" rows="8" readonly>${v.v_content}</textarea>
		</c:forEach>
		</div>
		<div class="divbtn">
			<a href="/user/getMyQuestionList"><button class="btn">확인</button></a>
		</div>
	</div>

</div>
<div id="userfooter"><%@ include file="/WEB-INF/views/include/userfooter.jsp"%></div>
</body>
</html>
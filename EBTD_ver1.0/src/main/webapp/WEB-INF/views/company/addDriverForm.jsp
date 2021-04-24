<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%-- <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
 <div id="companyheader"><%@ include file="/WEB-INF/views/include/companyheader.jsp" %>
</div>

<div class="insertData" style="color:black; text-align:center">
<form action="/company/addDriver" method="post">
기사 번호 : <input type="text" id="d_no" name="d_no"><br>
회사 이름 : <input type="text" id="c_userName" name="c_userName"><br>
기사 이름 : <input type="text" id="d_name" name="d_name"><br>
사진 : <input type="file" id="d_imgExtention" name="d_imgExtention"><br>
핸드폰 번호 : <input type="text" id="p_phoneNum" name="p_phoneNum">
입사일 : <input type="text" id="d_enterDate" name="d_enterDate"><br>
운행노선 : <input type="text" id="b_no" name="b_no"><br>
      
<input type="submit" value="추가하기" onClick=addDriver()>   
</form>
</div>

 <div id="companyfooter"><%@ include file="/WEB-INF/views/include/companyfooter.jsp" %>

</div> 

</body>
<script src="http://code.jquery.com/jquery-latest.js">
</script>
<script type="text/javascript">


function addDriver(){
	
	alert('기사 추가 완료');
	
} 
</script>
</html>
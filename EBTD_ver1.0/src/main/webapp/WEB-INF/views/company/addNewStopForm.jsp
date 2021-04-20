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
<form action="company/addNewStopForm" method="post">
정류장 번호 : <input type="text" id="stopNum"><br>
동 이름 : <input type="text" id="stopTown"><br>
정류장 이름 : <input type="text" id="stopName"><br>

주소 : <input type="text" id="valueX" placeholder="X값">
      <input type="text" id="valueY" placeholder="Y값"><br>
상세설명 : <input type="text" id="stopDetail"><br>
      
<button onClick=checkStop()>중복 조회</button>&nbsp;
<button type="submit" onClick=addNewStop()>정류장 등록 신청</button>    
</form>
</div>

 <div id="companyfooter"><%@ include file="/WEB-INF/views/include/companyfooter.jsp" %>

</div> 

</body>
<script src="http://code.jquery.com/jquery-latest.js">
</script>
<script type="text/javascript">

function checkStop(){
	alert('중복 조회 완료');
}	
 
function addNewStop(){
	/* $("#join_form").attr("action", "/member/join");
	$("#join_form").submit(); */
	
	alert('정류장 신청 완료');
	
} 
</script>
</html>
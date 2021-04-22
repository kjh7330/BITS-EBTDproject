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

<div style="color:black; text-align:center">
<form action="/company/addNewStop" method="post">
신청 번호  <input type="text" id="sa_No" name="sa_No"><br>
동 이름 : <input type="text" id="t_Name" name="t_Name"><br>
정류장 이름 : <input type="text" id="sa_Name" name="sa_Name"><br>
신청 회사 : <input type="text" id="c_UserName" name="c_UserName"><br>
주소 : <input type="text" id="sa_X" name="sa_X" placeholder="X값">
      <input type="text" id="sa_Y" name="sa_Y" placeholder="Y값"><br>
신청사유 : <input type="text" id="sa_Reason" name="sa_Reason" value=""><br>
<!-- 신청일 :  <input type="text" id="sa_Date" name="sa_Date"><br>  -->
<!--  <input type="date" id="sa_Date" name="sa_Date"><br>  -->
<!--  신청상태 : -->  <input type="hidden" id="sa_Status" name="sa_Status" value="0"><br> <!-- 신청시 기본값 0(대기) -->
<!-- 반려사유 : -->  <input type="hidden" id="sa_Disreason" name="sa_Disreason" value=""><br>     
<button onClick=checkStop()>중복 조회</button>&nbsp;
<input type="submit" value="신청하기" onClick=addNewStop()>   
</form>
</div>

 <div id="companyfooter"><%@ include file="/WEB-INF/views/include/companyfooter.jsp" %>

</div> 

</body>
<script src="http://code.jquery.com/jquery-latest.js">
</script>
<script type="text/javascript">
//신청일 오늘날짜로 설정
document.getElementById('sa_Date').valueAsDate = new Date();



function checkStop(){
	alert('중복 조회 완료');
}	
 
function addNewStop(){
	alert('정류장 신청 완료');
	
} 
</script>
</html>
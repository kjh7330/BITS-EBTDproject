<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<div id="companyheader"><%@ include
			file="/WEB-INF/views/include/companyheader.jsp"%>
	</div>

	<div style="color: black; text-align: center">
		<form action="/company/addNewStop" method="post">
			신청 번호 <input type="text" id="sa_No" name="sa_No"><br> 
			동 이름 : <input type="text" id="t_Name" name="t_Name"><br>
			정류장 이름 : <input type="text" id="sa_Name" name="sa_Name"><br>
			<div class="checkSaName" id="checkSaName"></div>
			<!-- 정류장 이름 중복시 나타남 -->
			신청 회사 : <input type="text" id="c_UserName" name="c_UserName"><br>
			주소 : <input type="text" id="sa_X" name="sa_X" placeholder="X값">
			<input type="text" id="sa_Y" name="sa_Y" placeholder="Y값"><br>
			<div class="checkSaPosition" id="checkSaPosition"></div>
			신청사유 : <input type="text" id="sa_Reason" name="sa_Reason" value=""><br>
			<!-- 신청일 :  <input type="text" id="sa_Date" name="sa_Date"><br>  -->
			<!--  <input type="date" id="sa_Date" name="sa_Date"><br>  -->
			<!--  신청상태 : -->
			<input type="hidden" id="sa_Status" name="sa_Status" value="0"><br>
			<!-- 신청시 기본값 0(대기) -->
			<!-- 반려사유 : -->
			<input type="hidden" id="sa_Disreason" name="sa_Disreason" value=""><br>
			<!-- <button onClick=checkStop()>중복 조회</button>&nbsp; -->
			<input type="submit" id="addSubmit" value="신청하기" onClick=addNewStop()>
		</form>
	</div>

	<div id="companyfooter"><%@ include
			file="/WEB-INF/views/include/companyfooter.jsp"%>

	</div>

</body>
<script src="http://code.jquery.com/jquery-latest.js">
</script>
<script type="text/javascript">
//신청일 오늘날짜로 설정
//document.getElementById('sa_Date').valueAsDate = new Date();

//정류장 이름 중복검사
$("#sa_Name").blur(function() {
		var sa_Name = $('#sa_Name').val(); //입력한 정류장 이름
		$.ajax({
			url : '/company/checkSaName?S_NAME=' + sa_Name,
			type : 'get',
			dataType : 'html',
			success : function(data) {		
				console.log("정류장 이름 검사 성공");
				console.log(data);
					//정류장 이름 중복시
					if(data == "사용불가한 정류장 이름"){
						//alert("사용중인 정류장이름 입니다.");
						$("#checkSaName").text("사용중인 정류장 이름 입니다");
						$("#checkSaName").css("color", "red");
						$("#addSubmit").attr("disabled", true); //submit 비활성화 
					}
					//정류장 이름 중복 아닐시
					else { 
						//alert("사용가능한 정류장 이름 입니다.");
						$("#checkSaName").text("사용가능한 정류장 입니다");
						$("#checkSaName").css("color", "blue");
						//$("#addSubmit").attr("disabled", false); //submit 활성화
					} 
				}, error : function(err) {
						console.log("정류장 이름 검사 실패");
						//$("#addSubmit").attr("disabled", true); //submit 비활성화
				}
			}); //ajax End
		}); //blur End 

//정류장 위치 중복검사
$("#sa_Y").blur(function() {
		var sa_X = $('#sa_X').val(); //입력한 X값
		var sa_Y = $('#sa_Y').val(); //입력한 Y값

		$.ajax({
			url : '/company/checkSaPosition?',
			type : 'get',
			data : {'S_X' : sa_X, 'S_Y' : sa_Y},
			dataType : 'html',
			success : function(data) {		
				//console.log("정류장 위치 검사 성공");
				console.log(data);
					//정류장 위치 중복시
					if(data == "사용불가한 정류장 위치"){
						alert("사용중인 정류장 위치 입니다.");
						$("#checkSaPosition").text("사용중인 정류장 위치 입니다");
						$("#checkSaPosition").css("color", "red");
						$("#addSubmit").attr("disabled", true); //submit 비활성화 
					}
					//정류장 위치 중복 아닐시
					else { 
						alert("사용가능한 정류장 위치 입니다.");
						$("#checkSaPosition").text("사용가능한 정류장 위치 입니다");
						$("#checkSaPosition").css("color", "blue");
						//$("#addSubmit").attr("disabled", false); //submit 활성화
					} 
				}, error : function(err) {
						console.log("정류장 위치 검사 실패");
						//$("#addSubmit").attr("disabled", true); //submit 비활성화
				}
			}); //ajax End
		}); //blur End  
 
 
 
 
 
function addNewStop(){
	alert('정류장 신청 완료');
} 
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<body>
	<div id="companyheader"><%@ include
			file="/WEB-INF/views/include/companyheader.jsp"%>
	</div>
<div class="container" style="color: black">
  <form action="/company/addNewStop" method="post">
    <div class="form-group">
      <label for="c_UserName"> 신청회사 </label>
      <input type="text" class="form-control" id="c_UserName" name="c_UserName" value="${sessionScope.c_username}" readonly>
    </div>
    <div class="form-group">
      <label for="sa_Name"> 정류장 이름 </label>
      <input class="form-control" type="text" id="sa_Name" name="sa_Name">
	  <div class="checkSaName" id="checkSaName"></div>
    </div>
    <div class="form-group">
      <label for="pwd"> x값 </label>
      <input class="form-control" type="text" id="sa_X" name="sa_X" placeholder="X값">
    </div>
    <div class="form-group">
      <label for="sa_Name"> y값 </label>
      <input class="form-control" type="text" id="sa_Y" name="sa_Y" placeholder="Y값" >
	  <div class="checkSaPosition" id="checkSaPosition"></div>
    </div>
    <div class="form-group">
      <label for="t_Name"> 동 이름 </label>
      <input type="text" class="form-control" id="t_Name" name="t_Name" readonly>
    </div>
    <div class="form-group">
      <label for="sa_Reason"> 신청사유 </label>
      <input type="text" class="form-control" id="sa_Reason" name="sa_Reason">
    </div>
    <input type="hidden" id="sa_State" name="sa_State" value="0">
    
    
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



//정류장 이름 중복검사
$("#sa_Name").blur(function() {
		var sa_Name = $('#sa_Name').val(); //입력한 정류장 이름
		$.ajax({
			url : '/company/checkSaName?S_NAME=' + sa_Name,
			type : 'get',
			dataType : 'html',
			success : function(data) {		
				console.log("정류장 이름 검사 성공");
					//정류장 이름 중복시
					if(data == "사용불가한 정류장 이름"){ 
						$("#checkSaName").text("사용중인 정류장 이름 입니다");
						$("#checkSaName").css("color", "red");
						//$("#addSubmit").attr("disabled", true); //submit 비활성화 
					}
					//정류장 이름 중복 아닐시
					else {
						$("#checkSaName").text("사용가능한 정류장 입니다");
						$("#checkSaName").css("color", "blue");
						//$("#addSubmit").attr("disabled", false); //submit 활성화
					} 
				}, error : function(err) {
						console.log("정류장 이름 검사 실패");
						//$("#addSubmit").attr("disabled", true); //submit 비활성화
					}
				}); //ajax End
				
				if(sa_Name=='')$("#addSubmit").attr("disabled", true);
		}); //blur End 
	//정류장 위치 중복검사
		$("#sa_X").blur(function() {
				var sa_X = $('#sa_X').val(); //입력한 X값
				var sa_Y = $('#sa_Y').val(); //입력한 Y값
				$.ajax({
					url : '/company/checkSaPosition?',
					type : 'get',
					data : {'S_X' : sa_X, 'S_Y' : sa_Y},
					dataType : 'html',
					success : function(data) {		
							//정류장 위치 중복시
							if(data == "사용불가한 정류장 위치"){
								$("#t_Name").val("");
								$("#checkSaPosition").text("사용중인 정류장 위치 입니다");
								$("#checkSaPosition").css("color", "red");
								//$("#addSubmit").attr("disabled", true); //submit 비활성화 
							}
							//정류장 위치 중복 아닐시		
							else {
								//if(sa_X>100 || sa_Y>100) {alert('정류장 좌표 최대값은 100입니다.'); $("#t_Name").val(""); 
								//$("#sa_X").val(""); $("#sa_Y").val(""); $("#checkSaPosition").hide();}
								if(0 <= sa_X  && sa_X <= 33 && 0 <= sa_Y && sa_Y <= 33) {$("#t_Name").val("청학1동"); $("#checkSaPosition").text("사용가능한 정류장 위치 입니다"); $("#checkSaPosition").css("color", "blue");}
								else if(34 <= sa_X && sa_X <= 66 && 0 <= sa_Y && sa_Y <= 33) {$("#t_Name").val("청학2동"); $("#checkSaPosition").text("사용가능한 정류장 위치 입니다"); $("#checkSaPosition").css("color", "blue");}                     
								else if(67 <= sa_X && sa_X <= 100 && 0 <= sa_Y && sa_Y <= 33) {$("#t_Name").val("청학3동"); $("#checkSaPosition").text("사용가능한 정류장 위치 입니다"); $("#checkSaPosition").css("color", "blue");}
								else if(0 <= sa_X && sa_X <= 33 && 34 <= sa_Y && sa_Y <= 66) {$("#t_Name").val("송도1동"); $("#checkSaPosition").text("사용가능한 정류장 위치 입니다"); $("#checkSaPosition").css("color", "blue");}
								else if(34 <= sa_X && sa_X <= 66 && 34 <= sa_Y && sa_Y <= 66) {$("#t_Name").val("송도2동"); $("#checkSaPosition").text("사용가능한 정류장 위치 입니다"); $("#checkSaPosition").css("color", "blue");}
								else if(67 <= sa_X && sa_X <= 100 && 34 <= sa_Y && sa_Y <= 66) {$("#t_Name").val("송도3동"); $("#checkSaPosition").text("사용가능한 정류장 위치 입니다"); $("#checkSaPosition").css("color", "blue");}
								else if(0 <= sa_X && sa_X <= 33 && 67 <= sa_Y && sa_Y <= 100) {$("#t_Name").val("연수1동"); $("#checkSaPosition").text("사용가능한 정류장 위치 입니다"); $("#checkSaPosition").css("color", "blue");}
								else if(34 <= sa_X && sa_X <= 66 && 67 <= sa_Y && sa_Y <= 100) {$("#t_Name").val("연수2동"); $("#checkSaPosition").text("사용가능한 정류장 위치 입니다"); $("#checkSaPosition").css("color", "blue");}
								else if(67 <= sa_X && sa_X <= 100 && 67 <= sa_Y && sa_Y <= 100) {$("#t_Name").val("연수3동"); $("#checkSaPosition").text("사용가능한 정류장 위치 입니다"); $("#checkSaPosition").css("color", "blue");}
								
								//$("#addSubmit").attr("disabled", false); //submit 활성화
							}  
						}, error : function(err) {
								console.log("정류장 위치 검사 실패");
						}
					}); //ajax End
				}); //blur End   
				
//정류장 위치 중복검사
 $("#sa_Y").blur(function() {
		var sa_X = $('#sa_X').val(); //입력한 X값
		var sa_Y = $('#sa_Y').val(); //입력한 Y값
		//if(sa_X>100 || sa_Y>100) alert('정류장 좌표 최대값은 100입니다.');
		$.ajax({
			url : '/company/checkSaPosition?',
			type : 'get',
			data : {'S_X' : sa_X, 'S_Y' : sa_Y},
			dataType : 'html',
			success : function(data) {		
					//정류장 위치 중복시
					if(data == "사용불가한 정류장 위치"){
						$("#checkSaPosition").text("사용중인 정류장 위치 입니다");
						$("#t_Name").val(""); 
						$("#checkSaPosition").css("color", "red");
						//$("#addSubmit").attr("disabled", true); //submit 비활성화 
					}
					//정류장 위치 중복 아닐시
					else {
						if(sa_X>100 || sa_Y>100) {alert('정류장 좌표 최대값은 100입니다.'); $("#t_Name").val(""); 
						$("#sa_X").val(""); $("#sa_Y").val(""); $("#checkSaPosition").hide();}
						else if(0 <= sa_X  && sa_X <= 33 && 0 <= sa_Y && sa_Y <= 33) {$("#t_Name").val("청학1동"); $("#checkSaPosition").text("사용가능한 정류장 위치 입니다"); $("#checkSaPosition").css("color", "blue");}
						else if(34 <= sa_X && sa_X <= 66 && 0 <= sa_Y && sa_Y <= 33) {$("#t_Name").val("청학2동"); $("#checkSaPosition").text("사용가능한 정류장 위치 입니다"); $("#checkSaPosition").css("color", "blue");}                     
						else if(67 <= sa_X && sa_X <= 100 && 0 <= sa_Y && sa_Y <= 33) {$("#t_Name").val("청학3동"); $("#checkSaPosition").text("사용가능한 정류장 위치 입니다"); $("#checkSaPosition").css("color", "blue");}
						else if(0 <= sa_X && sa_X <= 33 && 34 <= sa_Y && sa_Y <= 66) {$("#t_Name").val("송도1동"); $("#checkSaPosition").text("사용가능한 정류장 위치 입니다"); $("#checkSaPosition").css("color", "blue");}
						else if(34 <= sa_X && sa_X <= 66 && 34 <= sa_Y && sa_Y <= 66) {$("#t_Name").val("송도2동"); $("#checkSaPosition").text("사용가능한 정류장 위치 입니다"); $("#checkSaPosition").css("color", "blue");}
						else if(67 <= sa_X && sa_X <= 100 && 34 <= sa_Y && sa_Y <= 66) {$("#t_Name").val("송도3동"); $("#checkSaPosition").text("사용가능한 정류장 위치 입니다"); $("#checkSaPosition").css("color", "blue");}
						else if(0 <= sa_X && sa_X <= 33 && 67 <= sa_Y && sa_Y <= 100) {$("#t_Name").val("연수1동"); $("#checkSaPosition").text("사용가능한 정류장 위치 입니다"); $("#checkSaPosition").css("color", "blue");}
						else if(34 <= sa_X && sa_X <= 66 && 67 <= sa_Y && sa_Y <= 100) {$("#t_Name").val("연수2동"); $("#checkSaPosition").text("사용가능한 정류장 위치 입니다"); $("#checkSaPosition").css("color", "blue");}
						else if(67 <= sa_X && sa_X <= 100 && 67 <= sa_Y && sa_Y <= 100) {$("#t_Name").val("연수3동"); $("#checkSaPosition").text("사용가능한 정류장 위치 입니다"); $("#checkSaPosition").css("color", "blue");}
						
						//$("#addSubmit").attr("disabled", false); //submit 활성화
					}  
				}, error : function(err) {
						console.log("정류장 위치 검사 실패");
				}
			}); //ajax End
		}); //blur End   

 
	 //var sa_Name = $('#sa_Name').val();
	 //var sa_X = $('#sa_X').val(); //입력한 X값
	// var sa_Y = $('#sa_Y').val(); //입력한 Y값
	// if(sa_Name =='' || sa_X =='' || sa_Y =='') $("#addSubmit").attr("disabled", true); //submit 비활성화 
	// else $("#addSubmit").attr("disabled", false); //submit 활성화
	 
 

		
function addNewStop(){
	alert('정류장 신청 완료');
} 
</script>
</html>
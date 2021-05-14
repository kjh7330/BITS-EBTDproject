<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사 - 정류장 관리</title>
<style type="text/css">
.container2 {
   text-align: center;
               width: 800px;
            color: black;
            left: 50%;
            padding-top:170px;
            margin-left: auto;
            margin-right: auto;
            padding-bottom: 140px;
}

.maininput {
   border: none;
   background-color: #b6e8fc;
   font-size: 20px;
   font-weight: bold;
   width: 800px;
   height: 50px;
   text-align: center;
   margin-bottom: 20px;
   border-radius: 10px;
}

.main {
   width: 370px;
   margin-left: auto;
   margin-right: auto;
   font-size: 18px;
}

.main input {
   font-size: 18px;
   text-align: cetner;
}

#btn {
   text-align: center;
   background-color: lightgray;
   border-radius: 8px;
   border: none;
   margin: 10px;
   width: 100px;
   height: 40px;
}
#btn:hover {
   background-color: #b6e8fc;
}
.checkSaName{
   font-size:12px;
}

.checkSaPosition{
   font-size:12px;
}
</style>
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
<div class="container2">
   <div><input class="maininput" value="정류장 등록 신청" readonly></div>
  <div class="main">
  <form action="/company/addNewStop" method="post" onsubmit="return checkAll()">
  <table>
     <tr>
        <td>
          <div class="form-group">
            <label for="c_UserName"> 신청회사 </label>
            <input type="text" class="form-control" id="c_UserName" name="c_UserName" value="${sessionScope.c_username}" readonly>
          </div>
       </td>
      <td>
          <div class="form-group">
            <label for="sa_Name"> 정류장 이름 </label>
            <input class="form-control" type="text" id="sa_Name" name="sa_Name" placeholder="입력하세요!">
          </div>
       </td>
    </tr>
    <tr>
       <td style="height: 22px;" /><td><div class="checkSaName" id="checkSaName"></div></td>
    </tr>
    <tr>
         <td>
          <div class="form-group">
            <label for="sa_X"> x값 </label>
            <input class="form-control" type="text" id="sa_X" name="sa_X" placeholder="X값">
          </div>
      </td>
      <td>
          <div class="form-group">
            <label for="sa_Y"> y값 </label>
            <input class="form-control" type="text" id="sa_Y" name="sa_Y" placeholder="Y값" >
          </div>
       </td>
    </tr>
    <tr>
       <td style="height: 22px;" /><td><div class="checkSaPosition" id="checkSaPosition"></div></td>
    </tr>
    <tr>
       <td>
          <div class="form-group">
            <label for="t_Name"> 동 이름 </label>
            <input type="text" class="form-control" id="t_Name" name="t_Name" readonly>
          </div>
       </td>
       <td>
          <div class="form-group">
            <label for="sa_Reason"> 신청사유 </label>
            <input type="text" class="form-control" id="sa_Reason" name="sa_Reason">
          </div>
          <input type="hidden" id="sa_State" name="sa_State" value="0">
       </td>
    </tr>
    <tr>
       <td colspan="2">
          <input id="btn" type="submit" id="addSubmit" value="신청하기" >
        </td>
     </tr>
  </table>
  </form>
</div>
</div>   
   
   <div id="companyfooter"><%@ include
         file="/WEB-INF/views/include/companyfooter.jsp"%>

   </div>

</body>
<script src="http://code.jquery.com/jquery-latest.js">
</script>
<script type="text/javascript">
   /* var sa_Name = $('#sa_Name').val(); //입력한 정류장 이름
   var sa_X = $('#sa_X').val(); //입력한 X값
   var sa_Y = $('#sa_Y').val(); //입력한 Y값
   var sa_Reason = $('#sa_Reason').val(); //입력한 신청사유 */
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
                  $("#checkSaName").text("사용중인 정류장 이름 입니다").css("color", "red");
               }
               //정류장 이름 중복 아닐시
               else {
                  $("#checkSaName").text("사용가능한 정류장 입니다").css("color", "blue");
               } 
            }, error : function(err) {
                  console.log("정류장 이름 검사 실패");
               }
            }); //ajax End
            
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
                     }
                     //정류장 위치 중복 아닐시      
                     else {
                        if(0 <= sa_X  && sa_X <= 33 && 0 <= sa_Y && sa_Y <= 33) {$("#t_Name").val("청학1동"); $("#checkSaPosition").text("사용가능한 정류장 위치 입니다"); $("#checkSaPosition").css("color", "blue");}
                        else if(34 <= sa_X && sa_X <= 66 && 0 <= sa_Y && sa_Y <= 33) {$("#t_Name").val("청학2동"); $("#checkSaPosition").text("사용가능한 정류장 위치 입니다"); $("#checkSaPosition").css("color", "blue");}                     
                        else if(67 <= sa_X && sa_X <= 100 && 0 <= sa_Y && sa_Y <= 33) {$("#t_Name").val("청학3동"); $("#checkSaPosition").text("사용가능한 정류장 위치 입니다"); $("#checkSaPosition").css("color", "blue");}
                        else if(0 <= sa_X && sa_X <= 33 && 34 <= sa_Y && sa_Y <= 66) {$("#t_Name").val("송도1동"); $("#checkSaPosition").text("사용가능한 정류장 위치 입니다"); $("#checkSaPosition").css("color", "blue");}
                        else if(34 <= sa_X && sa_X <= 66 && 34 <= sa_Y && sa_Y <= 66) {$("#t_Name").val("송도2동"); $("#checkSaPosition").text("사용가능한 정류장 위치 입니다"); $("#checkSaPosition").css("color", "blue");}
                        else if(67 <= sa_X && sa_X <= 100 && 34 <= sa_Y && sa_Y <= 66) {$("#t_Name").val("송도3동"); $("#checkSaPosition").text("사용가능한 정류장 위치 입니다"); $("#checkSaPosition").css("color", "blue");}
                        else if(0 <= sa_X && sa_X <= 33 && 67 <= sa_Y && sa_Y <= 100) {$("#t_Name").val("연수1동"); $("#checkSaPosition").text("사용가능한 정류장 위치 입니다"); $("#checkSaPosition").css("color", "blue");}
                        else if(34 <= sa_X && sa_X <= 66 && 67 <= sa_Y && sa_Y <= 100) {$("#t_Name").val("연수2동"); $("#checkSaPosition").text("사용가능한 정류장 위치 입니다"); $("#checkSaPosition").css("color", "blue");}
                        else if(67 <= sa_X && sa_X <= 100 && 67 <= sa_Y && sa_Y <= 100) {$("#t_Name").val("연수3동"); $("#checkSaPosition").text("사용가능한 정류장 위치 입니다"); $("#checkSaPosition").css("color", "blue");}
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
      $.ajax({
         url : '/company/checkSaPosition?',
         type : 'get',
         data : {'S_X' : sa_X, 'S_Y' : sa_Y},
         dataType : 'html',
         success : function(data) {      
               //정류장 위치 중복시
               if(data == "사용불가한 정류장 위치"){
                  $("#checkSaPosition").text("사용중인 정류장 위치 입니다");
                  $("#t_Name").val(""); $("#checkSaPosition").css("color", "red");
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
               }  
            }, error : function(err) {
                  console.log("정류장 위치 검사 실패");
            }
         }); //ajax End
      }); //blur End   



/*  function addNewStop(){
   alert('정류장 신청 완료');
}   */

//입력 안한값 체크
  function checkAll() {
   var sa_Name = $('#sa_Name').val(); //입력한 정류장 이름
   var sa_X = $('#sa_X').val(); //입력한 X값
   var sa_Y = $('#sa_Y').val(); //입력한 Y값
   var sa_Reason = $('#sa_Reason').val(); //입력한 신청사유 
   var checkPosition = $('#checkSaPosition').text();
   var checkName = $('#checkSaName').text();
   
    if(checkName == '사용중인 정류장 이름 입니다'){
    	alert('사용중인 정류장 이름 입니다');
        return false;
     } 
    if(checkPosition == '사용중인 정류장 위치 입니다'){
    	alert('사용중인 정류장 위치 입니다');
        return false;
     } 
     if(sa_Name == ''){
        alert('정류장 이름을 입력하세요');
        return false;
     }
     if(sa_X  == ''){
        alert('y값을 입력하세요');
        return false;
     }
     if(sa_Y  == ''){
        alert('y값을 입력하세요'); 
        return false;
     }
     if(sa_Reason == ''){
        alert('신청 사유를 입력하세요');
        return false;
     }
        return true;
     
 }  

</script>
</html>
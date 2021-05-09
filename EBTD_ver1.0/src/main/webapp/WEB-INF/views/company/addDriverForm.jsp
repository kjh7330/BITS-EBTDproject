<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>	
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
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

	<div class="insertData" style="color: black; text-align: center">
		<form action="/company/addDriver" method="post" enctype="multipart/form-data">
			회사 이름 : <input type="text" id="c_userName" name="c_userName" value="${sessionScope.c_username}" readonly><br> 
			기사 이름 : <input type="text" id="d_name" name="d_name"><br> 
			핸드폰 번호 : <input type="text" id="d_phoneNum" name="d_phoneNum" maxlength="13" placeholder="숫자만 입력"><br>
			입사일 : <input type=date id="d_enterDate" name="d_enterDate"><br> 
			운행노선 : <select id="b_no" name="b_no">
			</select> <br> <input type="submit" value="추가하기" onClick=addDriver()>
		</form>
	</div>

	<div id="companyfooter"><%@ include
			file="/WEB-INF/views/include/companyfooter.jsp"%>

	</div>

</body>
<script src="http://code.jquery.com/jquery-latest.js">
</script>
<script type="text/javascript">
/* //이미지 첨부시
$('#d_imgExtention').on('change', function(){
	
	console.dir(this); //file객체
	console.dir(this.value); //선택된 file명
	if($(this).val()==''){ //파일취소 클릭
		//console.log('empty');
		$('#fileCheck').val(0); //파일 첨부 안됨
	}else{
		//console.log('not empty');
		$('#fileCheck').val(1); //파일 첨부됨
	}
	console.log($('#fileCheck').val()); //첨부되면 1 안되면 0
});


//이미지 파일 첨부 취소
$('#reset').on('click', function(){
	//console.log('reset');
	$('#fileCheck').val(0);

});
 */


//핸드폰번호 입력시 자동으로 하이픈 입력
$('#d_phoneNum').keydown(function(event) {
    var key = event.charCode || event.keyCode || 0;
    $text = $(this);
    if (key !== 8 && key !== 9) {
        if ($text.val().length === 3) {
            $text.val($text.val() + '-');
        }
        if ($text.val().length === 8) {
            $text.val($text.val() + '-');
        }
    }
 
    return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));          
});

var bList
$(document).ready(function() { 
	$.ajax({
			url : '/company/getCompanyBusList?C_USERNAME=' + "${sessionScope.c_username}",
			type : 'get',
			dataType : 'json',
			success : function(data) {		
					console.log("운행노선 가져오기 성공");
					bList = data;
					//console.log(bList.length);
					//console.log(bList[1].b_NO);
					var html = '';
					 for(let i = 0 ; i<bList.length; i++){
						 html += "<option value = '"+bList[i].b_NO+"'>"+bList[i].b_NO+"</option>";
						};
						$("#b_no").append(html);
					}, error : function(err) {
							console.log("운행노선 가져오기 실패");
						}
					}); //ajax End

			}); //ready End 
				
//'추가하기' 버튼 클릭시
function addDriver(){
	alert('기사 추가 완료');
} 
</script>
</html>
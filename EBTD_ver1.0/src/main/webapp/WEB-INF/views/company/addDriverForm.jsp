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
사진 : <input type="file" id="d_imgExtention" name="d_imgExtention">
		<input type="reset" id="reset" value="파일선택 취소"><br>
		<input type="hidden" id="fileCheck" name="fileCheck" value="0">
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

//이미지 첨부시
$('#d_imgExtention').on('change', function(){
	
	console.dir(this); //file객체
	console.dir(this.value); //선택된 file명
	if($(this).val()==''){ //파일취소 클릭
		console.log('empty');
		$('#fileCheck').val(0); //파일 첨부 안됨
	}else{
		console.log('not empty');
		$('#fileCheck').val(1); //파일 첨부됨
	}
	console.log($('#fileCheck').val()); //첨부되면 1 안되면 0
});

// 이미지 파일 첨부 취소
$('#reset').on('click', function(){
	console.log('reset');
	$('#fileCheck').val(0);
});
// '추가하기' 버튼 클릭시
function addDriver(){
	alert('기사 추가 완료');
} 
</script>
</html>
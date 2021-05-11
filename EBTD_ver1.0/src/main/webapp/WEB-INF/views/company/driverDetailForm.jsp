<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사 - 기사 관리</title>
<style type="text/css">
.main-container {
	position: absolute;
	left: 50%;
	transform: translate(-50%, 42%);
	color: black;
	width: 800px;
	text-align: center;
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

#maintable {
	font-size: 18px;
}

#btn {
	text-align: center;
	background-color: lightgray;
	border-radius: 8px;
	border: none;
	margin: 10px;
	width: 100px;
	height: 40px;
	font-size: 18px;
}
#btn:hover {
	background-color: gray;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<body>
	<div id="companyheader"><%@ include
			file="/WEB-INF/views/include/companyheader.jsp"%>
	</div>
<div class="main-container"><br>
	<div><input class="maininput" value="기사 정보 수정" readonly></div>
<form action="/company/updateDriver" method="post">
<div style="color: black">
	<table id="maintable" class="table table-striped" style="color: black">
		<thead>
			<tr>
				<th>기사 번호</th>
				<!-- <th>회사 이름</th> -->
				<th>기사 이름</th>
				<th>전화번호</th>
				<!-- <th>입사일</th>  -->
				<th>노선번호</th>
			</tr>
			
		</thead>
		<tbody id="driverDetail">
		</tbody>
	</table>
	
	<input id="btn" type="submit" value="수정완료">

	</div>
  </form>
</div>
 
	<div id="companyfooter"><%@ include
			file="/WEB-INF/views/include/companyfooter.jsp"%>

	</div>
</body>
<script src="http://code.jquery.com/jquery-latest.js">
</script>
<script type="text/javascript">
let rBean = ${rBean};
var html = '';
console.log(rBean);

//기사 상세정보 가져오기
	 html += '<tr>';
	 html += '<td>'+rBean.d_no+'</td>';
	 html += '<td>'+rBean.d_name+'</td>';
	 html += "<td><input type='text' id='d_phoneNum' name='d_phoneNum' value='"+rBean.d_phoneNum+"' maxlength=13 >"+"</td>";
	 /* html += '<td>'+rBean.d_enterDate+'</td>'; */
	 html += "<td><select id='b_no' name='b_no'>"+'</select></td>';
	 html += "<td><input type='hidden' id='d_no' name='d_no' value='"+rBean.d_no+"' readonly/>"+"</td>";
	 //html += "<td><select><option value='"+rBean.b_no+"'>"+"</option></select></td>";
	 html += '</tr>';
	
 $("#driverDetail").empty();
 $("#driverDetail").append(html);

//회사 운행노선 가져오기
  $(document).ready(function() { 
		$.ajax({
				url : '/company/getCompanyBusList?C_USERNAME=' + "${sessionScope.c_username}",
				type : 'get',
				dataType : 'json',
				success : function(data) {		
						console.log("운행노선 가져오기 성공");
						bList = data;
						var html = '';
						 for(let i = 0 ; i<bList.length; i++){
							 html += "<option  value = '"+bList[i].b_NO+"'>"+bList[i].b_NO+"</option>";
							};
							$("#b_no").append(html);
							console.log(bList[i].b_NO);
						}, error : function(err) {
								console.log("운행노선 가져오기 실패");
							}
						}); //ajax End

				}); //ready End  
//핸드폰번호 칸 클릭시 칸 비우기
$('#d_phoneNum').on('click', function(){
	$('#d_phoneNum').val('');
});
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

//기사 삭제
/*  $("#deleteDriver").click(function(){
        
        if(confirm("삭제 하시겠습니까?")){
   
        }
 } */
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="resources/js/jquery.serializeObject.js"></script>
<style>
/*   모달css랑 스크립트, 버튼html 복사해서 쓰세요~!   */
/*   스크립트는 맨 아래쪽에 있음   */
/*   모달 버튼은 스크립트 위에 있음   */
/* modal trigger */
button {
	border: none;
	font-size: 10px;
	background: #f44336;
	color: #f9f9f9;
	padding: 8px 16px;
}

h2 {
	padding: 20px 0;
}

body {
	text-align: center;
}

/* modal overlay */
#overlay {
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.4);
	position: fixed;
	top: 0;
	left: 0;
	z-index: 1;
	visibility: hidden;
	opacity: 0;
	transition: all 0.5s ease;
	color : black;
}

/* modal box */
.modal {
	width: 80%;
	background: #f5f5f5;
	margin: 150px auto;
}

.modal_header {
	width: 100%;
	position: relative;
}

.modal_header h3 {
	padding: 20px 0;
	color: #333;
}

.modal_content {
	width: 100%;
	background: #fefefe;
	border: 1px solid #888;
	box-sizing: border-box;
	height: 200px;
}

.modal_footer {
	position: absolute;
	bottom: 0;
	width: 100%;
	padding: 10px 0;
	font-size: 14px;
}

.close {
	position: absolute;
	top: 10px;
	right: 20px;
	font-size: 28px;
	color: #aaa;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	cursor: pointer;
}
/*   모달css여기까지~!   */
</style>
<body>
<div id="adminheader"><%@ include
			file="/WEB-INF/views/include/companyheader.jsp"%>
	</div>
	<table style = "color : black;">
			<thead>
			<tr>
				<th>문의 번호</th>
				<th>노선 번호</th>
				<th>고객 ID</th>
				<th>제목</th>
				<th>작성 일시</th>
			</tr>
			</thead>
			<tbody id="vocList">
			</tbody>
		</table>
	
	<button class="myBtn">답글 달기</button>
	<div id="overlay">
		<div id="myModal" class="modal">
			<div class="modal_header">
				<p style="color: black; text-align: center;">답변 달기 창</p>
				<span class="close">&times;</span>
			</div>
			<div class="modal_content" style="text-align: center;">
				문의번호:<input id = "vocNum"> <br/>
				문의 버스노선:<input id = "vocBusNum"> <br/> 
				제목:<input id = "vocTitle"> <br/>
				문의자:<input id = "vocUserName"> 
				문의 일시:<input id = "vocDate"> <br/>
				내용:
				<input id = "vocContent">
			</div>
			<form id = "reply" action="/company/user/addReply" method = "post">
			<input type = "hidden" id = "replystate" name = "voc_recommend" value = 0>
			<input type = "hidden" id = "replyUserName" name = "u_username">
			<input type = "hidden" id = "replyCompanyName" name = "c_username">
			<!-- 위에는 히든처리 -->
			답변번호:<input type = "text" id = "replyNum" name = "a_no">
			노선번호:<input type = "text" id = "replyBusNum" name = "b_no">
			제목: <input type = "text" id = "replyTitle" name = "v_title">
			내용: <input type = "text" id = "replyContent" name = "v_content">
			<input type = "submit" id = "replySubmit" value = "전송">
			</form>
			<div class="modal_footer">
			</div>
		</div>
	</div>
	<!--    모달 버튼 끝!    -->
	
	<div id="adminfooter"><%@ include
			file="/WEB-INF/views/include/companyfooter.jsp"%>

	</div>

</body>
<script type="text/javascript">
//var vList = ${vLsit}; 
console.log(${vList});
let tx = '';
	for(var i=0; i<${vList}.length; i++) {
		tx = "<tr id = 'voc"+i+"'>";
		tx += '<td>'+${vList}[i].v_no+'</td>';
		tx += '<td>'+${vList}[i].b_no+'</td>';
		tx += '<td>'+${vList}[i].u_username+'</td>';
		tx += '<td>'+${vList}[i].v_title+'</td>';
		tx += '<td>'+${vList}[i].v_date+'</td>';
		tx += "<td><button class = 'myBtn'>답글달기</button></td></tr>";
		$('#vocList').append(tx);
	};

//모달창 열기 이벤트
$(".myBtn").on("click", function(){
	var vNum = $(this).parent().parent().children().eq(0).html();
	for(var i=0; i < ${vList}.length; i++) {
		if(${vList}[i].v_no == vNum) {
			$('#vocNum').val(${vList}[i].v_no);
			$('#vocTitle').val(${vList}[i].v_title);
			$('#vocBusNum').val(${vList}[i].b_no);
			$('#vocUserName').val(${vList}[i].u_username);
			$('#vocContent').val(${vList}[i].v_content);
			$('#vocDate').val(${vList}[i].v_date);
			$('#replyUserName').val(${vList}[i].u_username);
			$('#replyCompanyName').val(${vList}[i].c_username);
			$('#replyNum').val(${vList}[i].v_no + 1);
			$('#replyBusNum').val(${vList}[i].b_no);
			$('#replyTitle').val("↳"+${vList}[i].v_title+"에 대한 답변");
		};
	};
	/* var bNum = $(this).parent().parent().children().eq(1).html();
	var uName = $(this).parent().parent().children().eq(2).html();
	var vTitle = $(this).parent().parent().children().eq(3).html(); */
	
	$("#overlay").css({ visibility:"visible", opacity:1 });
	$("#myModal").css({ display: "inline"});
  }); 

  // 모달창 닫기 이벤트 
  $(".close").on("click", function(){
          $("#overlay").css({ visibility:"hidden", opacity:0 });
  });

 $(document).on("click", function(e){  
    if( $("#overlay").is(e.target) ) {
        $("#overlay").css({ visibility:"hidden", opacity:0 });
    }
  });

  // esc 누를시 모달창 닫기
  $(document).keydown(function(event) {
    if ( event.keyCode == 27 || event.which == 27 ) {
        $("#overlay").css({ visibility:"hidden", opacity:0 });
    }
});

</script>
</html>
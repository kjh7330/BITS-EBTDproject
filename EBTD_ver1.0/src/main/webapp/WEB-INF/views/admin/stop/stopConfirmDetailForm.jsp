<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
	#main-container{
		position: absolute;
		left: 50%;
		transform: translate(-50%,34%);
		color: black;
		width: 800px;
		text-align: center;
	}
	#confirmtitle{
		border: none;
        border-radius: 8px;
        text-align: center;
        width: 600px;
        background-color: pink;
        height: 50px;
        font-weight: bold;
        font-size: 20px;
	}
	#table1{
        margin-top: 5px;
		width: 600px;
		height: 400px;
		color: black;
		border: 1px solid black;
		margin-left:auto;
		margin-right:auto;
		font-size: 18px;
	}
	.jbtn{
        text-align: center;
        background-color: lightgray;
        border-radius: 8px;
        border: none;
        margin: 10px;
        width: 100px;
        height: 40px;
	}
    .jbtn:hover{
      	background-color: gray;
    }
	/*   모달 CSS   */
        /* reset */
        h2, p, div, h3 { margin:0; padding:0 }

        /* modal trigger */
        .modal_content2 input { border:none; 
                    font-size:15px; 
                    background:#f44336;
                    color:#f9f9f9; 
                    padding:8px 16px; }
        .modal_content3 input { border:none; 
                    font-size:18px; 
                    background:#f44336;
                    color:#f9f9f9; 
                    padding:8px 16px; }
        h2 { padding:20px 0; }
        body { text-align:center; }

        /* modal overlay */
        #overlay, #overlay2, #overlay3 { width:100%; 
                    height:100%; 
                    background:rgba(0,0,0,0.4);
                    position:fixed;
                    top:0; left:0; 
                    z-index:110; 
                    visibility:hidden; 
                    opacity:0;   
                    transition:all 0.5s ease;
                    }

        /* modal box */
        .modal { width:80%; 
                    background:#f5f5f5; 
                    margin:150px auto; }
        .modal_header { width:100%; position:relative; }
        .modal_content { width:100%; 
                                background:#fefefe;
                                border:1px solid #888; 
                                box-sizing:border-box;
                                height:585px;  }
        .modal_content4 { width:473px; 
                                background:#fefefe;
                                border:1px solid #888; 
                                box-sizing:border-box;
                                margin-left:10px;
                                height:auto;  }
        .modal_content2, .modal_content3 { width:100%; 
                                background:#fefefe;
                                border:1px solid #888; 
                                box-sizing:border-box;
                                height:425px;
                                text-align: center;  }
        .modal_footer { width:100%; 
                        padding:10px 0; 
                        font-size:14px; }
        .close { position:absolute; 
                    top:0px; right:20px; 
                    font-size:28px;
                    color:#aaa;
                    font-weight:bold;   }
        .close:hover, .close:focus {
                    color:#000; 
                    cursor:pointer; 
        }
        #myModal{
        	position: absolute;
			top:50%;
			left:50%;
			transform: translate(-50%,-73%);
			width: 500px;
			height: 670px;
			color: black;
    	}
    	#myModal2, #myModal3{
        	position: absolute;
			top:50%;
			left:50%;
			transform: translate(-50%,-110%);
			width: 300px;
			height: 250px;
			color: black;
    	}
    	.modal_table{
    		width: 450px;
    		margin-left: 15px;
    		font-size: 10px;
    	}

    	.modal_table3{
    		width: 450px;
    		margin-left: 15px;
    		text-align: center;
    		font-size: 15px;
    	}
/*   모달css여기까지~!   */

</style>
</head>

<body>
<div id="adminheader"><%@ include file="/WEB-INF/views/include/adminheader.jsp" %></div>
<div id="main-container">
	<input type="text" id="confirmtitle" value="정류장 신청 상세"><br><br>
	<table id="table1">
		<tr>
			<td>신청회사</td><td>${saList[0].c_UserName}</td>
		</tr>
		<tr>
			<td>정류장 이름</td><td>${saList[0].sa_Name}</td>
		</tr>
		<tr>
			<td>위치</td><td>( ${saList[0].sa_X}, ${saList[0].sa_Y} )</td>
		</tr>
		<tr>
			<td>동 이름</td><td>${saList[0].t_Name}</td>
		</tr>
		<tr>
			<td>신청일</td><td id="date">${saList[0].sa_Date}</td>
		</tr>
		<tr>
			<td>상태</td><td>${saList[0].sa_State}</td>
		</tr>
		<tr>
			<td colspan="2">
				<input id="myBtn" type="button" class="jbtn" value="공문보기">
				<input id="myBtn2" type="button" class="jbtn" value="승인">
				<input id="myBtn3"  type="button" class="jbtn" value="반려">
			</td>
		</tr>
	</table>
	<br>
</div> 
<div id="overlay">
       <div id="myModal" class="modal">
          <div class="modal_header">
             <h5 style="margin-top:5px; margin-left:10px; text-align: center;">정류장 등록 신청 공문서</h5>
             <span class="close">&times;</span>
          </div>
          <div class="modal_content">
             <p style="color:black;">
             <table class="modal_table3">
             	<tr>
             		<td>(주) ${saList[0].c_UserName}</td>
             	</tr>
             	</table><br>
             	<table class="modal_table" style="font-weight: bold;">
	        	    <tr>
	        	    	<td>수신</td><td>BITS(Better Ideas To Society)</td>
	        	    </tr>
	        	    <tr>
	        	    	<td colspan="2">(경유)</td>
	        	    </tr>
	        	    <tr>
	        	    	<td>제목</td><td>새로운 정류장 신청</td>
	        	    </tr>
	        	    <tr>
	        	    	<td colspan="2"><hr size="3" noshade></hr></td>
	        	    </tr>
	        	    <tr>
	        	    	<td colspan="2">1. 귀 사의 무궁한 발전을 기원합니다.</td>
	        	    </tr>
	        	    <tr>
	        	    	<td colspan="2">2. 정류장 등록을 아래와 같이 신청하오니 검토하여 주시기 바랍니다.</td>
	        	    </tr>
	        	    <tr>
	        	    	<td>3. 신청내용</td>
	        	    </tr>
	        	    <tr>
	        	    	<td> - 신청 번호 : ${saList[0].sa_No}</td>
	        	    	<td> - 신청일 : ${saList[0].sa_Date}</td>
	        		</tr>
             		<tr>
	                	<td> - 회사 이름 : ${saList[0].c_UserName}</td>
	                	<td> - 동 이름 : ${saList[0].t_Name}</td>
	                </tr>
	                <tr>
		                <td> - 정류장 이름 : ${saList[0].sa_Name}</td>
	                	<td> - 위치 : ( ${saList[0].sa_X}, ${saList[0].sa_Y} )</td>
	                </tr>
	        		<tr>
	        			<td colspan="2"> - 신청 사유: ${saList[0].sa_Reason}</td>
	        		</tr>

               	</table><br>
               	<table class="modal_table">
           			<tr>
						<td>붙임</td><td colspan="3">1. 사업자등록증 사본 1부(별송) 끝.</td>
					</tr>
				</table>
               	<table class="modal_table3">
					<tr>
	        	    	<td colspan="2"><hr size="3" noshade></hr></td>
	        	    </tr>
					<tr>
						<td>주식회사 ${saList[0].c_UserName} 대표이사</td>
					</tr>
				</table>
          </div>
          <div class="modal_footer">
             <p style="color:black; text-align: center;">Better Ideas To Society</p>
          </div>
       </div>
    </div>

        
        
        <div id="overlay2">
          <div id="myModal2" class="modal">
             <div class="modal_header">
                <h5 style="margin-left:10px;margin-top:5px;">정류장 신청 - 승인하기</h5>
                <span class="close">&times;</span>
             </div>
             <div class="modal_content2">
             	<p style="color:black;"><br>
             		<form action="setStopRequestApproval" method="post">
		               ${saList[0].sa_Name}(${saList[0].c_UserName})<br>
		                를 승인하시겠습니까?<br><br>
		                <input type="hidden" name="sa_No" value="${saList[0].sa_No}">
		                <input type="hidden" name="sa_X" value="${saList[0].sa_X}">
		                <input type="hidden" name="sa_Y" value="${saList[0].sa_Y}">
		                <input type="hidden" name="sa_Name" value="${saList[0].sa_Name}">
		                <input type="hidden" name="t_Name" value="${saList[0].t_Name}">
		                <input type="hidden" name="c_UserName" value="${saList[0].c_UserName}">            
		        	    <input type="submit" value="승인">
		        	    <input class="cancle" type="button" value="취소">
               		</form>
             	</p>
             </div>
             <div class="modal_footer">
               <p style="color:black;">Better Ideas To Society</p>
             </div>
          </div>
        </div>
        
        
        <div id="overlay3">
          <div id="myModal3" class="modal">
             <div class="modal_header">
                <h5 style="margin-left:10px;margin-top:5px;">정류장 신청 - 반려하기</h5>
                <span class="close">&times;</span>
             </div>
             <div class="modal_content3">
             	<p style="color:black;"><br>
             		<form action="setStopRequestReject" method="get">
		                ${saList[0].sa_Name}(${saList[0].c_UserName})<br>
		                신청을 반려하시겠습니까?<br><br>
		        	    <input type="hidden" name="sa_No" value="${saList[0].sa_No}">
		        	    <input type="submit" value="반려">
		        	    <input class="cancle" type="button" value="취소">
               		</form>
             	</p>
             </div>
             <div class="modal_footer">
               <p style="color:black;">Better Ideas To Society</p>
             </div>
          </div>
        </div>
<div id="adminfooter"><%@ include file="/WEB-INF/views/include/adminfooter.jsp" %></div>
</body>

<script>

// 모달창 열기 이벤트
$("#myBtn").on("click", function(){
        $("#overlay").css({ visibility:"visible", opacity:1 });
        $("#myModal").css({ display: "inline"});
});
$("#myBtn2").on("click", function(){
        $("#overlay2").css({ visibility:"visible", opacity:1 });
        $("#myModal2").css({ display: "inline"});
});
$("#myBtn3").on("click", function(){
        $("#overlay3").css({ visibility:"visible", opacity:1 });
        $("#myModal3").css({ display: "inline"});
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
	$(".close").on("click", function(){
  	$("#overlay2").css({ visibility:"hidden", opacity:0 });
	});
	$(".cancle").on("click", function(){
  	$("#overlay2").css({ visibility:"hidden", opacity:0 });
	});
	$(document).on("click", function(e){  
		if( $("#overlay2").is(e.target) ) {
	    	$("#overlay2").css({ visibility:"hidden", opacity:0 });
		}
	});
	$(".close").on("click", function(){
		$("#overlay3").css({ visibility:"hidden", opacity:0 });
	});
	$(".cancle").on("click", function(){
  	$("#overlay3").css({ visibility:"hidden", opacity:0 });
	});
	$(document).on("click", function(e){  
		if( $("#overlay3").is(e.target) ) {
	  		$("#overlay3").css({ visibility:"hidden", opacity:0 });
		}
	});


// esc 누를시 모달창 닫기
	$(document).keydown(function(event) {
		if ( event.keyCode == 27 || event.which == 27 ) {
		  $("#overlay").css({ visibility:"hidden", opacity:0 });
  	}
	});
	$(document).keydown(function(event) {
		if ( event.keyCode == 27 || event.which == 27 ) {
		  $("#overlay2").css({ visibility:"hidden", opacity:0 });
  	}
	});
	$(document).keydown(function(event) {
		if ( event.keyCode == 27 || event.which == 27 ) {
		  $("#overlay3").css({ visibility:"hidden", opacity:0 });
  	}
	});

</script>
</html>
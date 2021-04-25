<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"   %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사 관리 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>

/*   모달 CSS   */
        /* reset */
        .company-body { height:100%; }
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
        #overlay, #overlay2, #overlay3, #overlay4 { width:100%; 
                    height:100%; 
                    background:rgba(0,0,0,0.4);
                    position:fixed;
                    top:0; left:0; 
                    z-index:1; 
                    visibility:hidden; 
                    opacity:0;   
                    transition:all 0.5s ease;
                    }

        /* modal box */
        .modal { width:80%; 
                    background:#f5f5f5; 
                    margin:150px auto; }
        .modal_header { width:100%; position:relative; }
        .modal_header h3 { padding:20px 0; color:#333; }
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
    	#myModal4{
        	position: absolute;
			top:50%;
			left:50%;
			transform: translate(-50%,-73%);
			width: 500px;
			height: 670px;
			color: black;
			overflow:scroll;
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
    	.modal_table2{
    		width: 450px;
    		font-weight:bold; 
    		font-size: 10px;
    		text-align: left;
    	}
    	.modal_table3{
    		width: 450px;
    		margin-left: 15px;
    		text-align: center;
    		font-size: 15px;
    	}
/*   모달css여기까지~!   */

    	.company-container{
    		position: absolute;
            width: 600px;
            color: black;
            left: 50%;
            transform: translate(-50%,10%);
        }
        .cdate{
            text-align: right;
        }
        .cname{
            text-align: center;
            width: 100%;
            margin-bottom: 10px;
            background-color: #f9eb99;
            height: 50px;
            font-weight: bold;
        }
        .cdetail{
            text-align: center;
            width: 100%;
            border: 1px solid black;
        }
        .cdetail-content{
            text-align: center;
        	border: none;
        }
        .cdetail-content:focus{
			outline:none;
        }
        .cdetail-content input{
        	text-align: center;
        }
        .cdetail-btn{
            text-align: center;
            background-color: lightgray;
            border-radius: 8px;
            border: none;
            margin: 10px;
            width: 100px;
            height: 40px;
        }
        .cdetail-btn:hover{
        	background-color: gray;
        }
        .cdetail-btn2{
            text-align: center;
            background-color: lightgray;
            border-radius: 8px;
            border: none;
            margin: 10px;
            width: 450px;
            height: 30px;
        }
        .cdetail-btn2:hover{
        	background-color: gray;
        }
        .cdetail-btn10{
            text-align: center;
            background-color: ligthgray;
            border-radius: 8px;
            border: none;
            width: 150px;
            height: 30px;
        }
        .cdetail-btn10:hover{
        	background-color: #f9eb99;
        }
		.busnumber{
			width:80px;
			border: none;
			font-weight: bold;
		}
		.busnumber:focus{
			border: none;
			
		}
    </style>
</head>
<body>
<div id="adminheader"><%@ include file="/WEB-INF/views/include/adminheader.jsp" %></div>
<div class="company-body">
    <div class="company-container">
        <div class="cdate">신청일 : ${abList[0].ap_date}</div>
        <input class="cname" type="text" value="${abList[0].c_name}의 신청 상세보기" readonly>
        <table class="cdetail">
        	<tr>
        		<td>
        			<div class="cdetail-content"><br>
        			<table style="margin-left: 190px;">
        				<tr>
        					<td>신청 번호 : </td><td>${abList[0].ap_no}</td>
        				</tr>
        				<tr>
        					<td>회사 이름 : </td><td>${abList[0].c_name}</td>
        				</tr>
        				<tr>
        					<td>버스 번호 : </td><td><button id="myBtn10" class="cdetail-btn10">노선상세보기</button></td>
        				</tr>
        					<c:forEach var="abr" items="${abrList}">
        				<tr>
        					<td><input class="busnumber" value=" - " readonly></td>
        					<td><input class="busnumber" value="${abr.ap_b_no}" readonly></td>
        				</tr>
        					</c:forEach>
        				<tr>
        					<td>승인 상태 : </td><td>미승인</td>
        				</tr>
        			</table>
        			</div>
        		</td>
			</tr>
			<tr>
			    <td>
                	<button id="myBtn" class="cdetail-btn">공문보기</button>
                	<button id="myBtn2" class="cdetail-btn">승인</button>
                	<button id="myBtn3" class="cdetail-btn">반려</button>
				</td>
			</tr>
        </table>
    </div>
<!--    모달 버튼 가져가세요~!     -->

    <div id="overlay">
       <div id="myModal" class="modal">
          <div class="modal_header">
             <h5 style="margin-top:5px; margin-left:10px;">${abList[0].c_name} - 등록 신청 공문서</h5>
             <span class="close">&times;</span>
          </div>
          <div class="modal_content">
             <p style="color:black;">
             <table class="modal_table3">
             	<tr>
             		<td>(주) ${abList[0].c_name}</td>
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
	        	    	<td>제목</td><td>EBTD 사용 승인 신청</td>
	        	    </tr>
	        	    <tr>
	        	    	<td colspan="2"><hr size="3" noshade></hr></td>
	        	    </tr>
	        	    <tr>
	        	    	<td colspan="2">1. 귀 사의 무궁한 발전을 기원합니다.</td>
	        	    </tr>
	        	    <tr>
	        	    	<td colspan="2">2. 「EBTD (Efficient bus transfer system for disabled)」의 사용 등록을 아래와 같이 신청하오니 승인하여 주시기 바랍니다.</td>
	        	    </tr>
	        	    <tr>
	        	    	<td>3. 신청내용</td>
	        	    </tr>
	        	    <tr>
	        	    	<td> - 신청 번호 : ${abList[0].ap_no}</td>
	        	    	<td> - 신청일 : ${abList[0].ap_date}</td>
	        		</tr>
             		<tr>
	                	<td> - 회사 이름 : ${abList[0].c_name}</td>
	                	<td> - 사업장 등록 번호 : ${abList[0].c_no}</td>
	                </tr>
	                <tr>
	                	<td colspan="2"> - 신청 아이디 : ${abList[0].c_username}</td>
	                </tr>
	        		<tr>
	        			<td colspan="2"> - 버스 번호: </td>
	        		</tr>
               	</table>
				<table class="modal_table2">
					<c:forEach var="abr" items="${abrList}">
					<tr>
						<td>
							<input class="busnumber" value=" - " style="text-align: right" readonly>
							<input class="busnumber" value="${abr.ap_b_no}" readonly>
								
       					</td>
					</tr>
        			</c:forEach>
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
						<td>주식회사 ${abList[0].c_name} 대표이사</td>
					</tr>
				</table>
             </p>
          </div>
          <div class="modal_footer">
             <p style="color:black; text-align: center;">Better Ideas To Society</p>
          </div>
       </div>
    </div>
        
        
        
    <div id="overlay4">
          <div id="myModal4" class="modal">
             <div class="modal_header">
                <h5 style="margin-top:5px; margin-left:10px;">${abList[0].c_name} - 등록 신청 공문서 (노선) </h5>
                <span class="close">&times;</span>
             </div>
             <div class="modal_content4">
             	<p style="color:black;">
             		<table class="modal_table" style="font-weight: bold;">
	        			<tr>
							<table class="modal_table2" style="text-align: center">
								<tr>
									<td>버스 번호</td>
									<td>정류장 순서</td>
									<td>정류장 번호</td>
									<td>정류장 이름</td>
									<td>동 이름</td>
								</tr>
			 			        <c:forEach var="ab" items="${abList}">
								<tr>
									<td>${ab.ap_b_no}</td>
									<td>${ab.apde_turn}</td>
									<td>${ab.s_no}</td>
									<td>${ab.s_name}</td>
									<td>${ab.t_name}</td>
								</tr>
		           				</c:forEach>			
							</table>
	        			</tr>
               		</table>
             	</p>
             </div>
             <div class="modal_footer">
               <p style="color:black; text-align: center; ">Better Ideas To Society</p>
             </div>
          </div>
        </div>
        
        
        <div id="overlay2">
          <div id="myModal2" class="modal">
             <div class="modal_header">
                <h5 style="margin-left:10px;margin-top:5px;">${abList[0].c_name} - 승인하기</h5>
                <span class="close">&times;</span>
             </div>
             <div class="modal_content2">
             	<p style="color:black;"><br>
             		<form action="setCompanyRequestApproval" method="post">
		                ${abList[0].c_name}(${abList[0].c_username})<br>
		                를 승인하시겠습니까?<br><br>
		                <input type="hidden" name="c_name" value="${abList[0].c_name}">
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
                <h5 style="margin-left:10px;margin-top:5px;">${abList[0].c_name} - 반려하기</h5>
                <span class="close">&times;</span>
             </div>
             <div class="modal_content3">
             	<p style="color:black;"><br>
             		<form action="setCompanyRequestReject" method="post">
		                ${abList[0].c_name}(${abList[0].c_username})<br>
		                를 반려하시겠습니까?<br><br>
		        	    <input type="hidden" name="c_username" value="${abList[0].c_username}">
		        	    <input type="submit" value="반려">
		        	    <input class="cancle" type="button" value="취소"><br>
		        	    <a style="font-size: 10px;">⚠️데이터가 삭제됩니다⚠️</a>
               		</form>
             	</p>
             </div>
             <div class="modal_footer">
               <p style="color:black;">Better Ideas To Society</p>
             </div>
          </div>
        </div>
        
<!--    모달 버튼 끝!    -->
</div>
<div id="adminfooter"><%@ include file="/WEB-INF/views/include/adminfooter.jsp" %></div>
<script src="http://code.jquery.com/jquery-latest.js"></script>
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
  $("#myBtn10").on("click", function(){
      $("#overlay4").css({ visibility:"visible", opacity:1 });
      $("#myModal4").css({ display: "inline"});
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
	$(".close").on("click", function(){
		$("#overlay4").css({ visibility:"hidden", opacity:0 });
	});
	$(document).on("click", function(e){  
		if( $("#overlay4").is(e.target) ) {
	  		$("#overlay4").css({ visibility:"hidden", opacity:0 });
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
	$(document).keydown(function(event) {
		if ( event.keyCode == 27 || event.which == 27 ) {
		  $("#overlay4").css({ visibility:"hidden", opacity:0 });
    	}
	});
</script>
<!--     모달 스크립트 여기까지~!     -->
</body>
</html>
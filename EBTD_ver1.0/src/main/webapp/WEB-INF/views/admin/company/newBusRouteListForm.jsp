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
        .approval, .reject{
        	border:none;
        	text-align: center;
        	width: 100px;
        }
        #mcbtn1, #mcbtn2{ border:none; 
                    font-size:15px; 
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
    	.modal_table7, .modal_table, .modal_table8, .modal_table0{
    		width: 450px;
    		margin-left: 15px;
    		font-size: 10px;
    	}
    	.modal_table21, .modal_table22{
    		width: 450px;
    		font-weight:bold; 
    		font-size: 10px;
    		text-align: left;
    	}
    	.modal_table31, .modal_table32{
    		width: 450px;
    		margin-left: 15px;
    		text-align: center;
    		font-size: 15px;
    	}
/*   모달css여기까지~!   */

    	.company-container{
    		position: absolute;
            width: 800px;
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
        }
        .cdetail-btn30, .cdetail-btn40{
            text-align: center;
            background-color: #f5efd1;
            border-radius: 8px;
            border: none;
            width: 100px;
            height: 30px;
        }
        .cdetail-btn30:hover{
        	background-color: pink;
        }
        .cdetail-btn40:hover{
        	background-color: pink;
        }
        .cdetail-btn2{
            text-align: center;
            background-color: ligthgray;
            border-radius: 8px;
            border: none;
            margin: 10px;
            width: 450px;
            height: 30px;
        }
        .cdetail-btn2:hover{
        	background-color: gray;
        }
        .cdetail-btn10, .cdetail-btn20{
            text-align: center;
            background-color: ligthgray;
            border-radius: 8px;
            border: none;
            width: 100px;
            height: 30px;
        }
        .cdetail-btn10:hover{
        	background-color: #f9eb99;
        }
        .cdetail-btn20:hover{
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
		.nameinput{
			width: 150px;
			text-align: center;
			border: none;
		}
		.nameinput:focus{
			outline:none;
		}
    </style>
</head>
<body>
<div id="adminheader"><%@ include file="/WEB-INF/views/include/adminheader.jsp" %></div>
<div class="company-body">
    <div class="company-container">
        <input class="cname" type="text" value="새로운 노선 등록리스트" readonly>
        <table class="cdetail">
        	<div>
        	<tr><td><br></td></tr>
			<c:forEach var="abn" items="${abnList}">
			<tr>
			    <td>
        			<input class="nameinput" value="${abn.c_name}">
        		</td>
        		<td>
        			<input class="nameinput" value="${abn.ap_b_no}">
        		</td>
        		<td>
        			<button id="myBtn${abn.ap_no}" class="cdetail-btn10">노선보기</button><!-- 신청번호를 넘겨! -->
        		</td>
        		<td>
        			<button id="myBtn1${abn.ap_no}" class="cdetail-btn20">공문보기</button><!-- 신청번호를 넘겨! -->
        		</td>
        		<td>
                	<button id="myBtn${abn.ap_b_no}" class="cdetail-btn30">승인</button>
                </td>
                <td>
                	<button id="myBtn${abn.ap_b_no}" class="cdetail-btn40">반려</button>
				</td>
			</tr>
			</c:forEach>
        	<tr><td><br></td></tr>
        	</div>
        </table>
    </div>
<!--    모달 버튼 가져가세요~!     -->

    <div id="overlay">
       <div id="myModal" class="modal">
          <div class="modal_header">
             <h5 class=".headerh5"style="margin-top:5px; margin-left:10px;">신규 노선 등록 신청 공문서</h5>
             <span class="close">&times;</span>
          </div>
          <div class="modal_content">
             <p style="color:black;">
             <table class="modal_table31">
             </table><br>
             	<table class="modal_table7" style="font-weight: bold;">
	        	    <tr>
	        	    	<td>수신</td><td>BITS(Better Ideas To Society)</td>
	        	    </tr>
	        	    <tr>
	        	    	<td colspan="2">(경유)</td>
	        	    </tr>
	        	    <tr>
	        	    	<td>제목</td><td>신규 노선 등록 승인 신청</td>
	        	    </tr>
	        	    <tr>
	        	    	<td colspan="2"><hr size="3" noshade></hr></td>
	        	    </tr>
	        	    <tr>
	        	    	<td colspan="2">1. 귀 사의 무궁한 발전을 기원합니다.</td>
	        	    </tr>
	        	    <tr>
	        	    	<td colspan="2">2. 「EBTD (Efficient bus transfer system for disabled)」의 신규 버스 등록을 아래와 같이 신청하오니 승인하여 주시기 바랍니다.</td>
	        	    </tr>
	        	    <tr>
	        	    	<td>3. 신청내용</td>
	        	    </tr>
               	</table>
               	<table class="modal_table8" style="font-weight: bold;">
               	</table>
				<table class="modal_table22"> <!-- 버스 번호가 들어가는 자리 -->
				</table><br>
				<table class="modal_table0">
           			<tr>
						<td>붙임</td><td colspan="3">1. 사업자등록증 사본 1부(별송) 끝.</td>
					</tr>
				</table>
				<table class="modal_table32">
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
             	${abndList}
             		<table class="modal_table" style="font-weight: bold;">
	        			<tr>
							<table class="modal_table21" style="text-align: center">
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
                <h5 style="margin-left:10px;margin-top:5px;">${abnList[0].c_name} - 승인하기</h5>
                <span class="close">&times;</span>
             </div>
             <div class="modal_content2">
             	<p style="color:black;"><br>
             		<form action="setCompanyRequestApproval" method="post">
		                <input type="text" class="approval" value="">번<br>
		                을 승인하시겠습니까?<br><br>
		                <input class="approval" type="hidden" name="ap_no" value="">
		        	    <input id="mcbtn1" type="submit" value="승인">
		        	    <input id="mcbtn2" class="cancle" type="button" value="취소">
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
                <h5 style="margin-left:10px;margin-top:5px;">${abnList[0].c_name} - 반려하기</h5>
                <span class="close">&times;</span>
             </div>
             <div class="modal_content3">
             	<p style="color:black;"><br>
             		<form action="setCompanyRequestReject" method="post">
		                <input type="text" class="reject" value="">번<br>
		                을 반려하시겠습니까?<br><br>
		        	    <input class="reject" type="hidden" name="ap_no" value="">
		        	    <input id="mcbtn1" type="submit" value="승인">
		        	    <input id="mcbtn2" class="cancle" type="button" value="취소">
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
		$(".cdetail-btn20").on("click", function() {
			$.ajax({
				type : 'get',
				url : 'getNewBusRouteDetail',
				dataType : 'json',
				data : {
					'ap_no' : $(this).attr('id').substring(6)
				},
				success : function(data) {
					console.log(data);
					$("#overlay").css({	visibility : "visible",	opacity : 1	});
					$("#myModal").css({	display : "inline"	});
					
					/*공문서 상단 회사이름 넣기*/
					$('.modal_table31').html('');
					let mt31 = '';
					mt31 += '<tr>';
					mt31 += '<td>(주)' + data[0]["c_name"] + '</td>';
					mt31 += '</tr>';
					$('.modal_table31').append(mt31);

					/*공문서 하단 회사이름 넣기*/
					$('.modal_table32').html('');
					let mt32 = '';
					mt32 += '<tr><td colspan="2"><hr size="3" noshade></hr></td></tr>';
					mt32 += '<tr>';
					mt32 += '<td>주식회사 ' + data[0]["c_name"] + ' 대표이사</td>';
					mt32 += '</tr>';
					$('.modal_table32').append(mt32);
					
					/*공문서 내용에 신청상세 넣기*/
					$('.modal_table8').html('');
					let mt = '';
					mt += '<tr>';
					mt += '<td> - 신청 번호 : ' + data[0]["ap_no"] + '</td>';
					mt += '<td> - 신청일 : ' + data[0]["ap_date"] + '</td>';
	        		mt += '</tr>';
	        		mt += '<tr>';
	        		mt += '<td> - 회사 이름 : ' + data[0]["c_name"] + '</td>';
	        		mt += '<td> - 사업장 등록 번호 : ' + data[0]["c_no"] + '</td>';
	        		mt += '</tr>';
	        		mt += '<tr>';
	        		mt += '<td colspan="2"> - 신청 아이디 : ' + data[0]["c_username"] + '</td>';
	        		mt += '</tr>';
	        		mt += '<tr>';
	        		mt += '<td colspan="2"> - 버스 번호: </td>';
	        		mt += '</tr>';
        			$('.modal_table8').append(mt);
        			
 					
				},
				error : function(err) {
					console.log(err,'@@@@');
		
				}

			});
			
			$.ajax({
				type : 'get',
				url : 'getNewBusNumber',
				dataType : 'json',
				data : {
					'ap_no' : $(this).attr('id').substring(5)
				},
				success : function(data) {
					console.log(data);
			
				/*버스 번호 넣기*/
				
				let mt2 = '';
				for(i in data){
					mt2 += '<tr><td>';
					mt2 += '<input class="busnumber" value=" - " style="text-align: right" readonly>';
					mt2 += '<input class="busnumber" value=" ' + data[i]["ap_b_no"] + '" readonly>';
					mt2 += '</td></tr>';
				}
				$('.modal_table22').append(mt2);
				
				}
			});
		}); 
			
			
		$(".cdetail-btn30").on("click", function() {
			let apno = $(this).attr('id').substring(5);
			
			$(".approval").val(apno);
			$("#overlay2").css({visibility : "visible",	opacity : 1	});
			$("#myModal2").css({display : "inline"});
		});
		$(".cdetail-btn40").on("click", function() {
			let apno = $(this).attr('id').substring(5);
			
			$(".reject").val(apno);
			$("#overlay3").css({visibility : "visible", opacity : 1	});
			$("#myModal3").css({display : "inline"});
		});
		$(".cdetail-btn10").on("click", function() {
			
			$.ajax({
				type : 'get',
				url : 'getNewBusRouteDetail',
				dataType : 'json',
				data : {
					'ap_no' : $(this).attr('id').substring(5)
				},
				success : function(data) {
					console.log(data);
					$("#overlay4").css({ visibility:"visible", opacity:1 });
					$("#myModal4").css({ display: "inline"});
					
					$('.modal_table21').html('');
					let tx = '';
					
					tx += '<tr>';
					tx += '<td>버스 번호</td>';
					tx += '<td>정류장 순서</td>';
					tx += '<td>정류장 번호</td>';
					tx += '<td>정류장 이름</td>';
					tx += '<td>동 이름</td>';
					tx += '</tr>';
					
					for(i in data){
						tx += '<tr>';
						tx += '<td>' + data[i]["ap_b_no"] + '</td>';
						tx += '<td>' + data[i]["apde_turn"] + '</td>';
						tx += '<td>' + data[i]["s_no"] + '</td>';
						tx += '<td>' + data[i]["s_name"] + '</td>';
						tx += '<td>' + data[i]["t_name"] + '</td>';
						tx += '</tr>';
					}
					$('.modal_table21').append(tx);
					
				},
				error : function(err) {
					console.log(err,'@@@@');
					
				}

			});

		}); 

		// 모달창 닫기 이벤트 	
		$(".close").on("click", function() {
			$("#overlay").css({
				visibility : "hidden",
				opacity : 0
			});
		});
		$(document).on("click", function(e) {
			if ($("#overlay").is(e.target)) {
				$("#overlay").css({
					visibility : "hidden",
					opacity : 0
				});
			}
		});
		$(".close").on("click", function() {
			$("#overlay2").css({
				visibility : "hidden",
				opacity : 0
			});
		});
		$(".cancle").on("click", function() {
			$("#overlay2").css({
				visibility : "hidden",
				opacity : 0
			});
		});
		$(document).on("click", function(e) {
			if ($("#overlay2").is(e.target)) {
				$("#overlay2").css({
					visibility : "hidden",
					opacity : 0
				});
			}
		});
		$(".close").on("click", function() {
			$("#overlay3").css({
				visibility : "hidden",
				opacity : 0
			});
		});
		$(".cancle").on("click", function() {
			$("#overlay3").css({
				visibility : "hidden",
				opacity : 0
			});
		});
		$(document).on("click", function(e) {
			if ($("#overlay3").is(e.target)) {
				$("#overlay3").css({
					visibility : "hidden",
					opacity : 0
				});
			}
		});
		$(".close").on("click", function() {
			$("#overlay4").css({
				visibility : "hidden",
				opacity : 0
			});
		});
		$(document).on("click", function(e) {
			if ($("#overlay4").is(e.target)) {
				$("#overlay4").css({
					visibility : "hidden",
					opacity : 0
				});
			}
		});

		// esc 누를시 모달창 닫기
		$(document).keydown(function(event) {
			if (event.keyCode == 27 || event.which == 27) {
				$("#overlay").css({
					visibility : "hidden",
					opacity : 0
				});
			}
		});
		$(document).keydown(function(event) {
			if (event.keyCode == 27 || event.which == 27) {
				$("#overlay2").css({
					visibility : "hidden",
					opacity : 0
				});
			}
		});
		$(document).keydown(function(event) {
			if (event.keyCode == 27 || event.which == 27) {
				$("#overlay3").css({
					visibility : "hidden",
					opacity : 0
				});
			}
		});
		$(document).keydown(function(event) {
			if (event.keyCode == 27 || event.which == 27) {
				$("#overlay4").css({
					visibility : "hidden",
					opacity : 0
				});
			}
		});
	</script>
	<!--     모달 스크립트 여기까지~!     -->
</body>
</html>
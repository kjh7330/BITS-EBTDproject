<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휠체어유저 - 즐겨찾기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!--font-awesome CDN-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet"> 
</head>

<style>
	#booklist{
	 height: 90px; text-align: center; font-size:14pt; color:black; 
	 padding-top:15px; margin: 20px;
 	border:1px solid gray;
	}

	.fas fa-splotch{
		color: yellow; size: 20px;
	}
/*   모달css랑 스크립트, 버튼html 복사해서 쓰세요~!   */
 /*   스크립트는 맨 아래쪽에 있음   */
 /*   모달 버튼은 스크립트 위에 있음   */
        /* reset */
        body, html { height:100%; }
        h2, p, div, h3 { margin:0; padding:0 }

        /* modal trigger */
        button { border:none; 
                    font-size:18px; 
                    background:#f44336;
                    color:#f9f9f9; 
                    padding:8px 16px; }
        h2 { padding:20px 0; }
        body { text-align:center; }

        /* modal overlay */
        #overlay { width:100%; 
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
                                height:200px;  }
        .modal_footer { width:100%; 
                            padding:10px 0; 
                            font-size:14px; }
        .close { position:absolute; 
                    top:10px; right:20px; 
                    font-size:28px;
                    color:#aaa;
                    font-weight:bold;   }
        .close:hover, .close:focus {
                    color:#000; 
                    cursor:pointer; 
        }
/*   모달css여기까지~!   */


</style>
<body>
	<div id="userheader"><%@ include file="/WEB-INF/views/include/userheader.jsp"%></div>
	
	<!-- 즐겨찾기 리스트 -->
	<div id="booklist"></div>
	
	<!-- 모달 -->
        <div id="overlay">
          <div id="myModal" class="modal">
             <div class="modal_header">
                <h5>즐겨찾기 예약</h5  >
                <span class="close">&times;</span>
             </div>
             <div class="modal_content">
               <p style="color:black;">Some text in the Modal....</p>
             </div>
             <div class="modal_footer">
               <p style="color:black;">copyright by </p>
             </div>
          </div>
        </div>
	<!--    모달 버튼 끝!    -->
        
        
	<script type="text/javascript">
		let uBookList = ${uBookList};
		let str = '';
		console.log(uBookList);
		
		for(let i = 0; i < uBookList.length; i++){
		    //부트스트랩
			str += '<a href="#">';
			str += '<i class="fas fa-splotch"></i>';
			str += uBookList[i].ub_alias +'<br>';	//별칭
			str += '['+ uBookList[i].b_no +'] ';		
			str += uBookList[i].s_nameStart;
			str += uBookList[i].s_nameLast;
			str += '</a>';
		}
		$('#booklist').empty();
		$('#booklist').append(str); 
		
		 
		<!--     모달 스크립트만 가져가세요~!    -->
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
		<!--     모달 스크립트 여기까지~!     -->
		
		//즐겨찾기 클릭
		function bookOneClick(){ 	// 모달창 열기 이벤트
			//모달창 - [9]번 ~부터 1까지 예약하시겠습니까?
			 $("#overlay").css({ visibility:"visible", opacity:1 });
		}

	</script>
			
	<div id="userfooter"><%@ include
			file="/WEB-INF/views/include/userfooter.jsp"%></div>
</body>
</html>
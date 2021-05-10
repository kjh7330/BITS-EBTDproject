<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ReservationDetailForm</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">

#routetable{
	width: 100%;
}
#bustitle{
	text-align: center;
	background-color: blue;
}
#busRoute{
	float : right;
	color: black;
	width: 100%;
}
#stopinfo{
	background-color: blue;
}
.s_namestart, .s_namelast, #nearBus, #distantBus{
	width: 50%;
}
.inputValue{
	color : black;
}
#stop{
	line-height : 200%;
	cursor:pointer;
}
#b_no{
	text-align: center;
	font-size: 30px;
	background-color: blue;
	color : white;
	border: none;
}


	/*   모달 CSS   */
        /* reset */
        h2, p, div, h3 { margin:0; padding:0 }

        /* modal trigger */
        .modal_content2 input { border:none; 
                    font-size:15px; 
                    background:#f5f5f5;
                    color:black; 
                    padding:8px 16px; }
        .modal_content3 input { border:none; 
                    font-size:18px; 
                    background:#f44336;
                    color:#f9f9f9; 
                    padding:8px 16px; }
        h2 { padding:20px 0; }
        body { text-align:center; }

        /* modal overlay */
       #overlay2	{ width:100%; 
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
        .modal_header { width:100%;
        				height : 50px;
        				position:relative;
        				
        				}

        .modal_content2 { 		width:100%; 
        						padding-left : 10px;

                                background:#fefefe;
                                box-sizing:border-box;
                                height:230px;
                                text-align: left;  }
        .modal_content3 {		
        						padding : 10px;
                                background:#fefefe;
                                text-align: center;  }
		.modal_content3 input{
				width: 90px;
		}
        .close { position:absolute; 
                    top:-10px; right:20px; 
                    font-size:28px;
                    color:#aaa;
                    font-weight:bold;   }
        .close:hover, .close:focus {
                    color:#000; 
                    cursor:pointer; 
        }
    	#myModal2{
        	position: absolute;
			top:130px;
			left:75px;
			width: 300px;
			height: 250px;
			color: black;
    	}

/*   모달css여기까지~!   */

 
 
 
</style>
</head>

<body>
	<div id="userheader"><%@ include file="/WEB-INF/views/include/userheader.jsp"%></div>
	<form action="/user/reservation" id="reservation" method="post">
	
		<div id="bustitle"></div>
		<div id="stopinfo" style="text-align: center;"><span id="startstop"></span> <-> <span id="laststop"></span></div>
	
	<table id="routetable" style="border: 1px solid black">
		<tr>
		<td><div class="inputValue" id="startValue">출발지 : <input class = "s_namestart" type="text" readonly='readonly'><input id="s_nostart" name="s_nostart" style="display: none;"></div></td>
		<td colspan="1" rowspan="2"><input type="button" id="modalUp" value="예약" style="height: 50px"></td>
		<td></td>
		</tr>
		<tr>
		<td><div class="inputValue" id="lastValue">목적지 : <input class = "s_namelast" type="text" readonly='readonly'><input id="s_nolast" name="s_nolast" style="display: none;"></div></td>
		</tr>
	</table>
	<table id = "busRoute">
	</table>
	
        <div id="overlay2">
          <div id="myModal2" class="modal">
             <div class="modal_header">
                <h5 style="margin-left:10px;margin-top:15px;font-size: 20px;">예약하기</h5>
                <span class="close">&times;</span>
             </div>
             <div class="modal_content2">
             	<p style="color:black;"><br>
					출발지 : <input class = "s_namestart" type="text" readonly='readonly'><br><br>
					목적지 : <input class = "s_namelast" type="text" readonly='readonly'><br><br>
					다음버스 : <input id = "nearBus" type="text" readonly='readonly'><br><br>
					그 다음버스 : <input id = "distantBus" type="text" readonly='readonly'><br><br><br>
				</p>
				</div>
				<div class="modal_content3">
					<input type="button" id="Btn" value="예">
					<input type="button" id="cancel" value="아니오">
             </div>
          </div>
        </div>
    
</form>	    
	<div id="userfooter"><%@ include file="/WEB-INF/views/include/userfooter.jsp"%></div>
	
</body>


<script type="text/javascript">


// 모달창 닫기 이벤트 	
	$(".close").on("click", function(){
  	$("#overlay2").css({ visibility:"hidden", opacity:0 });
	});
	$("#cancel").on("click", function(){
  	$("#overlay2").css({ visibility:"hidden", opacity:0 });
	});
	$(document).on("click", function(e){  
		if( $("#overlay2").is(e.target) ) {
	    	$("#overlay2").css({ visibility:"hidden", opacity:0 });
		}
	});

console.log(${brList});
console.log(${abList});
$("<input id='b_no' name='b_no' readonly='readonly' value="+${brList}[0]["b_no"]+">").appendTo("#bustitle"); 
$("#startstop").append(${brList}[0]["s_name"]);
$("#laststop").append(${brList}[${brList}.length-1]["s_name"]);

let i=0;
let str='';
let $abList;
let timer = setInterval(function () {
	$.ajax({
		url : '/user/allbus',
		data : { 'b_No' : ${brList}[0]["b_no"] },
		dataType : 'json'
	}).done(function (data) {
		$abList = data;
		$('.route_td').html('');
		
		let split;
		let i = 1;
		for(idx in data){
			for(child of $('.route_td') ){
				split = $(child).attr('id').split('_');
				if( $(data)[idx]['r_turn'] == split[3] )
					if( data[idx]['ab_type'] == 0 )
						if( data[idx]['ab_updown'] == 1 )	$('#route_up_td_'+i+'').html('<i class="fas fa-bus" style="color : blue;"></i><br>'+data[idx]['ab_no']+'상행');
						else									$('#route_down_td_'+i+'').html('<i class="fas fa-bus" style="color : blue;"></i><br>'+data[idx]['ab_no']+'하행');
					else
						if( data[idx]['ab_updown'] == 1 )	$('#route_up_td_'+i+'').html('<i class="fas fa-bus" style="color : green;"></i><br>'+data[idx]['ab_no']+'상행');
						else									$('#route_down_td_'+i+'').html('<i class="fas fa-bus" style="color : green;"></i><br>'+data[idx]['ab_no']+'하행');
				if( split[1] == 'down' ) i++;
			}
			i = 1;
		}
		
		let start_turn;
	 	let last_turn;
	 	let r_up_down;
	 	let b_up_down;
	 	let br_size = $brList.length;
    	$('#nearBus').val("도착 예정중인 버스가 없습니다."); 
	    for( ab_data of $abList){
	    	for( br_data of $brList){
	    		if( br_data['s_name'] == $('.s_namestart').val() ){
	    			start_turn = br_data['r_turn'];
	    		}
	    		if( br_data['s_name'] == $('.s_namelast').val() ){
	    			last_turn = br_data['r_turn'];
	    		}
	    	}
	    	if(ab_data['ab_updown'] != null){
	    		
		    	if(start_turn < last_turn)	r_up_down = 1;
		    	else if ( start_turn > last_turn )						r_up_down = 0;
		    	
		    	if(r_up_down == 1){ // 유저 하행
		    		if ( ab_data['r_turn'] <= start_turn && ab_data['ab_updown'] == 1 && start_turn >= 8){
		    			if		( ( start_turn - ab_data['r_turn'] ) == 1 )
		    				$('#nearBus').val("잠시 후 도착합니다.");
		    			else if ( ( start_turn - ab_data['r_turn'] ) < 8 && ( ( start_turn - ab_data['r_turn'] ) != 0 ) )
		    				$('#nearBus').val( ( ( start_turn - ab_data['r_turn'] ) * 3 ) + "분 남았습니다");
		    			else{
					    	$('#nearBus').val("도착 예정중인 버스가 없습니다."); 
		    			}
		    		}else if ( ab_data['r_turn'] <= start_turn && ab_data['ab_updown'] == 1 && start_turn < 8){
	    				if	( start_turn - ab_data['r_turn'] == 1){
		    				$('#nearBus').val("잠시 후 도착합니다.");
	    				}else if ( ( start_turn - ab_data['r_turn'] ) < 8 && ( start_turn - ab_data['r_turn'] ) != 0 ){
		    				$('#nearBus').val( ( ( start_turn - ab_data['r_turn'] ) * 3 ) + "분 남았습니다");
	    				}else{
					    	$('#nearBus').val("도착 예정중인 버스가 없습니다."); 
	    				}
		    		}else if ( ab_data['r_turn'] <= (8-start_turn) && ab_data['ab_updown'] == 0 && start_turn < 8){
						if( ( start_turn + ab_data['r_turn'] - 2 ) == 1 ){
		    				$('#nearBus').val("잠시 후 도착합니다.");
						}else if (  ( start_turn + ab_data['r_turn'] - 2 ) < 8 ){
		    				$('#nearBus').val( ( start_turn + ab_data['r_turn'] - 2 ) * 3 + "분 남았습니다." );
						}else{
					    	$('#nearBus').val("도착 예정중인 버스가 없습니다."); 
						}
		    		}
		    	}else if (r_up_down == 0){				// 유저 상행
		    	
		    		if ( ab_data['r_turn'] >= start_turn && ab_data['ab_updown'] == 0 && ( br_size - 7 ) >= start_turn ){
		    			console.log()
		    			if		( ( ab_data['r_turn'] - start_turn ) == 1 )
		    				$('#nearBus').val("잠시 후 도착합니다.");
		    			else if ( ( ab_data['r_turn'] - start_turn ) < 8 && ( ( start_turn - ab_data['r_turn'] ) != 0 ) )
			    			$('#nearBus').val( ( ( ab_data['r_turn'] - start_turn ) * 3 ) + "분 남았습니다");
		    			else 
					    	$('#nearBus').val("버스 없음1.");
		    		}else if ( ab_data['r_turn'] >= start_turn && ab_data['ab_updown'] == 0 && ( br_size - 7 ) < start_turn ){
		    			if		( ( ab_data['r_turn'] - start_turn ) == 1 )
		    				$('#nearBus').val("잠시 후 도착합니다.");
	    			else if ( ( ab_data['r_turn'] - start_turn ) < 8 && ( ab_data['r_turn'] - start_turn ) != 0)
			    			$('#nearBus').val( ( ( ab_data['r_turn'] - start_turn ) * 3 ) + "분 남았습니다");
		    			else
					    	$('#nearBus').val("버스 없음2.");
		    		}else{
		    			if( ( br_size - ab_data['r_turn'] ) * 2 +ab_data['r_turn'] - start_turn == 1 )
		    				$('#nearBus').val("잠시 후 도착합니다.");
		    			else if ( ( br_size - ab_data['r_turn'] ) * 2 + ab_data['r_turn'] - start_turn < 8)
		    				$('#nearBus').val( ( ( br_size - ab_data['r_turn'] ) * 2 + ab_data['r_turn'] - start_turn ) * 3 + "분 남았습니다.");
						else
					    	$('#nearBus').val("버스 없음3.");
		    		}
		    	}
	    	}
	    }
	}).fail(function (err) {
		console.log(err,'!!!!!!!!');
	});
	
}, 7000);
let $brList = ${brList};	
$("#modalUp").on("click", function(){
    $("#overlay2").css({ visibility:"visible", opacity:1 });
    $("#myModal2").css({ display: "inline"});
 	
    
    
});

for (i; i<${brList}.length; i++){
	str='<tr id="stop">';
	
	
	
	str+='<td class = "route_td" id = "route_up_td_'+(i+1)+'"></td>';
	str+='<td class = "route_td" id = "route_down_td_'+(i+1)+'"></td>';
	str+='</td><td class="stopList">'+${brList}[i]["s_name"]+'<br>';
	str+=${brList}[i]["s_no"]+'</td>';
	
	str+='<td class = "div_td">';
	
	str+='<div class="routeSetting" style="visibility : hidden"><span class="start">출발지</span> &nbsp&nbsp&nbsp&nbsp&nbsp <span class="last">목적지</span></div>';
	
	str+='</td>';
	
	str+='</tr>'; 
	$("#busRoute").append(str);
	
	for( idx in ${abList}){
		if( ${abList}[idx]['r_turn'] == i+1 ) {
			if( ${abList}[idx]['ab_type'] == 0 )
				if( ${abList}[idx]['ab_updown'] == 1 )	$('#route_up_td_'+(i+1)+'').html(${abList}[idx]['ab_no']+'일반');
				else									$('#route_down_td_'+(i+1)+'').html(${abList}[idx]['ab_no']+'일반');
			else
				if( ${abList}[idx]['ab_updown'] == 1 )	$('#route_up_td_'+(i+1)+'').html(${abList}[idx]['ab_no']+'저상');
				else									$('#route_down_td_'+(i+1)+'').html(${abList}[idx]['ab_no']+'저상');
		}
	}
};

console.log(${brList})

$(".stopList").click(function () {
    if ($(this).parent().find('.routeSetting').css('visibility') == 'hidden'){
    	for( data of $(this).parent().parent().children() )
    		$(data).children('.div_td').children('.routeSetting').attr('style', 'visibility : hidden');
    	$(this).parent().find('.routeSetting').attr('style', 'visibility : visible')
    	
    }else{
    	$(this).parent().children().children('.routeSetting').attr('style', 'visibility : hidden')
    }
});

$(".start").click(function () {
	let start = '';
	start = $(this).parent().parent().parent().children('.stopList').text();
	$('.s_namestart').val(start.substring(0, start.length-5));
	$('#s_nostart').val(start.substring(start.length-5));
	
	console.log($('.s_namestart').val());
	console.log($('#s_nostart').val());
});
$(".last").click(function () {
	let last = '';
	last = $(this).parent().parent().parent().children('.stopList').text();
	$('.s_namelast').val(last.substring(0, last.length-5));
	$('#s_nolast').val(last.substring(last.length-5));
	
	console.log($('.s_namelast').val());
	console.log($('#s_nolast').val());
});


$("#Btn").click(function() {
	if($('.s_namestart').val()!=''&&$('.s_namelast').val()!=''){
		if($('.s_namestart').val()!=$('.s_namelast').val()){
			$('form').trigger('submit');
		}
		else{
			alert('출발지와 정류장이 같습니다!');
		}
		
	}else{
		console.log("입력이나 해 충호야");
	}
});

</script>
</html>
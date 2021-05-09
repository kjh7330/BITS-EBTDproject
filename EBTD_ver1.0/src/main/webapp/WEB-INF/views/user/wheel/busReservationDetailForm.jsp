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
	border: 1px solid black;
	width: 100%;
}
#stopinfo{
	background-color: blue;
}
#s_namestart, #s_namelast{
	width: 70%;
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
.route_td{
	width : 10%;
}
.fas fa-bus{

}
</style>
</head>

<body>
	<div id="userheader"><%@ include file="/WEB-INF/views/include/userheader.jsp"%></div>
	<form action="/user/reservation" id="reservation" method="post">
	
		<div id="bustitle"></div>
		<div id="stopinfo" style="text-align: center;"><span id="startstop"></span> <-> <span id="laststop"></span></div>
	
	<table id="routetable" style="border: 1px solid black">
		<tr>
		<td><div class="inputValue" id="startValue">출발지 : <input id = "s_namestart" type="text" readonly='readonly'><input id="s_nostart" name="s_nostart" style="display: none;"></div></td>
		<td colspan="1" rowspan="2"><input type="button" id="Btn" value="예약" style="height: 50px"></td>
		<td></td>
		</tr>
		<tr>
		<td><div class="inputValue" id="lastValue">목적지 : <input id = "s_namelast" type="text" readonly='readonly'><input id="s_nolast" name="s_nolast" style="display: none;"></div></td>
		</tr>
	</table>
	<table id = "busRoute">
	</table>
</form>	    
	<div id="userfooter"><%@ include file="/WEB-INF/views/include/userfooter.jsp"%></div>
	
</body>


<script type="text/javascript">
console.log(${brList});
console.log(${abList});
$("<input id='b_no' name='b_no' readonly='readonly' value="+${brList}[0]["b_no"]+">").appendTo("#bustitle"); 
$("#startstop").append(${brList}[0]["s_name"]);
$("#laststop").append(${brList}[${brList}.length-1]["s_name"]);

let i=0;
let str='';

let timer = setInterval(function () {
	$.ajax({
		url : '/user/allbus',
		data : { 'b_No' : ${brList}[0]["b_no"] },
		dataType : 'json'
	}).done(function (data) {
		$('.route_td').html('');
		
		let split;
		let i = 1;
		for(idx in data){
			for(child of $('.route_td') ){
				split = $(child).attr('id').split('_');
				if( $(data)[idx]['r_turn'] == split[3] )
					if( data[idx]['ab_type'] == 0 )
						if( data[idx]['ab_updown'] == 1 )	$('#route_up_td_'+i+'').html(data[idx]['ab_no']+'일반'+'<i class="fas fa-bus" style="color : blue;"></i><i class="fal fa-comment-alt"></i>');
						else									$('#route_down_td_'+i+'').html(data[idx]['ab_no']+'일반'+'<i class="fas fa-bus" style="color : blue;"></i><i class="fal fa-comment-alt"></i>');
					else
						if( data[idx]['ab_updown'] == 1 )	$('#route_up_td_'+i+'').html(data[idx]['ab_no']+'저상'+'<i class="fas fa-bus" style="color : green;"></i><i class="fal fa-comment-alt"></i>');
						else									$('#route_down_td_'+i+'').html(data[idx]['ab_no']+'저상'+'<i class="fas fa-bus" style="color : green;"></i><i class="fal fa-comment-alt"></i>');
				if( split[1] == 'down' ) i++;
			}
			i = 1;
		}
	}).fail(function (err) {
		console.log(err,'!!!!!!!!');
	});
	
}, 1000);

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
	$('#s_namestart').val(start.substring(0, start.length-5));
	$('#s_nostart').val(start.substring(start.length-5));
	
	console.log($('#s_namestart').val());
	console.log($('#s_nostart').val());
});
$(".last").click(function () {
	let last = '';
	last = $(this).parent().parent().parent().children('.stopList').text();
	$('#s_namelast').val(last.substring(0, last.length-5));
	$('#s_nolast').val(last.substring(last.length-5));
	
	console.log($('#s_namelast').val());
	console.log($('#s_nolast').val());
});

$("#Btn").click(function() {
	if($('#s_namestart').val()!=''&&$('#s_namelast').val()!=''){
		$('form').trigger('submit');
	}else{
		console.log("입력이나 해 충호야");
	}
});

</script>
</html>
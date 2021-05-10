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
		.main-container{
		    position: absolute;
		    top: 10%;
            left: 50%;
            transform: translate(-57%,17%);
			color: black;
			width: 700px;
            text-align: center;
            padding-bottom: 140px;
		}
		.maininput{
			border: none;
			background-color: #f9eb99;
			font-size: 20px;
			font-weight: bold;
			width: 800px;
			height: 50px;
			text-align: center;
			margin-bottom: 20px;
			border-radius: 10px;
		}
		.maintable td{
			height: 33px;
		}
		.maininput:focus{
			outline:none;
		}
		.maintable{
			border: none;
            border-radius: 8px;
            text-align: center;
            width: 800px;
            background-color: #f9eb99;
            height: 50px;
            font-size: 18px;
		}
		.maintable:focus{
			outline:none;
		}
		.arrow{
			border: 1px solid black;
			height: 35px;
		}
		.arrow:hover {
			border: 1px solid #aaa;
		}

    </style>
</head>
<body>
<div id="adminheader"><%@ include file="/WEB-INF/views/include/adminheader.jsp" %></div>

<div class="main-container"><br>
	<div><input class="maininput" value="노선 승인 내역" readonly></div>
	<div>
		<a style="margin-left: 100px;">정렬:</a>
		<select class="arrow" id="category1" onchange="fnCtg()">
			<option value="all" selected>전체</option>
			<option value="c_name">회사명</option>
			<option value="ap_state">승인종류</option>
			<option value="ap_date">승인일자</option>
		</select>&nbsp;&nbsp;&nbsp;
		<a>정렬기간:</a>
		<select class="arrow" id="category2" onchange="fnCtg()">
			<option value="1" selected>전체</option>
			<option value="2">일주일</option>
			<option value="3">1개월</option>
			<option value="4">3개월</option>
		</select>
	</div><br>
	<div>
		<table class="maintable">
		</table>
	</div>
</div>

<div id="adminfooter"><%@ include file="/WEB-INF/views/include/adminfooter.jsp" %></div>
<script type="text/javascript">
	let baList = ${baList};

	$('.maintable').html('');
	let all = '';
	for(i in baList){
		all += '<tr>';
		all += '<td>' + baList[i]["c_name"] + '</td>';
		all += '<td><a href=/admin/company/getCompanyApprovalDetail?ap_no='+baList[i]["ap_no"]+'&ap_b_no='+baList[i]["ap_b_no"]+' style="text-decoration: none;">';
		all += baList[i]["ap_b_no"] +'번</td>';
		all += '<td>' + baList[i]["ap_date"] + '</td>';
			let state = baList[i]["ap_state"];
			 	if	   (state == 1){ all += '<td style="color: blue">등록 승인</td>'; }
			 	else if(state == 4){ all += '<td style="color: green">변경 승인</td>'; 	}
			all += '</tr>';
	}
	$('.maintable').append(all);
	
	
	function fnCtg(){
		let val1 = $('#category1 option:selected').val();
		let val2 = $('#category2 option:selected').val();
		
		//------
		let c_name = '';	
		
		if(val1 != 'all'){
			baList.sort(function(a, b){ 
				if(val1 == 'c_name'){
					console.log(val1);
					return a.c_name < b.c_name ? -1 : a.c_name > b.c_name ? 1 : 0;
				}
				if(val1 == 'ap_state'){
					console.log(val1);
					return a.ap_state < b.ap_state ? -1 : a.ap_state > b.ap_state ? 1 : 0;
				}
				if(val1 == 'ap_date'){
					console.log(val1);
					return a.ap_date < b.ap_date ? -1 : a.ap_date > b.ap_date ? 1 : 0;
				}
			});
		}
		
		for(i in baList){//2021-08-11
						// 0123456789
			let cur_date = new Date();
			let ba_date = new Date( baList[i]["ap_date"].substring(0,4), 
					             	parseInt(baList[i]["ap_date"].substring(5,7))-1, 
					           		baList[i]["ap_date"].substring(8,10));
				let period = new Date(cur_date);
			if(val2 != 1){
				if( val2 == 2 )	period.setDate(period.getDate()-7);
				if( val2 == 3 )	period.setDate(period.getDate()-30);
				if( val2 == 4 )	period.setDate(period.getDate()-90);
			}
			
			if( ( cur_date >= ba_date && ba_date >= period ) || val2 == 1 ){
				c_name += '<tr>';
				c_name += '<td>' + baList[i]["c_name"] + '</td>';
				c_name += '<td><a href=/admin/company/getCompanyApprovalDetail?ap_no='+baList[i]["ap_no"]+'&ap_b_no='+baList[i]["ap_b_no"]+' style="text-decoration: none;">';
				c_name += baList[i]["ap_b_no"] +'번</td>';
				c_name += '<td>' + baList[i]["ap_date"] + '</td>';
					let state = baList[i]["ap_state"];
				 	if	   (state == 1){ c_name += '<td style="color: blue;">등록 승인</td>'; }
				 	else if(state == 4){ c_name += '<td style="color: green;">변경 승인</td>'; 	}
				c_name += '</tr>';
			}
		}
		$('.maintable').html(c_name);
		
	}


</script>
</body>
<script type="text/javascript"></script>
</html>
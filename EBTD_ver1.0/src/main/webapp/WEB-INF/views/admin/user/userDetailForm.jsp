<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 이용자 관리</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<style>
h2{color: black; text-align:center}
.inf-content {
	border: 1px solid #DDDDDD;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	box-shadow: 7px 7px 7px rgba(0, 0, 0, 0.3);
	padding-bottom: 140px;
}
.maininput{
	border: none;
	background-color: skyblue;
	font-size: 20px;
	font-weight: bold;
	width: 800px;
	height: 50px;
	text-align: center;
	margin-top: 20px;
	margin-bottom: 20px;
	border-radius: 10px;
}
.maininput:focus{
	outline:none;
}
.maindiv{
	position: relative;
    left: 50%;
    transform: translate(-49%,0%);
	width: 800px;
	padding-bottom: 140px;
}

</style>

<body>
<div id="adminheader"><%@ include
			file="/WEB-INF/views/include/adminheader.jsp"%></div>
	
<div class="maindiv">
	<div><h6>&nbsp;</h6><h6>&nbsp;</h6><h6>&nbsp;</h6><h6>&nbsp;</h6><h6>&nbsp;</h6><h6>&nbsp;</h6>
		 <input class="maininput" value="이용자 상세보기" readonly>
	</div>

	<!-- 부트스트랩 쓰고 싶은데 데이터를 못넣겠음-->
	<br>
	<div class="container bootstrap snippets bootdey">
		<div class="panel-body inf-content">
			<div class="row">
				<div class="col-md-4">
					<img alt="" style="width: 300px;" title=""
						class="img-circle img-thumbnail isTooltip"
						src="https://image.9xsecndns.cn/image/uicon/25572456c459d48dc4929d08da4191b946acbf8030640a.png"
						data-original-title="Usuario">
				</div>
				<div class="col-md-7">
					<div class="table-responsive"></div>
				</div>
			</div>
		</div>
	</div>
</div>

<div id="adminfooter"><%@ include
			file="/WEB-INF/views/include/adminfooter.jsp"%></div>

<script type="text/javascript">
	
let uInfo = ${uInfo};
let str = "";
console.log(uInfo.u_userName);
			
//0,1을 --> 휠체어, 시각으로 바꾸어 출력
	if  (uInfo.u_type == 0) {uInfo.u_type = '시각';}
	else 					 uInfo.u_type = '휠체어';	
				
	str += '<table class="table table-user-information"><tbody>';
	str += '<tr><td style="width:150px;"><strong><span class="glyphicon glyphicon-asterisk text-primary"></span>아이디</strong></td>';
	str += '<td id="text-primary1" class="text-primary">' + uInfo.u_userName + '</td></tr>';
	str += '<tr><td><strong><span class="glyphicon glyphicon-user text-primary"></span>이름</strong></td>';
	str += '<td id="text-primary2" class="text-primary">' + uInfo.u_name + '</td></tr>';
	str += '<tr><td><strong><span class="glyphicon glyphicon-cloud text-primary"></span>장애인 번호</strong></td>';
	str += '<td id="text-primary3" class="text-primary">' + uInfo.u_disabledno + '</td></tr>';
	str += '<tr><td><strong><span class="glyphicon glyphicon-bookmark text-primary"></span>장애 유형</strong></td>';
	str += '<td id="text-primary4" class="text-primary">' + uInfo.u_type + '</td></tr>';
	str += '<tr><td><strong><span class="glyphicon glyphicon-eye-open text-primary"></span>전화번호</strong></td>';
	str += '<td id="text-primary5" class="text-primary">' + uInfo.u_userphonenum + '</td></tr>';
	str += '<tr><td><strong><span class="glyphicon glyphicon-envelope text-primary"></span>주소</strong></td>';
	str += '<td id="text-primary6" class="text-primary">' + uInfo.u_address + '</td></tr>';
	str += '<tr><td><strong><span class="glyphicon glyphicon-calendar text-primary"></span>보호자 이름	</strong></td>';
	str += '<td id="text-primary7" class="text-primary">' + uInfo.u_guardname + '</td></tr>';
	str += '<tr><td><strong><span class="glyphicon glyphicon-calendar text-primary"></span>보호자 관계</strong></td>';
	str += '<td id="text-primary8" class="text-primary">' + uInfo.u_guardrelation + '</td></tr>';
	str += '<tr><td><strong><span class="glyphicon glyphicon-calendar text-primary"></span>보호자 전화번호</strong></td>';
	str += '<td id="text-primary9" class="text-primary">' + uInfo.u_guardphonenum + '</td></tr></tbody></table>';
				
	$(".table-responsive").empty();
	$(".table-responsive").append(str);
			
</script>
</body>
</html>
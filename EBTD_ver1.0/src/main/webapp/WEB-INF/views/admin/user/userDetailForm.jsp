<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 이용자 상세 보기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<style>
.inf-content {
	border: 1px solid #DDDDDD;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	box-shadow: 7px 7px 7px rgba(0, 0, 0, 0.3);
}
</style>

<body>
	<div id="adminheader"><%@ include
			file="/WEB-INF/views/include/adminheader.jsp"%></div>
	<!-- 부트스트랩 user Info -->
	<br>
	<br>
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
				<div class="col-md-6">
					<div style="color: black" >	
					User Detail Information
					</div>
					<br>
					<div class="table-responsive">
						<table class="table table-user-information">
							<tbody>
								<tr>
									<td><strong> <span
											class="glyphicon glyphicon-asterisk text-primary"></span> 아이디
									</strong></td>
									<td id="text-primary1" class="text-primary">?</td>
								</tr>
								<tr>
									<td><strong> <span
											class="glyphicon glyphicon-user  text-primary"></span>이름
									</strong></td>
									<td id="text-primary2" class="text-primary">?</td>
								</tr>
								<tr>
									<td><strong> <span
											class="glyphicon glyphicon-cloud text-primary"></span> 장애인 번호
									</strong></td>
									<td id="text-primary3" class="text-primary"></td>
								</tr>
								<tr>
									<td><strong> <span
											class="glyphicon glyphicon-bookmark text-primary"></span> 장애
											유형
									</strong></td>
									<td id="text-primary4" class="text-primary"></td>
								</tr>

								<tr>
									<td><strong> <span
											class="glyphicon glyphicon-eye-open text-primary"></span>
											전화번호
									</strong></td>
									<td id="text-primary5" class="text-primary"></td>
								</tr>
								<tr>
									<td><strong> <span
											class="glyphicon glyphicon-envelope text-primary"></span> 주소
									</strong></td>
									<td id="text-primary6" class="text-primary"></td>
								</tr>
								<tr>
									<td><strong> <span
											class="glyphicon glyphicon-calendar text-primary"></span> 보호자
											이름
									</strong></td>
									<td id="text-primary7" class="text-primary"></td>
								</tr>
								<tr>
									<td><strong> <span
											class="glyphicon glyphicon-calendar text-primary"></span> 보호자
											관계
									</strong></td>
									<td id="text-primary8" class="text-primary">
										</td>
								</tr>
								<tr>
									<td><strong> <span
											class="glyphicon glyphicon-calendar text-primary"></span> 보호자
											전화번호
									</strong></td>
									<td id="text-primary9" class="text-primary"></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
			let uInfo = ${uInfo};
			let str = "";
			console.log(uInfo.u_userName);

				//0,1을 --> 휠체어, 시각으로 바꾸어 출력
				if (uInfo.u_type == 0) {
					uInfo.u_type = '시각';
				} else uInfo.u_type = '휠체어';	
				
				console.log(uInfo.u_type);
				//아이디
				document.getElementById('#text-primary1').innerHTML = 'uInfo.u_userName';
				//이름
				document.getElementById('#text-primary2').innerHTML = 'uInfo.u_name';
				//장애인번호
				document.getElementById('#text-primary3').innerHTML = 'uInfo.u_disabledno';
				//장애유형
				document.getElementById('#text-primary4').innerHTML = 'uInfo.u_type';
				//전화번호
				document.getElementById('#text-primary5').innerHTML = 'uInfo.u_userphonenum';
				//주소
				document.getElementById('#text-primary6').innerHTML = 'uInfo.u_address';
				//보호자이름
				document.getElementById('#text-primary7').innerHTML = 'uInfo.u_guardname';
				//보호자관계
				document.getElementById('#text-primary8').innerHTML = 'uInfo.u_guardrelation';
				//보호자 전화번호
				document.getElementById('#text-primary9').innerHTML = 'uInfo.u_guardphonenum';
			
			
		</script>



	<div id="adminfooter"><%@ include
			file="/WEB-INF/views/include/adminfooter.jsp"%></div>

</body>
</html>
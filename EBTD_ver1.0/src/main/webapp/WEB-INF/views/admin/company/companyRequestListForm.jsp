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
        .company-container{
            width: 600px;
            color: black;
            position: absolute;
            left: 50%;
            transform: translate(-50%,10%);
        }
        .ctile{
            text-align: center;
            width: 100%;
            height: 30px;
            background-color: #f9eb99;
            font-size: 20px;
            font-weight: bold;
            height: 50px
        }
        .ccount{
            text-align: right;
        }
        .cbtn{
            text-align: center;
            width: 100%;
            height: 40px;
            background-color: lightgray;
            margin-bottom: 10px;
            font-weight: bold;
        }
        .cbtn:hover{
        	background-color: #f9eb99;
        }
    </style>
</head>
<body>
<div id="adminheader"><%@ include file="/WEB-INF/views/include/adminheader.jsp" %></div>

    <div class="company-container">

        <input class="ctile" value="회사 등록 신청 리스트" readonly>
        <div class="ccount">Count : ${cList.size()} 개</div>
        <div>
        	<c:forEach var="company" items="${cList}">
				<a href="/ebtd/ac/admin/company/getCompanyRequestDetail?c_name=${company.c_name}">            	
				<input class="cbtn" type="button" value="${company.c_name}">
				</a>
        	</c:forEach>
        </div>
    </div>
    
    
<script type="text/javascript">

/*$('.cbtn').click(function(){
	
	let $c_name = $('.cbtn').val();
	//console.log(c_name);
	$.ajax({
		type : 'get',
		url : 'getCompanyRequestDetail',
		data : {c_name : $c_name}
	})
});
*/

</script>
<div id="adminfooter"><%@ include file="/WEB-INF/views/include/adminfooter.jsp" %></div>
</body>
</html>
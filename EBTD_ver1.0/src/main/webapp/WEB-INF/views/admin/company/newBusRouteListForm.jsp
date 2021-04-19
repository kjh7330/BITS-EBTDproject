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
            
        }
        .ctile{
            text-align: center;
            width: 100%;
            height: 30px;
            background-color: #f9eb99;
        }
        .ccount{
            text-align: right;
        }
        .cbtn{
            text-align: center;
            width: 100%;
            height: 30px;
            background-color: #f9eb99;
            margin-bottom: 10px;
        }

    </style>
</head>
<body>
<div id="adminheader"><%@ include file="/WEB-INF/views/include/adminheader.jsp" %></div>

    <div class="company-container">

        <input class="ctile" value="새로운 노선 등록 List" readonly>
        <div class="ccount">Count : ${abList.size()} 개</div>
        <div>
        	<table>
        	<c:forEach var="bus" items="${abList}">
        		<tr>
        			<td>
        				${bus.c_username}
					</td>
					<td>
						<a href="/ebtd/ac/admin/company/getCompanyRequestDetail?c_name=${bus.c_username}"> 
						<button>공문 보기</button>
						</a>
					</td>
					<td>
						<button>승인</button>
					</td>
					<td>
						<button>반려</button>
					</td>
				</tr>
        	</c:forEach>
        	</table>
        </div>
    </div>

<div id="adminfooter"><%@ include file="/WEB-INF/views/include/adminfooter.jsp" %></div>
</body>
</html>
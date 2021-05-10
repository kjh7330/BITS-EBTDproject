<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 추가</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 
 <script type="text/javascript">
 	let childWindow = window.open('','','width=200px', 'height=200px');
 	childWindow.document.write('window resize');
 	childWindow.resizeTo(400, 400);	// x=400, y=400의 크기를 가진다.
 </script>
</head>
	
<body>
	<div>
	<h2>즐겨찾기에 추가하시겠습니까?</h2><br>
	<button>예</button> <button>아니오</button> 
	</div>
</body>
</html>
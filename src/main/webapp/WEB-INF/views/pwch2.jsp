<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<script src="https://code.jquery.com/jquery-3.6.0.slim.js"
	integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY="
	crossorigin="anonymous"></script>
<style type="text/css">form{
border-radius: 25px;
}
body{
background-image: url("./images/back.png");
background-size: cover;
}
div{
 background-color: white;
 opacity: 0.95;
}

</style>

</head>
<%@include file="menu.jsp"%>
<link rel="stylesheet" href="./css/main.css">
<body>

	<div style="text-align: center; margin:10%; margin-left:20%; padding:5%; border: 3px double ; color:#896AB7; width: 60%; height: 100%;" >
			<h1 style="color: #896AB7;">ANT 개미리뷰</h1>
		<br>
		<h3 style="color: black;">비밀번호 받기</h3>
		<br>
		<h4 style="color: black;">계정 복구 를 위해 임시 비밀번호가 전송됩니다<img id="ant" src="./resources/images/ant.png"> <br> </h4>
				<img id="chk" src="./resources/images/chk.png"> <br>
	
			
		         <div style="color: black;" id="pwem"> 작성한 이메일 :  < ${dto.member_email  } >  입니다 <br>
		          이메일 확인후 로그인 시도 하세요.
		  </div>
		
		<div>
			<br> 
		</div>
		<button type="submit" id="btn" onclick="location.href='./main'"
				style="margin-left: 30%; 
				background-color: #AAD34A;
				border:1px;
				color: white;
				border-radius: 5px;
				padding: 15px;
				font-weight: bold;
				text-align: center;"> 다음</button>
	</div>



</body>
</html>
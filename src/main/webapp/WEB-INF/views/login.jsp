<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link href='https://fonts.googleapis.com/css?family=Lato:300' rel='stylesheet' type='text/css'>

<script src="https://code.jquery.com/jquery-3.6.0.slim.js"
	integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY="
	crossorigin="anonymous"></script>

<script type="text/javascript">
function email() {
	   $.ajax({
	      type : "POST",
	      url : "loginemail",
	      data : {
	         email : "${email}",
	         
	      },
	      error : function(error) {
	         console.log("error");
	      },
	      success : function(data) {
	         console.log("success");

	      }
	   });
	}
</script>
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

<body>

	<%@include file="menu.jsp"%>
	
	<form action="./login2" method="post" onsubmit="return login();">
	<div  style="text-align: center; margin:10%; margin-left:20%; padding:5%; border: 3px double ; color:#896AB7; width: 60%; height: 100%;" >
		<h1 style="color:#896AB7;"> ANT 개미리뷰 </h1><br>
		<h3 style="color: black;" > 로 그 인 </h3><br>
		<a style="font-size: 15pt; color: black;"> 개미 계정 사용<img id="ant" src="./resources/images/ant.png"></a><br><br>
		<input type="text" name="email" id="email" placeholder="   honggildong@google.com" style="width:40%; height: 20%;border-color: #896AB7; border-radius: 10px;border-width: 2px;"><br>
		<br>
		<div style="text-align: left; margin-left: 33%;">
		<a href="./emailch">이메일 을 잊으셨나요? </a><br>
		<br>
		<a style="color: black;">내 컴퓨터가 아닌가요?<br>
		다른사람 에게 들키지 않게 조심히 로그인 하세요</a>
		<br>
		<br>
		<a href="./join">계정만들기</a>
		</div>
		<button type="submit" 
		style="margin-left: 30%; 
		background-color: #AAD34A;
		border:1px;
		color: white;
		border-radius: 5px;
		padding: 15px;
		font-weight: bold;
		text-align: center;"> 다음 </button>
		</div>
	
</form>

	
		
	</body>
	<%@include file="footer.jsp"%>
	
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="https://code.jquery.com/jquery-3.6.0.slim.js"
	integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY="
	crossorigin="anonymous"></script>


<script type="text/javascript">
function cp2() {
	   $.ajax({
	      type : "POST",
	      url : "logincp2",
	      data : {
	         email : "${nickname}",
	         
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
</head>
<link rel="stylesheet" href="./css/main.css">
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
<body>
	<%@include file="menu.jsp"%>

<form action="emailch3" method="post"  onsubmit="return cp2();">
<div style="text-align: center; margin:10%; margin-left:20%; padding:5%; border: 3px double ; color:#896AB7; width: 60%; height: 100%;">
		<h1 style="color:#896AB7; "> ANT 개미리뷰 </h1>
		<br>
		<h4 style="color: black;">
		${dto.member_name} 님 <br>다음 을 입력하세요</h4>
		<br>
		<h4 style="color: black;"> 닉네임 입력하세요&nbsp;&nbsp;<img id="ant" src="./resources/images/ant.png"></h4>
		
		<br>

		<input type="text"  name="nickname" id="nickname" placeholder="닉네임 을 입력해주세요"style="width:35%; "><br>
<br>
<button button type="submit" 
		style="margin-left: 30%; 
		background-color: #AAD34A;
		border:1px;
		color: white;
		border-radius: 5px;
		padding: 15px;
		font-weight: bold;
		text-align: center;">다음</button>

		</div>

</form>




</body>
</html>
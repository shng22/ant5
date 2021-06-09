<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유령회원</title>
<link rel="stylesheet" href="./css/main.css">
<style type="text/css">
body{
background-image: url("./images/water.png");
background-size: 100%;
}
#img{
size: 20pt;
margin: 10%;
padding-left: 10%;

}
#error{
text-align: center;
font-family:고딕체;
font:bold;
font-size: 18pt;
color:black;
}
footer{
color:black;
}
</style>
 
</head>
<body>
	<%@include file="menu.jsp"%>
	<div id="img">
	<img alt="n" src="./resources/images/n.png"><img alt="e" src="./resources/images/e.png"><img alt="king" src="./resources/images/king.png"><img alt="n" src="./resources/images/n.png"><img alt="e" src="./resources/images/e.png"><img alt="king" src="./resources/images/king.png">

	</div>
	<div id="error">
		일치하는 회원정보가 없으며, 개미 리뷰 의 회원이 아닙니다.<br>
		리뷰를 작성하고 여러사람과 공유 하고 싶다면 	<a href="./join">회원가입 </a> 을 하세요<br>
		<a href="emailch">이메일 찾기</a> 또는 <a href="pwch">비밀번호 찾기</a> 
	 
		
	</div>
	<div id="img">
	<img alt="n" src="./resources/images/n.png"><img alt="e" src="./resources/images/e.png"><img alt="king" src="./resources/images/king.png"><img alt="n" src="./resources/images/n.png"><img alt="e" src="./resources/images/e.png"><img alt="king" src="./resources/images/king.png">

	</div>
	<div id="foot">
<%@include file="footer.jsp"%></div>
</body>
</html>
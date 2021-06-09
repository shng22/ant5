<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 알림창</title>
<link rel="stylesheet" href="./css/main.css">
<style type="text/css">

body {
background: rgb(230,239,255);
background: linear-gradient(0deg, rgba(230,239,255,1) 0%, rgba(255,255,255,1) 100%);
}
#img{
size: 20pt;
margin: 10%;
padding-left: 10%;

}
#show{
text-align: center;
font-family:고딕체;
font:bold;
font-size: 18pt;
}

</style>
 
</head>
<body>
	<%@include file="menu.jsp"%>
	<div id="img">
	<img alt="n" src="./resources/images/n.png"><img alt="e" src="./resources/images/e.png"><img alt="king" src="./resources/images/king.png"><img alt="n" src="./resources/images/n.png"><img alt="e" src="./resources/images/e.png"><img alt="king" src="./resources/images/king.png">
</div>

	<div id="show">
	 
		${email.member_id} 님  이메일주소는  ${email.member_email } 입니다 .<br>
		다시 시도 하세요,	<a href="./login"> 로 그 인 !! </a> 을 하세요.<br>
		혹시 , 비밀번호를 잊으셨나요? <a href="pwch"> 비밀번호 찾기 </a>  를 이용하세요.
	 
		
	</div>
	<div id="img">
	<img alt="n" src="./resources/images/n.png"><img alt="e" src="./resources/images/e.png"><img alt="king" src="./resources/images/king.png"><img alt="n" src="./resources/images/n.png"><img alt="e" src="./resources/images/e.png"><img alt="king" src="./resources/images/king.png">

	</div>
</body>
<%@include file="footer.jsp"%>
</html>
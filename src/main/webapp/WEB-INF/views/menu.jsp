<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Bootstrap CSS -->

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<nav class="navbar navbar-expand-sm navbar-light bg-white" id="nav">
	<img id="logo" src="./resources/images/logo.png"
		onclick="location.href = 'main'" style="width: 10%">

	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarsExample04" aria-controls="navbarsExample04"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarsExample04">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item"><a class="nav-link" href="/web/p" id="btn"> 연
					극&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
					class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="/web/c" id="btn"> 콘 서
					트&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
			<li class="nav-item"><a class="nav-link " href="/web/u" id="btn"> 대 학
					로&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</a></li>
			<c:if test="${sessionScope.grade eq 9 }">
				<li class="nav-item"><a class="nav-link " href="/web/master" id="mas-btn"style="width: 250px; text-align: center;">관리자
				</a></li>
			</c:if>

		</ul>

		<c:choose>
			<c:when test="${sessionScope.nickname  ne null}">
				<c:if test="${sessionScope.grade ne 1 }">
					<a onclick="location.href='./mapa'">${sessionScope.nickname  }님</a>
					<br>
					<img alt="" src="./resources/images/logout.png"
						onclick="location.href='./logout'"
						style="width: 6%; padding-left: 50px">
				</c:if>
			</c:when>

			<c:when test="${sessionScope.grade eq 1 || sessionScope.no eq null}">
				<img id="login" src="./resources/images/login.png"
					onclick="location.href = './login'" style="width: 5%;">
			</c:when>
		</c:choose>

	</div>
	<hr>
</nav>
<style>
div{
color:black;
}

#nav {
color:black;
	padding-top: 0;
	margin: 0 auto;
}

#logo {
	padding-left: 0;
	
}

#login {
	padding-right: 0;
}

#navbarsExample04 {
   
	padding-left: 5%;
	margin-top: 5%;
	margin: 0 auto;
	text-align: center;
	font-size: 22pt;
	background-color: white;
}
#btn:hover{
color: #896AB7;
text-align: center;
border-bottom-style:double;
border-width:thick;
border-color:  #896AB7;
text-decoration: blink;
text-indent:10px;
text-shadow:white;
font-style:italic;
font-weight:bold;
height: 100%;
background-size: 100%;

}
#mas-btn:hover{
color: red;
font-weight:bold;
text-align: center;
border-width:thick;
background-color: white;
border-style: double;
border-radius:20px;
border-color:  #896AB7;
}
</style>


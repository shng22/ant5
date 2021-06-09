<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>연극 게시판</title>
<link rel="stylesheet" href="./css/board.css">
<style type="text/css">
body {
background: rgb(230,239,255);
background: linear-gradient(0deg, rgba(230,239,255,1) 0%, rgba(255,255,255,1) 100%);
}
button {
	background-color: red;
	font-weight:bold;
	widht:150px;
	height:40px;
	color: white;
	border: 2px solid;
	transition-duration: 0.4s;
}

button:hover {
	background-color: white;
	color: black;
}
</style>
</head>
<body>
	<%@include file="menu.jsp"%>
	<br>
	<br>
	<div>
		<div style="padding-bottom: 2000px">
			<h1 style="padding-left: 50px;">연극</h1>
			
			<form action="./search" method="post">
				<div class="form-group row justify-content-center">

					<div class="w100" style="padding-right: 10px">

						<select class="form-control form-control-sm" name="searchType"
							id="searchType">

							<option value="title">제목</option>

							<option value="content">본문</option>

							<option value="genre">장르</option>

						</select>

					</div>

					<div class="w300" style="padding-right: 10px">

						<input type="text" class="form-control form-control-sm"
							name="keyword" id="keyword"
							style="border-color: white; border-bottom-color: skyblue; width: 500px;">

					</div>


					<button class="btn btn-sm btn-primary" name="btnSearch"
						id="btnSearch" style="height: 30px">검색</button>
				</div>
			</form>
			<br><br><br><br><br>
			
			
			<c:forEach items="${list }" var="row">
				<c:if test="${row.type eq 1}">
					<div
						style="width: 400px; padding-left: 50px; float: left; margin-bottom: 50px;">
						<table style="color: orange">
							<tr>
								<td><img alt="" src="./upload/${row.file }"
									style="width: 100%; height: 500px"></td>
							</tr>
							<tr>
								<td><a style="color: black; font-size: 15px"
									href="./detail?no=${row.bno }"> ${row.title }(${row.views })
								</a></td>
							</tr>
							<tr>
								<td>${row.rundate }</td>
							</tr>
						</table>
					</div>
				</c:if>
			</c:forEach>
		</div>
		<div>
			
		</div>
	</div>

	<c:if test="${sessionScope.grade eq 9 or sessionScope.grade eq 6}">
		<button onclick="location.href='./write'" style="margin-left: 50%">글쓰기</button>
	</c:if>


</body>
</html>
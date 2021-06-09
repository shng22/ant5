<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>

<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

<!-- Link Swiper's CSS -->
<link rel="stylesheet" href="../package/swiper-bundle.min.css">

<!-- Demo styles -->
<style>
form{
 text-align: center;
 font-size: large; 
}

h1 {
	padding-top: 50px;
	text-align: center;
}

* {
	box-sizing: border-box;
}

footer{
color: black;
}
body {
width:100%;
background: #f5f6f6; /* Old browsers */
background: -moz-linear-gradient(top,  #f5f6f6 0%, #dbdce2 21%, #b8bac6 49%, #dddfe3 80%, #f5f6f6 100%); /* FF3.6-15 */
background: -webkit-linear-gradient(top,  #f5f6f6 0%,#dbdce2 21%,#b8bac6 49%,#dddfe3 80%,#f5f6f6 100%); /* Chrome10-25,Safari5.1-6 */
background: linear-gradient(to bottom,  #f5f6f6 0%,#dbdce2 21%,#b8bac6 49%,#dddfe3 80%,#f5f6f6 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f5f6f6', endColorstr='#f5f6f6',GradientType=0 ); /* IE6-9 */

	font-family: Verdana, sans-serif;
}


.mySlides {
	display: none;
}

img {
	vertical-align: middle;
}

/* Slideshow container */
.slideshow-container {
	max-width: 100%;
	position: relative;
	margin: auto;
}

/* Caption text */
.text {
	color: #000000;
	font-size: 15px;
	padding: 8px 12px;
	position: absolute;
	bottom: 8px;
	width: 100%;
	text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
	color: #f2f2f2;
	font-size: 12px;
	padding: 8px 12px;
	position: absolute;
	top: 0;
}

/* The dots/bullets/indicators */
.dot {
	height: 15px;
	width: 15px;
	margin: 0 2px;
	background-color: #bbb;
	border-radius: 50%;
	display: inline-block;
	transition: background-color 0.6s ease;
}

.active {
	background-color: #717171;
}

/* Fading animation */
.fade {
	-webkit-animation-name: fade;
	-webkit-animation-duration: 1.5s;
	animation-name: fade;
	animation-duration: 1.5s;
}

@
-webkit-keyframes fade {
	from {opacity: .4
}

to {
	opacity: 1
}

}
@
keyframes fade {
	from {opacity: .4
}

to {
	opacity: 1
}

}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
	.text {
		font-size: 11px
	}
}

.imgBoxDiv {
	width: 300px;
	height: 400px;
	position: relative;
	cursor: pointer;
	overflow: hidden;
	box-shadow: 2px 2px 8px 0px #000;
}

.imgDiv {
	width: 100%;
	height: 100%;
	position: absolute;
	background: lightblue;
	z-index: 1;
	-webkit-transition: all .5s ease;
	transition: all .5s ease;
	bottom: 0px;
	overflow: hidden;
}

.imgBoxDiv:hover .imgDiv {
	bottom: 60px;
}

.imgDescDiv {
	width: 100%;
	height: 50px;
	padding: 10px;
	color: #FFFFFF;
	background: #F2CB61;
	position: absolute;
	bottom: 0px;
}

.slideshow-container img {
	height: 500px;
}
</style>

</head>
<body>



	<%@include file="menu.jsp"%>

	<div class="slideshow-container">

		<div class="mySlides fade1">
			<div class="numbertext">1 / 3</div>
			<img src="./resources/images/caption1.jpg" style="width: 100%;">
		</div>

		<div class="mySlides fade1">
			<div class="numbertext">2 / 3</div>
			<img src="./resources/images/caption2.jpg" style="width: 100%">
		</div>

		<div class="mySlides fade1">
			<div class="numbertext">3 / 3</div>
			<img src="./resources/images/caption3.jpg" style="width: 100%">
		</div>

	</div>
	<br>

	<div style="text-align: center">
		<span class="dot"></span> <span class="dot"></span> <span class="dot"></span>
	</div>

	<c:url var="getBoardListURL" value="/board/getBoardList"></c:url>
	<!-- Initialize Swiper -->
	<script>
		var slideIndex = 0;
		showSlides();

		function showSlides() {
			var i;
			var slides = document.getElementsByClassName("mySlides");
			var dots = document.getElementsByClassName("dot");
			for (i = 0; i < slides.length; i++) {
				slides[i].style.display = "none";
			}
			slideIndex++;
			if (slideIndex > slides.length) {
				slideIndex = 1
			}
			for (i = 0; i < dots.length; i++) {
				dots[i].className = dots[i].className.replace(" active", "");
			}
			slides[slideIndex - 1].style.display = "block";
			dots[slideIndex - 1].className += " active";
			setTimeout(showSlides, 2000); // Change image every 2 seconds
		}
	</script>
	<div style="padding-left:12%; width: 100%">
		<div style="padding-bottom: 1000px;">
		<form>
		<div style="padding-right: 15%; margin-top: 5%;">
			<dform action="./search" method="post">
				<div class="form-group row justify-content-center">

					<div class="w100" style="padding-right: 10px;">

						<select class="form-control form-control-sm" name="searchType"
							id="searchType"
							style="border-color: skyblue; background-color: skyblue; color: white; width: 150px; height: 50px; font-size:large;text-align: center;">

							<option value="title">제목</option>

							<option value="content">본문</option>

							<option value="genre">장르</option>

						</select>

					</div>
		<div class="w300" style="padding-right: 10px">
			<input type="text" class="form-control form-control-sm" name="keyword" id="keyword"
			style="border-color: white; border-bottom-color: skyblue; width: 600px; height: 50px; font-size: large;">
		</div>
		<div>
		<button class="btn btn-sm btn-primary" name="btnSearch"	id="btnSearch" style="width: 150px; height: 50px; font-size: large;">검색</button>
		</div>
		</div>
	</div>
</form>

			<div style="padding-right: 45%; padding-left: 420px">
				<h1 style="color: red;">THIS'S HOT</h1>
				<hr style="border-color: orange;">
			</div>
			<c:forEach items="${list2 }" var="row">
				<div class="imgBoxDiv" style="float: left; margin: 50px;">
					<div class="imgDiv">
						<a href="./detail?no=${row.bno }"><img alt=""
							src="./upload/${row.file }" style="width: 100%; height: 100%;"></a>
					</div>
					<div class="imgDescDiv">평점:${row.average }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;조회수:${row.views }</div>
				</div>
			</c:forEach>
		</div>

		<div style="padding-bottom: 1000px;">
			<div style="padding-right: 45%; padding-left: 420px">
				<h1 style="color: blue;">THIS'S FUN</h1>
				<hr style="border-color: orange;">
			</div>
			<c:forEach items="${list3 }" var="row">
				<div class="imgBoxDiv" style="float: left; margin: 50px;">
					<div class="imgDiv">
						<a href="./detail?no=${row.bno }"><img alt=""
							src="./upload/${row.file }" style="width: 100%; height: 100%;"></a>
					</div>
					<div class="imgDescDiv">평점:${row.average }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;조회수:${row.views }</div>
				</div>
			</c:forEach>
		</div>

		
					
				</div>
				<div class="footer" style="position: static; bottom: 0;">
					<%@include file="footer.jsp"%>
				</div>

</body>
</html>
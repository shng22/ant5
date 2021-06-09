<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Grayscale - Start Bootstrap Theme</title>
<link rel="icon" type="image/x-icon" href="./images/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Varela+Round"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />

<style rel="stylesheet">
html, body {
  background: #fff;
  width: 100%;
  height: 100%;
  overflow: hidden;
  cursor: default;
  -webkit-user-select: none;
     -moz-user-select: none;
      -ms-user-select: none;
          user-select: none;
  font-family: 'PT Sans', sans-serif;
}

.title {
  font-size: 10vw;
  font-weight: 700;
  text-align: center;
  margin-top: 15%;
  color: #444;
}

.subtitle {
  font-size: 4vw;
  color: #777;
  font-weight: normal;
  text-align: center;
  margin-top: 0;
}

.credit {
  position: absolute;
  bottom: 5px;
  width: 100%;
  display: block;
  text-align: center;
  color: #777;
}
.credit > a {
  color: #777;
}

.particle-count {
  display: block;
  text-align: center;
  margin: 25px 0;
  color:white;
  font-size: xx-large;
}

.particles > .particle {
  border-radius: 100%;
  background: transparent;
  position: absolute;
  background-size: 100% 100%;
  background-repeat: no-repeat;
}
.particles > .particle.smaller {
  width: 5px;
  height: 5px;
}
.particles > .particle.small {
  width: 10px;
  height: 10px;
}
.particles > .particle.normal {
  width: 15px;
  height: 15px;
}
.particles > .particle.big {
  width: 20px;
  height: 20px;
}
.particles > .particle.bigger {
  width: 25px;
  height: 25px;
}

</style>
</head>
<body>

<div class='particle-count' >
  <span class='number' >0</span>
  Particles
</div>
<span class='credit'>
  Created by
  <a href='https://twitter.com/Shawn_Sauce' target='_blank'>Shawn G.</a>
</span>
<div class='particles'></div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
<script type="text/javascript">
var d = document,
  $d = $(d),
  w = window,
  $w = $(w),
  wWidth = $w.width(),
  wHeight = $w.height(),
  credit = $('.credit > a'),
  particles = $('.particles'),
  particleCount = 0,
  sizes = [
    15, 20, 25, 35, 45
  ],
  colors = [
    '#f44336', '#e91e63', '#9c27b0', '#673ab7', '#3f51b5',
    '#2196f3', '#03a9f4', '#00bcd4', '#009688', '#4CAF50',
    '#8BC34A', '#CDDC39', '#FFEB3B', '#FFC107', '#FF9800',
    '#FF5722', '#795548', '#9E9E9E', '#607D8B', '#777777'
  ],

  mouseX = $w.width() / 2,
  mouseY = $w.height() / 2;

function updateParticleCount() {
  $('.particle-count > .number').text(particleCount);
};

$w
  .on('resize', function() {
    wWidth = $w.width();
    wHeight = $w.height();
  });

$d
  .on('mousemove touchmove', function(event) {
    event.preventDefault();
    event.stopPropagation();
    mouseX = event.clientX;
    mouseY = event.clientY;
    if (!!event.originalEvent.touches) {
      mouseX = event.originalEvent.touches[0].clientX;
      mouseY = event.originalEvent.touches[0].clientY;
    }
  })
  .on('mousedown touchstart', function(event) {
    if (event.target === credit.get(0)) {
      return;
    }
    mouseX = event.clientX;
    mouseY = event.clientY;
    if (!!event.originalEvent.touches) {
      mouseX = event.originalEvent.touches[0].clientX;
      mouseY = event.originalEvent.touches[0].clientY;
    }
    var timer = setInterval(function() {
      $d
        .one('mouseup mouseleave touchend touchcancel touchleave', function() {
          clearInterval(timer);
        })
      createParticle(event);
    }, 1000 / 60)

  });

function createParticle(event) {
  var particle = $('<div class="particle"/>'),
    size = sizes[Math.floor(Math.random() * sizes.length)],
    color = colors[Math.floor(Math.random() * colors.length)],
    negative = size / 2,
    speedHorz = Math.random() * 10,
    speedUp = Math.random() * 25,
    spinVal = 360 * Math.random(),
    spinSpeed = ((36 * Math.random())) * (Math.random() <= .5 ? -1 : 1),
    otime,
    time = otime = (1 + (.5 * Math.random())) * 1000,
    top = (mouseY - negative),
    left = (mouseX - negative),
    direction = Math.random() <= .5 ? -1 : 1,
    life = 10;

  particle
    .css({
      height: size + 'px',
      width: size + 'px',
      top: top + 'px',
      left: left + 'px',
      background: color,
      transform: 'rotate(' + spinVal + 'deg)',
      webkitTransform: 'rotate(' + spinVal + 'deg)'
    })
    .appendTo(particles);
  particleCount++;
  updateParticleCount();

  var particleTimer = setInterval(function() {
    time = time - life;
    left = left - (speedHorz * direction);
    top = top - speedUp;
    speedUp = Math.min(size, speedUp - 1);
    spinVal = spinVal + spinSpeed;

    particle
      .css({
        height: size + 'px',
        width: size + 'px',
        top: top + 'px',
        left: left + 'px',
        opacity: ((time / otime) / 2) + .25,
        transform: 'rotate(' + spinVal + 'deg)',
        webkitTransform: 'rotate(' + spinVal + 'deg)'
      });

    if (time <= 0 || left <= -size || left >= wWidth + size || top >= wHeight + size) {
      particle.remove();
      particleCount--;
      updateParticleCount();
      clearInterval(particleTimer);
    }
  }, 1000 / 50);
}
</script>

</head>


<script type="text/javascript">

var trailimage=["./images/ants.png", 400, 100]  //이미지 경로 설정
var offsetfrommouse=[0,5]  //커서와 이미지의 간격
var displayduration=0 


if (document.getElementById || document.all)
	document.write('<div id="trailimageid" style="position:absolute;visibility:visible;left:0px;top:0px;width:1px;height:1px"><img src="'+trailimage[0]+'" border="0" width="'+trailimage[1]+'px" height="'+trailimage[2]+'px"></div>')

function gettrailobj(){
	if (document.getElementById)
		return document.getElementById("trailimageid").style
	else if (document.all)
		return document.all.trailimagid.style
}

function truebody(){
	return (!window.opera && document.compatMode && document.compatMode!="BackCompat")? document.documentElement : document.body
}

function hidetrail(){
	gettrailobj().visibility="hidden"
	document.onmousemove=""
}

function followmouse(e){
var xcoord=offsetfrommouse[0]
var ycoord=offsetfrommouse[1]
	if (typeof e != "undefined"){
		xcoord+=e.pageX
		ycoord+=e.pageY
	}
	else if (typeof window.event !="undefined"){
		xcoord+=truebody().scrollLeft+event.clientX
		ycoord+=truebody().scrollTop+event.clientY
	}

var docwidth=document.all? truebody().scrollLeft+truebody().clientWidth : pageXOffset+window.innerWidth-15
var docheight=document.all? Math.max(truebody().scrollHeight, truebody().clientHeight) : Math.max(document.body.offsetHeight, window.innerHeight)

	if (xcoord+trailimage[1]+3>docwidth || ycoord+trailimage[2]> docheight)
		gettrailobj().display="none"
		else 
			gettrailobj().display=""
			gettrailobj().left=xcoord+"px"
			gettrailobj().top=ycoord+"px"
	}
	document.onmousemove=followmouse

if (displayduration>0)
	setTimeout("hidetrail()", displayduration*1000)
</script>



<style type="text/css">
body{
background-color: black;
}
.hov-anim-box{
margin-top: 10%;
widht: 500px;
height: 200px;
}
.hov-anim-box .animated {
  display: none
}




</style>
</head>


<body id="page-top">
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top"
		id="mainNav">
		<div class="container">
		<!--  <img at="" src="./images/muu123.mp4">--> 
		 <div class='container'>
</div>
			<a class="navbar-brand js-scroll-trigger" href="#page-top" ></a>
		
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
		</div>
	</nav>
	<!-- Masthead-->
	<header class="masthead">
		<div class="container d-flex h-100 align-items-center">
			<div class="mx-auto text-center">
				<h1 class="mx-auto my-0 text-uppercase" style="color: white;background-color: black;">리뷰의 모든것</h1>
				<br>
				<h2 class="text-white-50 mx-auto mt-2 mb-5">Reviews for you</h2>
				<a class="btn btn-primary js-scroll-trigger" href="/web/main">Get
					Started</a>
					<div class="jb">
	 <span class="hov-anim-box" >
	 <br><br><br><br><br>
  <img src="./images/muu129.gif" alt="" class="static">
  <img src="./images/muu128.gif" alt="" class="animated">
</span>
    
			</div>
		</div>
	</header>
</body>
</html>

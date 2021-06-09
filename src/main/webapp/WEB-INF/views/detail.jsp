<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>


<style type="text/css">
body{
background: rgb(255,255,255);
background: radial-gradient(circle, rgba(255,255,255,1) 0%, rgba(251,253,255,1) 100%);
}
#total{
margin-left: 10%;
}

#write {
	margin: 0 auto;
	margin-top: 10px;
	height: auto;
	min-height: 200px;
	width: 500px;
	background-color: #c0c0c0;
}

div {
	padding-left: 70px;
	padding-right: 70px;
	float: left;
}

button {
	background-color: #4CAF50;
	color: white;
	border: 2px solid #4CAF50;
	transition-duration: 0.4s;
}

}
button:hover {
	background-color: white;
	color: black;
}

#commentInput {
	margin: 0 auto;
	margin-top: 60px;
	width: 100%;
	min-height: 80px;
	vertical-align: middle;
}

#commentInput textarea {
	margin: 0;
	padding: 5px;
	min-height: 100px;
	vertical-align: middle;
	width: 100%;
	overflow-y: scroll;
	overflow-x: hidden;
}

#commentInput button {
	width: 100%;
	vertical-align: middle;
	margin-bottom: 50px;
}

#comment {
	margin: 0 auto;
	margin-top: 10px;
	width: 100%;
	height: auto;
	min-height: 10px;
}

#commentWrite {
	margin: 0 auto;
	height: 100px;
	margin-top: 5px;
	width: 500px;
	text-align: center;
}

#cc {
	margin: 0 auto;
	width: 500px;
	height: auto;
	padding-left: 25px;
	min-height: 10px;
}

#review {
	width: 100%;
	height: 100%;
	float: none;
}

table {
	text-align: justify;
	white-space: pre-wrap;
}

tr {
	height: 55px;
	text-align: left;
}
h4{
color:red;
}

#star a {
	text-decoration: none;
	color: gray;
}

#star a.on {
	color: red;
}

.rating .rate_radio+label {
	position: relative;
	display: inline-block;
	margin-left: -4px;
	z-index: 10;
	width: 60px;
	height: 60px;
	background-image: url('./images/starrate.png');
	background-repeat: no-repeat;
	background-size: 60px 60px;
	cursor: pointer;
	background-color: #f0f0f0;
}

.rating .rate_radio:checked+label {
	background-color: #ff8;
}

.wrap {
	max-width: 480px;
	margin: 0 auto; /* 화면 가운데로 */
	background-color: #fff;
	height: 100%;
	padding: 20px;
	box-sizing: border-box;
}

.reviewform textarea {
	width: 100%;
	padding: 10px;
	box-sizing: border-box;
}

.rating .rate_radio {
	position: relative;
	display: inline-block;
	z-index: 20;
	opacity: 0.001;
	width: 60px;
	height: 60px;
	background-color: #fff;
	cursor: pointer;
	vertical-align: top;
	display: none;
}

.rating .rate_radio+label {
	position: relative;
	display: inline-block;
	margin-left: -4px;
	z-index: 10;
	width: 60px;
	height: 60px;
	background-image: url('./images/starrate.png');
	background-repeat: no-repeat;
	background-size: 60px 60px;
	cursor: pointer;
	background-color: #f0f0f0;
}

.rating .rate_radio:checked+label {
	background-color: #ff8;
}

.warning_msg {
	display: none;
	position: relative;
	text-align: center;
	background: #ffffff;
	line-height: 26px;
	width: 100%;
	color: red;
	padding: 10px;
	box-sizing: border-box;
	border: 1px solid #e0e0e0;
}


</style>

<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script type="text/javascript">
	function update(no, title){
		if(confirm(title + "글을 수정하시겠습니까?")){
			location.href='update?bno='+no;	
		}
	}
	function del(no, title){
		if(confirm(title + "글을 삭제하시겠습니까?")){
			location.href='./delete?bno='+no;
		}
	}
	function cdel(no, rno){
		if(confirm("리뷰를 삭제하시겠습니까?")){
			location.href='cdel?bno='+no+'&rno='+rno;
		}
	}
	function cupdate(no, rno){
		if(confirm("리뷰를 수정하시겠습니까?")){
			location.href='cupdate?bno='+no+'&rno='+rno;
		}
	}
	
	$(document).ready(function(){
		$(".commentInput").click(function(){
			if(${sessionScope.grade != 9 && sessionScope.grade != 6 && sessionScope.grade != 5}){
				alert("로그인해주세요")
				location.href='login';
			}
		})
	})
	
	
        var alert_select_value = function (select_obj){
            var selected_index = select_obj.selectedIndex;
            var selected_value = select_obj.options[selected_index].value;
        };
	
</script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js"></script>

</head>
<body>
	<%@include file="menu.jsp"%>
	<div id="total" style="width: 80%;">
		<div id="detail" float="left">
			<h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${dto.title }</h1>
			<hr style="border: 1px solid gray; width: 88%;">
			<c:forEach items="${list }" var="row">
				<c:if test="${row.bno eq bno}">
					<div style="border: none; padding-right: 0; width: 500px; margin-left: 20%;">
						<img alt="" src="./upload/${row.file }"
							style="width: 100%; height: 550px;">
					</div>
					<div style="width: 100%; margin-left: 0; padding-left: 120px;">
						<table>
							<tr>
								<td id="al"><B>등급</B></td>
								<td style="padding-left: 40px;">${row.grade }</td>
							</tr>
							<tr>
								<td id="al" style="width: 100px;"><B>상영날짜</B></td>
								<td style="padding-left: 40px;">${row.rundate }</td>
							</tr>
							<tr>
								<td id="al"><B>출연진</B></td>
								<td style="padding-left: 40px;">${row.actor }</td>
							</tr>
							<tr>
								<td id="al"><B>상영시간</B></td>
								<td style="padding-left: 40px;">${row.runtime }</td>
							</tr>
							<tr>
								<td id="al"><B>줄거리</B></td>
								<td style="padding-left: 40px;">${row.content }</td>
							</tr>
							<c:if
								test="${sessionScope.grade eq 9 || sessionScope.grade eq 6}">
								<button onclick="update(${row.bno }, '${row.title }')"
									style="font-size: 20px">수정</button>
								<button onclick="del(${row.bno }, '${row.title }')"
									style="font-size: 20px">삭제</button>
							</c:if>
						</table>
					</div>
				</c:if>
			</c:forEach>
		</div>

		<div id="review">
			<div id="commentInput" class="commentInput">
				<form action="./comment" method="post">
				
					<h4> 나의 별점 !!</h4><select name="rating" id="select1"
						onchange="alert_select_value(this);">
						<option value="1">☆☆☆☆★</option>
						<option value="2">☆☆☆★★</option>
						<option value="3">☆☆★★★</option>
						<option value="4">☆★★★★</option>
						<option value="5">★★★★★</option>
					</select><br>
					<br>
					<textarea name="comment" placeholder="나의 리뷰를 적어주세요!"></textarea>
					<button>등록</button>
					<input type="hidden" name="no" id="bno" value="${dto.bno }">
					<h3 style="color: orange;">관람후기(${dto.COUNT})&nbsp;&nbsp;&nbsp;평점(${dto.average })</h3>
					<hr style="border: 1px solid gray;">
				</form>
			</div>
			<div style="padding-left: 0">
				<c:forEach items="${comment }" var="c">
					<div id="comment" class="ccomment" style="float: none;">
						${c.member_nickname } | ${c.r_date } | ${c.r_rate }점 <br> <br>
						<br>${c.r_content }

						<c:if test="${sessionScope['no'] eq c.member_no }">
							<button onclick="cupdate(${c.bno }, '${c.rno }')">수정</button>
							<button onclick="cdel(${c.bno }, '${c.rno }')">삭제</button>
						</c:if>
						<hr>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>
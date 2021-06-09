<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<script type="text/javascript">
	function write1() {
		var title = document.getElementById('title').value;
		var content = document.getElementById('content').value;
		var grade = document.getElementById('grade').value;
		var rundate = document.getElementById('rundate').value;
		var runtime = document.getElementById('runtime').value;
		var actor = document.getElementById('actor').value;
		var genre = document.getElementById('genre').value;
		var type = document.getElementById('type').value;
		if (title == null || title == "") {
			alert("제목을 입력하세요.");
			document.getElementById('title').focus();
			return false;
		}
		if (content == null || content == "") {
			alert("내용을 입력하세요.");
			document.getElementById('content').focus();
			return false;
		}
		if (grade == null || grade == "") {
			alert("등급을 입력하세요.");
			document.getElementById('grade').focus();
			return false;
		}
		if (actor == null || actor == "") {
			alert("출연진을 입력하세요.");
			document.getElementById('actor').focus();
			return false;
		}
		if (genre == null || genre == "") {
			alert("장르를 입력하세요.");
			document.getElementById('genre').focus();
			return false;
		}
		if (rundate == null || rundate == "") {
			alert("상영날짜를 입력하세요.");
			document.getElementById('rundate').focus();
			return false;
		}
		if (runtime == null || runtime == "") {
			alert("상영시간을 입력하세요.");
			document.getElementById('runtime').focus();
			return false;
		}
		if (type == null || type == "") {
			alert("종류를 입력하세요.");
			document.getElementById('type').focus();
			return false;
		}
		if (!confirm("저장?")) {
			return false;
		}
	}
</script>
</head>

<body>
	<%@include file="menu.jsp"%>

	<div id="write">
		<form action="./write" method="post" onsubmit="return write1()"
			enctype="multipart/form-data">
			<div class="form-group">
				<label for="exampleFormControlInput1">제목</label> <input type="text"
					class="form-control" id="exampleFormControlInput1" name="title"
					placeholder="제목을 작성해주세요.">
			</div>
			<div class="form-group">
				<label for="exampleFormControlInput1">등급</label> <input type="text"
					class="form-control" id="exampleFormControlInput1" name="grade"
					placeholder="제목을 작성해주세요.">
			</div>
			<div class="form-group">
				<label for="exampleFormControlInput1">출연진</label> <input type="text"
					class="form-control" id="exampleFormControlInput1" name="actor"
					placeholder="출연진">
			</div>
			<div class="form-group">
				<label for="exampleFormControlInput1">장르</label> <input type="text"
					class="form-control" id="exampleFormControlInput1" name="genre"
					placeholder="장르">
			</div>
			<div class="form-group">
				<label for="exampleFormControlInput1">공연시간</label> <input
					type="text" class="form-control" id="exampleFormControlInput1"
					name="runtime" placeholder="공연시간">
			</div>
			<div class="form-group">
				<label for="exampleFormControlInput1">공연날짜</label> <input
					type="text" class="form-control" id="exampleFormControlInput1"
					name="rundate" placeholder="공연날짜">
			</div>
			<div class="form-group">
				<label for="exampleFormControlInput1">종류</label> <input type="text"
					class="form-control" id="exampleFormControlInput1" name="type"
					placeholder="1:공연 or 2:콘서트 or 3:대학로">
			</div>
			<div class="form-group">
				<label for="exampleFormControlInput1">줄거리</label>
				<textarea class="form-control" id="exampleFormControlInput1"
					name="content" placeholder="줄거리" style="height: 200px;"></textarea>
			</div>
			<div class="form-group">
				<label for="exampleFormControlInput1">포스터</label> <input type="file"
					id="exampleFormControlInput1" name="file">
			</div>
			<button type="submit" class="btn btn-info">글쓰기</button>
		</form>
	</div>


</body>
</html>
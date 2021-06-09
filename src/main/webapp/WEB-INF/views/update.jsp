<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<style type="text/css">
button {
	background-color: #4CAF50;
	color: white;
	border: 2px solid #4CAF50;
	transition-duration: 0.4s;
}
</style>
<script type="text/javascript">
	function update2() {
		var title = document.getElementById('title').value;
		var content = document.getElementById('content').value;
		if (title == null || title == "" || title.length < 1) {
			alert("제목을 입력해주세요");
			document.getElementById('title').focus();
			return false;
		}
		if (content == null || content == "" || content.length < 1) {
			alert("줄거리를 입력해주세요");
			document.getElementById('content').focus();
			return false;
		}
		if (grade == null || grade == "" || content.length < 1) {
			alert("등급을 입력해주세요");
			document.getElementById('grade').focus();
			return false;
		}
		if (rundate == null || rundate == "" || content.length < 1) {
			alert("상영날짜를 입력해주세요");
			document.getElementById('rundate').focus();
			return false;
		}
		if (runtime == null || runtime == "" || content.length < 1) {
			alert("상영시간을 입력해주세요");
			document.getElementById('runtime').focus();
			return false;
		}
		if (actor == null || actor == "" || content.length < 1) {
			alert("출연자를 입력해주세요");
			document.getElementById('actor').focus();
			return false;
		}
		if (genre == null || genre == "" || content.length < 1) {
			alert("장르를 입력해주세요");
			document.getElementById('genre').focus();
			return false;
		}
		if (type == null || type == "" || content.length < 1) {
			alert("어떤 게시물인가요?");
			document.getElementById('type').focus();
			return false;
		}
		if (!confirm("수정하시겠습니까?")) {
			return false;
		}
	}
</script>
</head>
<body>
	<%@include file="menu.jsp"%>
	<div id="write">
		<form action="./update" method="post" onsubmit="return update2();"
			enctype="multipart/form-data">
			<div class="form-group">
				<label for="exampleFormControlInput1">제목</label> <input type="text"
					class="form-control" id="exampleFormControlInput1" name="title"
					value="${dto.title }" placeholder="제목을 작성해주세요.">
			</div>
			<div class="form-group">
				<label for="exampleFormControlInput1">등급</label> <input type="text"
					class="form-control" id="exampleFormControlInput1" name="grade"
					value="${dto.grade }" placeholder="제목을 작성해주세요.">
			</div>
			<div class="form-group">
				<label for="exampleFormControlInput1">출연진</label> <input type="text"
					class="form-control" id="exampleFormControlInput1" name="actor"
					value="${dto.actor}" placeholder="출연진">
			</div>
			<div class="form-group">
				<label for="exampleFormControlInput1">장르</label> <input type="text"
					class="form-control" id="exampleFormControlInput1" name="genre"
					value="${dto.genre }" placeholder="장르">
			</div>
			<div class="form-group">
				<label for="exampleFormControlInput1">공연시간</label> <input
					type="text" class="form-control" id="exampleFormControlInput1"
					name="runtime" value="${dto.runtime }" placeholder="공연시간">
			</div>
			<div class="form-group">
				<label for="exampleFormControlInput1">공연날짜</label> <input
					type="text" class="form-control" id="exampleFormControlInput1"
					name="rundate" value="${dto.rundate }" placeholder="공연날짜">
			</div>
			<div class="form-group">
				<label for="exampleFormControlInput1">종류</label> <input type="text"
					class="form-control" id="exampleFormControlInput1" name="type"
					value="${dto.type }" placeholder="1:공연 or 2:콘서트 or 3:대학로">
			</div>
			<div class="form-group">
				<label for="exampleFormControlInput1">줄거리</label>
				<textarea class="form-control" id="exampleFormControlInput1"
					name="content" placeholder="줄거리" style="height: 200px;">${dto.content }</textarea>
				<input type="hidden" class="form-control"
					id="exampleFormControlInput1" name="bno" id="bno"
					value="${dto.bno }">
			</div>
			<button type="submit" class="btn btn-info">수정하기</button>
		</form>
	</div>

</body>
</html>
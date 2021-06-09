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

#write {
	padding-left: 30%;
	padding-top: 100px;
}

textarea {
	width: 500px;
	height: 200px;
}
</style>
<script type="text/javascript">
	function cupdate() {
		var content = document.getElementById('r_content').value;
		if (content == null || content == "" || content.length < 1) {
			alert("리뷰를 써주세요");
			document.getElementById('r_content').focus();
			return false;
		}
		if (!confirm("리뷰를 수정하시겠습니까?")) {
			return false;
		}
	}
</script>
</head>
<body>
	<%@include file="menu.jsp"%>
	<div id="write">
		<form action="./cupdate" method="post" onsubmit="return cupdate();">
			<textarea name="r_content" id="r_content">${dto.r_content }</textarea>
			<input type="hidden" class="form-control" name="bno" id="bno"
				value="${dto.bno }"> <input type="hidden"
				class="form-control" id="exampleFormControlInput1" name="rno"
				id="rno" value="${dto.rno }"> <br>
			<button type="submit" class="btn btn-info">수정하기</button>
		</form>
	</div>




</body>
</html>
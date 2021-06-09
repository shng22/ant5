<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
</head>
<script type="text/javascript">
	var alert_select_value = function(select_obj) {
		var selected_index = select_obj.selectedIndex;
		var selected_value = select_obj.options[selected_index].value;
		if (confirm(("등급을") + selected_value + ("변경하시겠습니까?"))) {
			alert("확인");
		} else {
			(alert("아니오를 누르셨습니다."));
			return false;
		}

	};
</script>
<style>
tr:hover{
 background-color: #D9E5FF;
 font-weight: bold;
}


input{

margin: 100%; 
}
button{
color: white;
background-color: #FF3636;
font-weight: bold;

}

</style>
<body>
	<%@include file="menu.jsp"%>
	<div align="center">
		<table border=1 width=100%; >
			<tr style="background-color: #002266; color: white; text-align: center; font-family: sans-serif; font-weight: bold;">
				<td>번호</td>
				<td>이름</td>
				<td>닉네임</td>
				<td>등급</td>
				<td>등급변경</td>
				<td>강제탈퇴</td>
				</div>
				<c:forEach items="${list }" var="list">
					<tr style="text-align: center; font-family: sans-serif; cursor:pointer; border-radius: 30px; color:black;">
						<td style="background-color: #EAEAEA; color:black; ">${list.member_no }</td>
						<td>${list.member_name }</td>
						<td>${list.member_nickname }</td>
						<td >${list.member_grade }</td>
						<td><select member_grade="edit"
							onchange="alert_select_value(this);">
								<option id="관리자" value="9">9</option>
								<option id="운영자" value="6">6</option>
								<option id="회원" value="5">5</option>
								<option id="비회원" valute="1">1</option>
						</select>
						<td><button onclick="location.href='delete1?no=${list.member_no}'" > 삭제 </button></td>
					</tr>
				</c:forEach>
		</table>
	</div>



</body>
<%@include file="footer.jsp"%>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
</head>
<link rel="stylesheet"	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/jquery-ui-i18n.min.js"></script>
	
<style type="text/css">

table {
    background-color: white;
	margin-left: 30%;
	height: 400px;
	border-radius: 25px;
}

th {
    padding-left: 3%;
	border-color: transparent;
	height: 10px;
}

td {
	border-color: transparent;
}
h1{

margin-top: 10%;
text-align: center;
}
h5{
margin-top: 10%;
text-align: center;
}
#MyCheBut {
	padding-left: 30%;
	padding-top: 2%;
}
footer{
color:black;
}
</style>
</head>
<body>
<%@include file="menu.jsp"%>
			
			<br><br><br>
			
				<h1>마이 페이지</h1>
			<br><br>
			<caption>
				<h5>${sessionScope.name }님반갑습니다</h5>
			</caption>
	<form action="./update3" method="post" id="mypage">
		<table border="2" bordercolor="white">
			<tbody>
					<th bordercolor="white" width="120">아이디</th>
					<td colspan="2" bordercolor="white" width="500"><input
						type="text" name="id" id="id" value="${sessionScope.id }"
						disabled="disabled"
						style="width: 90%; border-radius: 5px; margin-right: 5%"></td>
				</tr>


				<tr>
					<th bordercolor="white" width="120">닉네임</th>
					<td colspan="2" bordercolor="white" width="500"><input
						type="text" name="nickname" id="nickname"
						value="${sessionScope.member_nickname }"
						 onfocus="this.value='';"
						style="width: 90%; border-radius: 5px"></td>​
				</tr>

				<tr>
					<th bordercolor="white" width="">비밀번호</th>
					<td colspan="2" bordercolor="white" width="500"><input
						type="password" name="pw" id="pw" value="${sessionScope.pw }"
						onfocus="this.value='';" style="width: 90%; border-radius: 5px">

					</td>
				</tr>
				<tr>
					<th bordercolor="white" width="120">휴대폰 번호</th>
					<td colspan="2" bordercolor="white" width="500"><input
						type="text" name="ph" id="ph" value="${sessionScope.cp }"
						onfocus="this.value='';" style="width: 90%; border-radius: 5px">
					</td>
				<tr>
					<th bordercolor="white" width="120">이메일</th>
					<td colspan="2" bordercolor="white" width="500"><input
						type="text" name="email" id="email" value="${sessionScope.email }"
						onfocus="this.value='';" style="width: 90%; border-radius: 5px">
				</tr>
				
				</table>
			</tbody>
	</form>
          <button  type="submit" 
		style="margin-left: 50%; 
		background-color: #AAD34A;
		border:1px;
		color: white;
		border-radius: 5px;
		padding: 15px;
		font-weight: bold;
		text-align: center;"> 수정 </button>


<%@include file="footer.jsp"%>
</body>
</html>

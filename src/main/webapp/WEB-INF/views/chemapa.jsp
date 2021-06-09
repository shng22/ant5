<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>확인 마이 페이지 </title>
</head>
<body>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
	<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
	<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/jquery-ui-i18n.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.slim.js"
	integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY="
	crossorigin="anonymous"></script>
<style type="text/css">

table{
 margin-left: 30%;
 width: 550px;
 height:300px;
 border-radius:25px;
}
th{
 border-color: transparent;
 height: 10px;
}
td{
 border-color: transparent;
}
#MyCheBut{
 padding-left: 45%;
 padding-top: 2%;
}
</style>
</head>

<body>

<form action="./mapa" method="post" onsubmit="return chemapa();">
		<table border="2" bordercolor="white" > 
<tbody>
    <tr>
    <th colspan="2">
    <form>
      <c:choose>
		<c:when test="${sessionScope.name ne null }">
			<li><h2>${sessionScope.name }님 반갑습니다.</h2>
		</c:when>
		<c:when test="${sessionScope.id ne null }">
			<li><h2>${sessionScope.id }님 반갑습니다.</h2>
		</c:when>
		<c:otherwise>
		</c:otherwise>
	</c:choose>
	</form> 
	</th>	 	
	</tr>
	<tr>
    <th colspan="2">
    <form>
	<h1 style="color:orange">마이 페이지</h1>
	</form> 
	</th>	 	
	</tr>
	<tr>
    <th colspan="2">
    <form>
	<h5>나의 개인 정보 확인 및 수정을 원하시면 비밀번호를 한 번더 입력해 주세요.</h5>
	</form> 
	</th>	 	
	</tr>
	<td colspan="2" bordercolor="white" width="450">
	<input type="text" name="email1" value="비밀번호를 입력해주세요." onfocus="this.value='';" 
	       style="width:80%; height:20px; border-radius:5px; margin-left:10%;">
	</td>
    <tr>
    <td colspan="2">
	<div id="MyCheBut">
	<button>확인</button>
    </div>
    </td>	
     </tr>
	</tbody>	
	</table>
</form>


</body>
</html>

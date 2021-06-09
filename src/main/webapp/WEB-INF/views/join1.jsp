<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회 원 가 입</title>
<link rel="stylesheet" href="./css/main.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	function pw1() {
		var pw = $("#pw").val();
		var id = $("#id").val();

		var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
		var hangulcheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;

		if (false === reg.test(pw)) {
			alert('비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.');
		} else if (/(\w)\1\1\1/.test(pw)) {
			alert('같은 문자를 4번 이상 사용하실 수 없습니다.');
			return false;
		} else if (pw.search(id) > -1) {
			alert("비밀번호에 아이디가 포함되었습니다.");
			return false;
		} else if (pw.search(/\s/) != -1) {
			alert("비밀번호는 공백 없이 입력해주세요.");
			return false;
		} else if (hangulcheck.test(pw)) {
			alert("비밀번호에 한글을 사용 할 수 없습니다.");
		} else {
			console.log("통과");
		}
	}
	function email1() {
		alert(" 이메일 전부 작성해주세요 ");
		var email = $("#email").val();
		if (email.length < 12) {
			return false;
		}
	}
</script>
<script type="text/javascript">
	function join1btn() {
		var name = $("#name").val();
		var id = $("#id").val();
		var nickname = $("#nickname").val();
		var pw = $("#pw").val();
		var pw2 = $("#pw2").val();
		var cp = $("#cp").val();
		var email = $("#email").val();

		if (name == "") {
			alert("성함을 적어주세요");
			$("#name").focus();
			return false;
		}
		if (id == "") {
			alert("id를 적어주세요");
			$("id").focus();
			return false;
		}
		if (nickname == "") {
			alert("닉네임을 적어주세요");
			$("#nickname").focus();
			return false;
		}
		if (pw == "") {
			alert("비밀번호를 적어주세요");
			$("pw").focus();
			return false;
		}
		if (pw2 == "") {
			alert("위와 같이 적어주세요");
			$("pw2").focus();
			return false;
		}
		if (cp == "") {
			alert("전화번호를 적어주세요");
			$("#ph").focus();
			return false;
		}
		if (email == "") {
			alert("이메일 주소를 적어주세요");
			$("email").focus();
			return false;
		}

		var params = $("#frm").serialize();
	}

	function idck() {
		var idck = 0;
		var id = $("#id").val();
		if (id.length > 4) {
			$.ajax({

				type : "POST",
				url : "./idck?id=" + id,
				dataType : "json",
				contentType : "aplication/json; charset UTF-8",
				success : function(data) {
					if (data > 0) {
						alert("현재 사용중인 아이디 입니다.");
						if ($("#yesid").is(":visible")) {
							$("#yesid").css('display', 'none');
						}
						$("#noid").css('display', 'block');
						$("#noid").css('color', 'red');
						$("#id").val("");
						$("#idck").val("");
						$("#id").css('border', '3px solid red');
						$("#id").focus();
					} else {
						alert("사용가능한 아이디입니다");
						if ($("#noid").is(":visible")) {
							$("#noid").css('display', 'none');
						}
						$("#yesid").css('display', 'block');
						$("#yesid").css('color', 'navy');
						$("#id").css('border', '3px solid #0466e1');
					}
					return false;
				},
				error : function(error) {
					alert("사용중인 아이디 입니다 ");
					return false;
				}
			});

		} else {
			alert("아이디는 4자 이상입니다");
			$("#id").focus();
			return false;
		}

	}
	function nick() {
		var nick = 0;
		var nickname = $("#nickname").val();
		if (nickname.length > 2) {
			$.ajax({

				type : "POST",
				url : "./nick?nickname=" + nickname,
				dataType : "json",
				contentType : "aplication/json; charset UTF-8",
				success : function(data) {
					if (data > 0) {
						alert("현재 사용중인 닉네임 입니다.");
						if ($("#yesni").is(":visible")) {
							$("#yesni").css('display', 'none');
						}
						$("#noni").css('display', 'block');
						$("#noni").css('color', 'red');
						$("#nickname").val("");
						$("#nick").val("");
						$("#nickname").css('border', '3px solid red');
						$("#nickname").focus();
					} else {
						alert("사용가능한 닉네임 입니다");
						if ($("#noid").is(":visible")) {
							$("#noid").css('display', 'none');
						}
						$("#yesni").css('display', 'block');
						$("#yesni").css('color', 'navy');
						$("#nickname").css('border', '3px solid #0466e1');
					}
					return false;
				},
				error : function(error) {
					alert("사용중인 닉네임 입니다 ");
					return false;
				}
			});

		} else {
			alert("닉네임은 2자 이상입니다");
			$("#nickname").focus();
			return false;
		}

	}
</script>

<style type="text/css">
body{
background-image: url("./images/mapa.jpg");
background-size: 100%
}
input {
	width: 50%;
}
</style>
</head>
<%@include file="menu.jsp"%>

<body>

	<div class="join">
		<div class="join_form" style="padding-left: 30%;">
			<form action="./join2" onsubmit="return join1btn()" method="post"
				id="frm">
				<p>
					<label> 성 함 </label><br> <input type="text" id="name"
						name="member_name"> <span id="name"></span>
				</p>
				<p>
					<label> 아이디 </label><br> <input type="text" id="id"
						name="member_id" onclick="return idck()"> <span id="id"></span>
				</p>
				<div id="noid" style="display: none;">사용중인 아이디 입니다!</div>
				<div id="yesid" style="display: none;">사용가능 아이디 입니다!!</div>
				<p>
					<label> 닉네임 </label><br> <input type="text" id="nickname"
						name="member_nickname" onclick="return nick()"> <span
						id="nickname"></span>
				</p>
				<div id="noni" style="display: none;">사용중인 닉네임 입니다!</div>
				<div id="yesni" style="display: none;">사용가능 닉네임 입니다!!</div>
				<p>
					<label> 비밀번호 </label><br> <input type="password" id="pw"
						name="member_pw" onchange="return pw1()"> <span
						id="confirmMsg"></span>
				</p>
				<p>
					<label> 비밀번호 확인 </label><br> <input type="password" id="pw2"
						name="member_pw2"> <span id="confirmMsg"></span>
				</p>


				<p>
					<label> 전화번호 </label><br> <input type="number" id="cp"
						name="member_cp"> <span id="cp"></span>
				</p>
				<p>
					<label> 이메일 </label><br> <input type="text" id="email"
						name="member_email" onchange="return email1()"
						placeholder="hgd1900@google.com"> <span id="email"></span>
				</p>
				<br> <br>
				<button type="submit"
					style="background-color: orange; color: white; height: 59%; width:50%;padding-top: 0 auto; font-weight: bold; text-align: center;">
					회 원 가 입</button>
				<br>
			</form>
		</div>
	</div>


</body>
<%@include file="footer.jsp"%>
</html>
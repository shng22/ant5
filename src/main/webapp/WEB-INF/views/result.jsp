<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@include file="menu.jsp"%>
	<div>
		<div style="margin-bottom: 70%">
			<h3 style="padding-left: 50px;">"${dto.title}"에 대한 검색결과 입니다</h3>

			<c:forEach items="${list }" var="row">
				<div
					style="width: 400px; padding-left: 50px; float: left; margin-bottom: 50px;">
					<table style="color: orange">
						<tr>
							<td><img alt="" src="./upload/${row.file }"
								style="width: 100%"></td>
						</tr>
						<tr>
							<td><a style="color: black; font-size: 15px"
								href="./detail?no=${row.bno }"> ${row.title }(${row.views })
							</a></td>
						</tr>
						<tr>
							<td>${row.rundate }</td>
						</tr>
					</table>
				</div>
			</c:forEach>
		</div>
		<div>
			<form action="./search" method="post">
				<div class="form-group row justify-content-center">

					<div class="w100" style="padding-right: 10px">

						<select class="form-control form-control-sm" name="searchType"
							id="searchType">

							<option value="title">제목</option>

							<option value="content">본문</option>

							<option value="genre">장르</option>

						</select>

					</div>

					<div class="w300" style="padding-right: 10px">

						<input type="text" class="form-control form-control-sm"
							name="keyword" id="keyword">

					</div>

					<div>

						<button class="btn btn-sm btn-primary" name="btnSearch"
							id="btnSearch">검색</button>

					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
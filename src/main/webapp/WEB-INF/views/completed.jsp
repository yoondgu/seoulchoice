<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common/tags.jsp" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- 카카오 로그인지원 자바스크립트 라이브러리를 포함시킨다. -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<title>회원가입 완료</title>
</head>
<body>
<div class="container mt-3">
	<c:set var="menu" value="home"/>
	<%@ include file="common/nav.jsp" %>
	<div class="row mb-3">
		<div class="col">
			<div class="border p-5 bg-light">
				<h1 class="display-3 mb-5">회원가입이 완료되었습니다.</h1>
				<a href="login" class="btn btn-primary btn-lg">로그인</a>
			</div>
		</div>
	</div>
</div>
</body>
</html>
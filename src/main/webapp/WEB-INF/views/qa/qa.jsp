<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>문의사항</title>
</head>
<body>
<%@ include file="../common/nav.jsp" %>
<div class="container my-3">
	<div class="row mb-3">
		<div class="col-3">
			<div class="p-5">
				<ul class="list-group list-group-flush">
					<li class="list-group-item"><a href="#">공지사항</a></li>
					<li class="list-group-item"><a href="#">이벤트</a></li>
					<li class="list-group-item"><a href="#">혁신 프로젝트</a></li>
					<li class="list-group-item"><a href="#">자주 묻는 질문</a></li>
					<li class="list-group-item"><a href="#">1:1 문의</a></li>
					<li class="list-group-item"><a href="#">약관 및 정책</a></li>
				</ul>
			</div>
		</div>
		<div class="col-6">
			<table class="table text-center" style="width:1000px;">
				<thead>
					<tr>
						<th>카테고리</th>
						<th>문의 유형</th>
						<th>이미지</th>
						<th>내용</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${empty qa }">
						<tr>
							<td colspan="5" class="text-center">등록된 1:1 문의가 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="qa" items="${qa }">
							<tr class="align-middle">
								<td>
								<c:forEach var="qaCat" items="${qa.categories }">
									<div>${qaCat.cateogry.name }</div>
								</c:forEach>
								</td>
								<td>
								<c:forEach var="qaType" items="${qa.type }">
									<div>${qaType.type.name }</div>
								</c:forEach>
								</td>
								<td><img src="/resources/images" class="img-thumbnail rounded-0"></td>
								<td>${qa.content }</td>
								<td><fmt:formatDate value="YYYY년 M월 dd일"/> ${qa.createdDate }</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
		</div>
	</div>
</div>
</body>
</html>
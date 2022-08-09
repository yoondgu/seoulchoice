<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="tags.jsp" %>
<style>	
	.nav-container {
		display: flex;
	    flex-wrap: inherit;
	    align-items: center;
	    justify-content: space-between;
		width: 100%;
	    padding-right: calc(var(--bs-gutter-x) * .5);
	    padding-left: calc(var(--bs-gutter-x) * .5);
	    margin-right: auto;
	    margin-left: auto;
        max-width: 1320px;
        --bs-gutter-x: 1.5rem;
    	--bs-gutter-y: 0;
    	padding: var(--bs-navbar-padding-y) var(--bs-navbar-padding-x);
	}
</style>

<nav class="navbar navbar-expand-md sticky-top bg-secondary navbar-dark">
	<div class="nav-container">
		<!-- 홈버튼 -->
		<a class="navbar-brand" href="/">
      		<img src="/resources/images/logo.png" alt="" width="80" height="auto">
    	</a>
    			
		<ul class="navbar-nav">			
			<!-- 로그인 상태 -->
			<c:if test="${not empty LOGIN_USER }">
				<div class="container-fluid" style="width:350px;height:auto">
    				<form class="d-flex">
      					<input class="form-control me-2" style="width:250px;height:auto" type="search" placeholder="지역, 숙소명" aria-label="Search">
      					<button class="btn btn-primary" type="submit">검색</button>
    				</form>
  				</div>
				<li class="nav-item" style="width:80px;height:auto"><a class="nav-link ${menu eq 'login' ? 'active' : '' }" href="/near">내주변</a></li>
				<li class="nav-item" style="width:90px;height:auto"><a class="nav-link ${menu eq 'register' ? 'active' : '' }" href="/reservation">예약내역</a></li>
				<li class="nav-item dropdown" style="width:90px;height:auto">
    			<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="" role="button" aria-expanded="false">더보기</a>
    			<ul class="dropdown-menu">
     				<li><a class="dropdown-item" href="">1:1 문의</a></li>
      				<li><a class="dropdown-item" href="">핫한 숙소</a></li>
      				<li><a class="dropdown-item" href="">인기 맛집</a></li>
    			</ul>
  				</li>
				<li class="nav-item dropdown" style="width:80px;height:auto">
				<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="" role="button" aria-expanded="false">내정보</a>
    			<ul class="dropdown-menu">
      				<li><a class="dropdown-item" href="/user/imformation?cat=CAT_001">내 정보</a></li>
      				<li><a class="dropdown-item" href="/user/imformation?cat=CAT_002">예약 내역</a></li>
      				<li><a class="dropdown-item" href="/user/imformation?cat=CAT_003">내가 찜한 목록</a></li>
      				<li><a class="dropdown-item" href="/user/imformation?cat=CAT_004">내 리뷰 보기</a></li>
      				<li><hr class="dropdown-divider"></li>
					<li><a class="dropdown-item" href="/logout">로그아웃</a></li>					
    			</ul>
			</c:if>
			
			<!-- 로그아웃 상태 -->
			<c:if test="${empty LOGIN_USER }">
				<div class="container-fluid" style="width:350px;height:auto">
    				<form class="d-flex">
      					<input class="form-control me-2" style="width:250px;height:auto" type="search" placeholder="지역, 숙소명" aria-label="Search">
      					<button class="btn btn-primary" type="submit">검색</button>
    				</form>
  				</div>
				<li class="nav-item" style="width:80px;height:auto"><a class="nav-link ${menu eq 'login' ? 'active' : '' }" href="/near">내주변</a></li>
				<li class="nav-item" style="width:90px;height:auto"><a class="nav-link ${menu eq 'register' ? 'active' : '' }" href="/reservation">예약내역</a></li>
				<li class="nav-item dropdown" style="width:90px;height:auto">
    			<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="" role="button" aria-expanded="false">더보기</a>
    			<ul class="dropdown-menu">
     				<li><a class="dropdown-item" href="">1:1 문의</a></li>
      				<li><a class="dropdown-item" href="">핫한 숙소</a></li>
      				<li><a class="dropdown-item" href="">인기 맛집</a></li>
    			</ul>
  				</li>
				<li class="nav-item" style="width:80px;height:auto"><a class="nav-link ${menu eq 'register' ? 'active' : '' }" href="/login">로그인</a></li>
			</c:if>
		</ul>
	</div>
</nav>

<script>
</script>
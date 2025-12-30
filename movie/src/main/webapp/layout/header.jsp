<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/common.jsp" %>
<head>
	<jsp:include page="/layout/link.jsp"/>
	<link rel="stylesheet" href="${root}/static/css/header.css">
</head>
<header class="site-header">
	<div class="container">
	<!-- navbar -->
	<nav class="navbar bg-white navbar-light"> <!-- 기본 네비게이션 바 정의 -->

			<ul class="navbar-nav d-flex flex-row align-items-center w-100">
			
			<!-- 사이트제목 -->
			<li class="nav-item me-4">
				<a class="navbar-brand" aria-current="page" href="${root}">사이트 제목</a>
			</li>
			
			<!-- 검색창 -->
			<li class="nav-item d-flex justify-content-center">
				<form class="d-flex header-search" action="${root}/movie/search" method="get">
					<button type="submit" class="search-btn"><i class="bi bi-search"></i></button>
						<input class="form-control search-input" type="search" name="keyword" placeholder="영화 검색" aria-label="Search">
				</form>
			</li>
			
			
			 <li class="nav-item d-flex align-items-center gap-4">
			<%
				if(username == null || username.equals("")) {
			%>
			<!-- 영화 토너먼트 / 로그인  (로그인X) -->
				<a class="nav-link fs-5"  href="${root}">영화 토너먼트</a>
				<a class="nav-link fs-5"  href="${root}/page/user/login.jsp">로그인</a>
			<%
			//로그인 O
				} else {
			%>
				<a class= "nav-link fs-5" aria-current="page" href="${root}">영화 토너먼트</a>
				<a class= "nav-link fs-5" aria-current="page" href="${root}/mypage.jsp">마이페이지</a>
				<a class= "nav-link fs-5" aria-current="page" href="${root}/logout">로그아웃</a>
			<%
				}
			%>
				</li>
			</ul>
	</nav>
  	</div>
</header>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/common.jsp" %>


<header class="">
	<div class="container">
	<!-- navbar -->
<nav class="navbar bg-white navbar-light"> <!-- 기본 네비게이션 바 정의 -->
	<div class="container-fluid">

		<ul class="navbar-nav d-flex flex-row align-items-center w-100">
		
		<!-- Title==홈 -->
		<li class="nav-item flex-grow-1">
			<a class="navbar-brand fs-2" aria-current="page" href="${root}">Title</a>
		</li>
		
		<li class="nav-item">
		<!-- 검색창 -->
			<form class="d-flex" style= "width: 750px;">
				<button type="submit" class="search_btn btn-primary border-0"><i class="bi bi-search"></i></button>
					<input class="form-control flex-grow-1" type="search" placeholder="영화 검색" aria-label="Search">
			</form>

		<%
			if(loginId == null || loginId.equals("")) {
		%>
		<!-- 영화 토너먼트 / 로그인  (로그인X) -->
		<li class="nav-item flex-grow-1 d-flex justify-content-end gap-4">
			<a class="nav-link fs-4" aria-current="page" href="/#">영화 토너먼트</a>
			<a class="nav-link fs-4" aria-current="page" href="${root}/login.jsp">로그인</a>
		</li>
		
		<%
		//로그인 O
			} else {
		%>
		<li class="nav-item flex-grow-1 d-flex justify-content-end gap-4">
			<a class= "nav-link fs-4" aria-current="page" href="/#">영화 토너먼트</a>
			<a class= "nav-link fs-4" aria-current="page" href="${root}/mypage.jsp">마이페이지</a>
		<%
			}
		%>
			</ul>
		</div>
  </nav>
  </div>
</header>
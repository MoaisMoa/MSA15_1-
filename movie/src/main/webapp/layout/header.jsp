<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/common.jsp" %>
<<<<<<< HEAD


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
=======
<<<<<<< HEAD
<nav class="navbar bg-dark navbar-expand-lg bg-body-tertiary" data-bs-theme="white">
=======
<nav class="navbar bg-dark navbar-expand-lg bg-body-tertiary" 
	data-bs-theme="dark">
>>>>>>> branch 'main' of https://github.com/MoaisMoa/MSA15_1-.git
  <div class="container-fluid">
    <a class="navbar-brand" href="${ root }/">Title</a>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0"></ul>
      
      <!-- 검색창 넣어야해 
      <div class="input-group mb-3">
      	<form class="d-flex"  role="search">
      	<i class="bi bi-search"></i>
      		<button id="search-btn"><i class="fa fa-search"></i></button>
      		<input id="search-input" class="form-control me-2" type="search" placeholder="영화검색" aria-label="Search" aria-describedby="basic-addon2">
     	 </form>
      </div>-->
      
      <div id="search-box">
      	<button id="search-btn"><i class="fa fa-search"></i></button>
      	<input id="search-input" placeholder="searching.."/>
      </div>
      
       <ul class="navbar-nav d-flex align-items-center px-3">
       	<%
			if( loginId == null || loginId.equals("") ) {
		%> 
		<!-- 메뉴 네비게이션 -->
        <ul class="nav justify-content-end">
        	<li class="nav-item">
        		<a class="nav-link" aria-current="page" href="/#">영화 토너먼트</a>
        	</li>
        	<li class="nav-item">
        		<a class="nav-link" aria-current="page" href="/#">로그인</a>
        	</li>
        </ul>
        
        <%
>>>>>>> refs/heads/main
			}
		%>
			</ul>
		</div>
  </nav>
  </div>
</header>
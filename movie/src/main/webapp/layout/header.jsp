<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/common.jsp" %>
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
			}
        	else {
        %>
        <!-- 로그인 시 -->
        <!-- 검색창 넣어야해 -->
        
        <ul class="nav justify-content-end">
        	<li class="nav-item">
        		<a class="nav-link" aria-current="page" href="/#">영화 토너먼트</a>
        	</li>
        	
        	<li class="nav-item">
        		<a class="nav-link" aria-current="page" href="/#">마이페이지</a>
        	</li>
        	
        	<li class="">
        </ul>
        <%
        	}
       		//만약 admin이라면?
       		//만약 mypage라면?
       		
       		//if {
        %>
        <!-- -->
        <ul class=""></ul>
        <%
			//}
        %>
      </ul>
    </div>
  </div>
</nav>
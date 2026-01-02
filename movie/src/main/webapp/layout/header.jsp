<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>

<header class="header">
  <h1 class="maintitle">
    <a href="${root}/index.jsp" class="title-link">사이트 제목</a>
  </h1>

  <!-- 🔹 영화 검색창 (여기 하나만 사용) -->
  <div class="search-wrapper">
  	<!-- /detail?keyword=검색어  -->
  	<form action="${root}/detail" method="get">
	    <input type="text" class="search" name="keyword" id="movieSearchInput" placeholder="영화 검색..." value="${ param.keyword }" />
	    <button id="movieSearchBtn" type="submit">검색</button>
  	</form>
  </div>

  <div class="right-menu">
    <a href="${root}/tournament.jsp" class="menu-btn">영화 토너먼트</a>
    
    <!-- 로그인 X -->
    <%
    	if(username == null || username.equals("tes1")) {
    %>
    	<a class="menu-btn"  href="${root}/login">로그인</a>
    	<a class="menu-btn"  href="${root}/join">회원가입</a>
    <!-- 로그인 O -->
    <%
    	} else {
    		if(username.equals("test1")) {
    %>
    			<a href="${root}/page/admin/admin.jsp" class="menu-btn">관리페이지</a>
    <% 
    		}
    %>
	    <a href="${root}/mypage/mypage" class="menu-btn">마이페이지</a>
    	<a class="menu-btn" aria-current="page" href="${root}/logout">로그아웃</a>
    <%
    	}
    %>
  </div>
</header>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/static/css/movie/tournament.css">
</head>
<body>
 <header class="header">

    <h1 class="maintitle">
  		<a href="${pageContext.request.contextPath}/index.jsp" class="title-link">
    사이트 제목
  		</a>
	</h1>
	<div class="search-wrapper">
    <input type="text" class="search" placeholder="영화 검색..." />
	</div>

    <div class="right-menu">
		  <a href="${pageContext.request.contextPath}/tournament.jsp" class="menu-btn">영화 토너먼트</a>
		  <a href="${pageContext.request.contextPath}/mypage.jsp" class="menu-btn">마이페이지</a>
	</div>
  </header>
   <footer>
    <p>© 2025 MOVIE PICK. All rights reserved.</p>
	<p>영화 데이터 출처: TMDB API</p>
  </footer>
</body>
</html>
<%@page import="movie.Service.MovieServiceImpl"%>
<%@page import="movie.Service.MovieService"%>
<%@page import="movie.DAO.MovieDAO"%>
<%@page import="movie.DTO.Movie"%>
<%@page import="java.util.List"%>
<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	MovieDAO movieDAO = new MovieDAO();
	MovieService movieService = new MovieServiceImpl(movieDAO);
	List<Movie> movieList = null;
	try {
		movieList = movieService.list();
	} catch (Exception e) {
		e.printStackTrace();
	}	
	request.setAttribute("movieList", movieList);
%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
	<link rel="stylesheet" href="path-to/node_modules/mdi/css/materialdesignicons.min.css"/>
	<jsp:include page="/layout/meta.jsp" />
	<jsp:include page="/layout/link.jsp" />
  <meta charset="UTF-8">
  <title>영화 사이트</title>
  <link rel="stylesheet" href="${root}/static/css/main.css">
</head>

<body>

  <!-- 헤더 -->
  <header class="header">

    <h1 class="maintitle">
  		<a href="${root}/index.jsp" class="title-link">
    사이트 제목
  		</a>
	</h1>
	<div class="search-wrapper">
    <input type="text" class="search" placeholder="영화 검색..." />
	</div>

    <div class="right-menu">
		  <a href="${root}/tournament.jsp" class="menu-btn">영화 토너먼트</a>
		  <a href="${root}/mypage.jsp" class="menu-btn">마이페이지</a>
	</div>
  </header>
  <!-- 메인 배너 -->
<section class="main-banner">
  <div class="banner-track">
		<c:forEach var="movie" items="${movieList}">
		    <a href="${root}/detail?id=${movie.movieId}" class="banner-link">
		      <img src="${root}${movie.imgPath}"
		           alt="인터스텔라">
		    </a>
		</c:forEach>
		
		
<%--     <a href="${root}/movieDetail.jsp?id=1" --%>
<!--        class="banner-link"> -->
<%--       <img src="${root}/static/img/movie/인터스텔라.jpg" --%>
<!--            alt="인터스텔라"> -->
<!--     </a> -->

<%--     <a href="${root}/movieDetail.jsp?id=5" --%>
<!--        class="banner-link"> -->
<%--       <img src="${root}/static/img/movie/서울의봄.jpg" --%>
<!--            alt="서울의봄"> -->
<!--     </a> -->

<%--     <a href="${root}/movieDetail.jsp?id=8" --%>
<!--        class="banner-link"> -->
<%--       <img src="${root}/static/img/movie/야당.jpg" --%>
<!--            alt="야당"> -->
<!--     </a> -->
    
<%--     <a href="${root}/movieDetail.jsp?id=15" --%>
<!--        class="banner-link"> -->
<%--       <img src="${root}/static/img/movie/한산.jpg" --%>
<!--            alt="한산"> -->
<!--     </a> -->
    
<%--     <a href="${root}/movieDetail.jsp?id=1" --%>
<!--        class="banner-link clone"> -->
<%--       <img src="${root}/static/img/movie/인터스텔라.jpg" --%>
<!--            alt="인터스텔라"> -->
<!--     </a> -->

  </div>
   <a href="movieDetail.jsp" class="detail-btn">
    상세페이지
  </a>
   <!--  <div class="banner-progress-wrapper">
    	<div class="banner-progress"></div>
 	</div> -->

  <!-- 좌우 버튼 -->
  <button class="banner-btn prev">〈</button>
  <button class="banner-btn next">〉</button>

</section>




	<%-- <c:forEach var="movie" items="${movieList}">
		    <a href="${root}/detail?id=${movie.movieId}" class="banner-link">
		      <img src="${root}${movie.imgPath}"
		           alt="인터스텔라">
		    </a>
		</c:forEach> --%>

  <!-- 영화 목록 -->
  <section class="movie-section">
    <button class="arrow left">〈</button>

    <div class="movie-list">
    	<c:forEach var="movie" items="${movieList}">
		    <a href="${root}/detail?id=${movie.movieId}" class="banner-link">
		      <img src="${root}${movie.imgPath}"
		           alt="인터스텔라">
		    </a>
		</c:forEach>
    </div>

    <button class="arrow right">〉</button>
  </section>

  <!-- 푸터 -->
  <footer>
    <p>© 2025 MOVIE PICK. All rights reserved.</p>
	<p>영화 데이터 출처: TMDB API</p>
  </footer>
<script src="${root}/static/js/main.js"></script>
</body>
</html>
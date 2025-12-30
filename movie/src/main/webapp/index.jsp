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
		movieList = movieService.list(); // 전체 영화 리스트
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

<jsp:include page="/header.jsp" />

<!-- ================= 메인 배너 ================= -->
<section class="main-banner">
  <div class="banner-track">
    <a href="#" class="banner-link" data-id="8">
      <img src="${root}/static/img/movie/야당.jpg" alt="야당">
    </a>
    <a href="#" class="banner-link" data-id="1">
      <img src="${root}/static/img/movie/인터스텔라.jpg" alt="인터스텔라">
    </a>
    <a href="#" class="banner-link" data-id="5">
      <img src="${root}/static/img/movie/서울의봄.jpg" alt="서울의봄">
    </a>
    <a href="#" class="banner-link" data-id="15">
      <img src="${root}/static/img/movie/한산.jpg" alt="한산">
    </a>
  </div>

  <a href="#" class="detail-btn">상세페이지</a>

  <div class="banner-progress-wrapper">
    <div class="banner-progress"></div>
  </div>

  <!-- 좌우 버튼 -->
  <button class="banner-btn prev">〈</button>
  <button class="banner-btn next">〉</button>
</section>


<!-- ================= 영화 목록 ================= -->
<section class="movie-section">
  <button class="arrow left">〈</button>
  <div class="movie-list">
    <c:forEach var="movie" items="${movieList}">
      <div class="movie">
        <a href="${root}/detail.jsp?id=${movie.movieId}" class="movie-link">
          <img src="${root}${movie.detailImgPath}" alt="${movie.title}">
        </a>
        <a href="${root}/detail.jsp?id=${movie.movieId}" class="movie-text-link">
          <div class="movie-info">
            <span class="movie-title">${movie.title}</span>
            <span class="movie-year">
              <fmt:formatDate value="${movie.releaseDate}" pattern="yyyy" />
            </span>
          </div>
        </a>
      </div>	
    </c:forEach>
  </div>
  <button class="arrow right">〉</button>
</section>

<jsp:include page="/layout/footer.jsp" />

<!-- JSP에서 JS로 영화 데이터 전달 -->
<script>
  const contextPath = "${pageContext.request.contextPath}";
  const movies = [
    <c:forEach var="movie" items="${movieList}" varStatus="s">
      { id: ${movie.movieId}, title: "${movie.title}" }<c:if test="${!s.last}">,</c:if>
    </c:forEach>
  ];
</script>

<!-- 메인 JS -->
<script src="${root}/static/js/main.js"></script>

</body>
</html>
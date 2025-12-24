<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%@ page import="board.DAO.MovieDAO" %>
<%@ page import="board.DTO.Movie" %>
<%@ page import="java.util.List" %>


<%
    MovieDAO dao = new MovieDAO();
    Movie movie = null;
    List<String> genres = null;

    String movieIdParam = request.getParameter("id");
    if (movieIdParam != null && !movieIdParam.isEmpty()) {
        int movieId = Integer.parseInt(movieIdParam);
        movie = dao.selectByPk(movieId);
        genres = dao.selectGenresByMovieId(movieId);
    }

    // 이미지 경로 결정
    String imagePath = "default.jpg"; // 기본 fallback 이미지
    if (movie != null) {
        if (movie.getDetail_img_path() != null && !movie.getDetail_img_path().isEmpty()) {
            imagePath = movie.getDetail_img_path();   // 상세 이미지
        } else if (movie.getImg_path() != null && !movie.getImg_path().isEmpty()) {
            imagePath = movie.getImg_path();          // 기본 이미지
        }
    }
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>영화 상세페이지 - <%= (movie != null ? movie.getTitle() : "영화 정보 없음") %></title>
    <link rel="stylesheet" href="${root}/static/css/movie/movieDetail.css">
</head>
<body>

<header class="header">
    <h1 class="maintitle">
        <a href="${pageContext.request.contextPath}/index.jsp" class="title-link">사이트 제목</a>
    </h1>
    <div class="search-wrapper">
        <input type="text" class="search" placeholder="영화 검색..." />
    </div>
    <div class="right-menu">
        <a href="${pageContext.request.contextPath}/tournament.jsp" class="menu-btn">영화 토너먼트</a>
        <a href="${pageContext.request.contextPath}/mypage.jsp" class="menu-btn">마이페이지</a>
    </div>
</header>

<main class="movie-detail">
<% if (movie != null) { %>
    <h2><%= movie.getTitle() %></h2>

    <!-- 이미지 출력 -->
    <img src="<%= request.getContextPath() + "/img/" + imagePath %>" 
         alt="<%= movie.getTitle() %>">

    <p><strong>개봉일:</strong> <%= movie.getRelease_date() %></p>
    <p><strong>상영 시간:</strong> <%= movie.getPlay_time() %>분</p>
    <p><strong>기본 장르:</strong>
    <%
        if (genres != null && !genres.isEmpty()) {
            for (int i = 0; i < genres.size(); i++) {
                out.print(genres.get(i));
                if (i < genres.size() - 1) out.print(" / ");
            }
        } else {
            out.print("정보 없음");
        }
    %>
    <%
System.out.println("imagePath = " + imagePath);
%>
    
    </p>
    <p><strong>국가:</strong> <%= movie.getCountry() %></p>
    <p><strong>감독:</strong> <%= movie.getDirector() %></p>
    <p><strong>출연:</strong> <%= movie.getActor() %></p>

    <p><strong>소개:</strong><br>
        <%= movie.getDescription() != null 
              ? movie.getDescription().replace("\n", "<br>") 
              : "" %>
    </p>

<% } else { %>
    <p>선택한 영화 정보가 존재하지 않습니다.</p>
<% } %>
</main>

<footer>
    <p>© 2025 MOVIE PICK. All rights reserved.</p>
    <p>영화 데이터 출처: TMDB API</p>
</footer>

</body>
</html>

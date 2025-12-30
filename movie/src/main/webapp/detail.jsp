<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="movie.Service.MovieServiceImpl"%>
<%@page import="movie.Service.MovieService"%>
<%@page import="movie.DAO.MovieDAO"%>
<%@page import="movie.DTO.Movie"%>
<%@page import="java.util.List" %>
<%@page import="movie.Service.GenreServiceImpl"%>
<%@page import="movie.Service.GenreService"%>
<%@page import="movie.DAO.GenreDAO"%>
<%@page import="movie.DTO.Genre"%>
<%@page import="java.util.List" %>
<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>

<%
	Object movie = request.getAttribute("movie");
	
	if (movie == null ) {
	    out.println("<script>alert('검색된 영화가 없습니다.'); location.href='index.jsp';</script>");
	    return;
	}
	
%>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>${movie.title} 상세페이지</title>

    <link rel="stylesheet" href="${root}/static/css/movie/movieDetail.css">
    <jsp:include page="/layout/meta.jsp" />
    <jsp:include page="/layout/link.jsp" />

    <!-- 인라인 스타일로 배경 이미지 적용 -->
    <style>
    .movie-detail-container {
        background: url('${root}${movie.detailImgPath}') no-repeat center center;
        background-size: 100% auto; /* 가로를 늘려 배경 이미지 보이도록 */
    }
    </style>
</head>

<body>

<jsp:include page="/layout/header.jsp" />

<script>
    const contextPath = "${pageContext.request.contextPath}";
    const movies = [
        <c:forEach var="m" items="${movieList}" varStatus="s">
            { id: ${m.movieId}, title: "${m.title}" }<c:if test="${!s.last}">,</c:if>
        </c:forEach>
    ];
</script>

<div class="movie-detail-container">
    <div class="movie-poster">
        <img src="${root}${movie.detailImgPath}" alt="${movie.title}" />
    </div>
    <div class="movie-info">
        <h1 class="movie-title">${movie.title}</h1>
        <h2 class="movie-subtitle">${movie.subTitle}</h2>

        <ul class="movie-meta">
            <li><strong>개봉:</strong> <fmt:formatDate value="${movie.releaseDate}" pattern="yyyy년 MM월 dd일"/></li>
            <li><strong>시간:</strong> ${movie.playTime}분</li>
            <li><strong>장르:</strong>
			    <c:forEach var="g" items="${movie.genres}" varStatus="status">
			        ${g}<c:if test="${!status.last}">, </c:if>
			    </c:forEach>
			</li>
            <li><strong>감독:</strong> ${movie.director}</li>
            <li><strong>출연:</strong> ${movie.actor}</li>
        </ul>

        <div class="movie-description">
            <p>${movie.description}</p>
        </div>

        <a href="${pageContext.request.contextPath}/review?id=${movie.movieId}" class="review-btn">
    리뷰남기기
</a>
    </div>
</div>

<jsp:include page="/footer.jsp" />

<!-- header.jsp에 이미 들어있는 검색 JS가 movies 배열을 사용 -->
<script src="${root}/static/js/main.js"></script>

</body>
</html>
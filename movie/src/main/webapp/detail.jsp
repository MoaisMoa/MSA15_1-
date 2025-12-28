<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
<%--     <title>영화 상세페이지 - <%= (movie != null ? movie.getTitle() : "영화 정보 없음") %></title> --%>
    <title>영화 상세페이지 - ${ movie != null ? movie.title : "영화 정보 없음" }</title>
    <link rel="stylesheet" href="${root}/static/css/movie/movieDetail.css">
</head>
<body>
	<h1>영화</h1>
	<img src="${root}/static/img/movie/${movie.detailImgPath}" />
	<h1>제목 : ${ movie.title }</h1>
	<h2>부제목 : ${ movie.subTitle }</h1>
	<h2>감독 : ${ movie.director }</h1>
	<h2>주연 : ${ movie.actor }</h1>
	<h2>국가 : ${ movie.country }</h1>
	<h2>개봉일 : <fmt:formatDate value="${movie.releaseDate}" pattern="yyyy년MM월dd일"/></h1>
	<h2>개봉연도 : (<fmt:formatDate value="${movie.releaseDate}" pattern="yyyy"/>)</h1>
	<h2>설명 : ${ movie.description }</h1>
	<h2>상영시간 : ${ movie.playTime }분</h1>
	
	<!-- 리뷰보기 버튼 -->
	<a href="${root}/review?id=${movie.movieId}">리뷰보기</a>
</body>
</html>

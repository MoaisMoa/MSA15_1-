<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
<<<<<<< HEAD
	<link rel="stylesheet" href="path-to/node_modules/mdi/css/materialdesignicons.min.css"/>
	<jsp:include page="/layout/meta.jsp" />
	<jsp:include page="/layout/link.jsp" />
=======
  <meta charset="UTF-8">
  <title>영화 사이트</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
>>>>>>> branch 'main' of https://github.com/MoaisMoa/MSA15_1-.git
</head>

<body>
<<<<<<< HEAD
	<jsp:include page="/layout/header.jsp" />
	<%-- [Contents] ######################################################### --%>
		
	
							
						
	
	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
=======

  <!-- 헤더 -->
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

  <!-- 메인 배너 -->
<section class="main-banner">

  <div class="banner-track">

    <a href="${pageContext.request.contextPath}/movieDetail.jsp?id=1"
       class="banner-link">
      <img src="${pageContext.request.contextPath}/img/인터스텔라.jpg"
           alt="인터스텔라">
    </a>

    <a href="${pageContext.request.contextPath}/movieDetail.jsp?id=5"
       class="banner-link">
      <img src="${pageContext.request.contextPath}/img/서울의봄.jpg"
           alt="서울의봄">
    </a>

    <a href="${pageContext.request.contextPath}/movieDetail.jsp?id=8"
       class="banner-link">
      <img src="${pageContext.request.contextPath}/img/야당.jpg"
           alt="야당">
    </a>
    
    <a href="${pageContext.request.contextPath}/movieDetail.jsp?id=15"
       class="banner-link">
      <img src="${pageContext.request.contextPath}/img/한산.jpg"
           alt="한산">
    </a>
    
    <a href="${pageContext.request.contextPath}/movieDetail.jsp?id=1"
       class="banner-link clone">
      <img src="${pageContext.request.contextPath}/img/인터스텔라.jpg"
           alt="인터스텔라">
    </a>

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





  <!-- 영화 목록 -->
  <section class="movie-section">
    <button class="arrow left">〈</button>

    <div class="movie-list">
    	 <div class="movie">
  			<a href="${pageContext.request.contextPath}/movieDetail.jsp?id=7" class="movie-link">
  			  <img src="${pageContext.request.contextPath}/img/아바타.jpg" alt="아바타">
  			</a>
			<p>
				<a href="${pageContext.request.contextPath}/movieDetail.jsp?id=7" class="movie-text-link">
				아바타: 불과 재 (2025)
				</a>
			</p>
		</div>
      	<div class="movie">
  			<a href="${pageContext.request.contextPath}/movieDetail.jsp?id=12" class="movie-link">
   			 <img src="${pageContext.request.contextPath}/img/주토피아.jpg" alt="주토피아">
  			</a>
  			<p>
  				<a href="${pageContext.request.contextPath}/movieDetail.jsp?id=12" class="movie-text-link">
  				주토피아 2 (2025)
  				</a>
  			</p>
		</div>

		<div class="movie">
 			 <a href="${pageContext.request.contextPath}/movieDetail.jsp?id=10" class="movie-link">
   			 <img src="${pageContext.request.contextPath}/img/윗집사람들.jpg" alt="윗집 사람들">
  			</a>
  			<p>
  				<a href="${pageContext.request.contextPath}/movieDetail.jsp?id=10" class="movie-text-link">
  				윗집 사람들 (2025)
  				</a>
  			</p>
		</div>

		<div class="movie">
  			<a href="${pageContext.request.contextPath}/movieDetail.jsp?id=11" class="movie-link">
    			<img src="${pageContext.request.contextPath}/img/주술회전.jpg" alt="주술회전">
  			</a>
  			<p>
 				 <a href="${pageContext.request.contextPath}/movieDetail.jsp?id=11" class="movie-text-link">
 				 극장판 주술회전
시부야사변X사멸회유 (2025)
 				 </a>
  			</p>
		</div>
		<div class="movie">
  			<a href="${pageContext.request.contextPath}/movieDetail.jsp?id=8" class="movie-link">
    			<img src="${pageContext.request.contextPath}/img/야당세로.jpg" alt="야당">
  			</a>
  			<p>
 				 <a href="${pageContext.request.contextPath}/movieDetail.jsp?id=8" class="movie-text-link">
 				 야당 (2025)
 				 </a>
  			</p>
		</div>
		<div class="movie">
  			<a href="${pageContext.request.contextPath}/movieDetail.jsp?id=5" class="movie-link">
    			<img src="${pageContext.request.contextPath}/img/서울의봄세로.jpg" alt="서울의봄">
  			</a>
  			<p>
 				 <a href="${pageContext.request.contextPath}/movieDetail.jsp?id=5" class="movie-text-link">
 				 서울의 봄 (2023)
 				 </a>
  			</p>
		</div>
		<div class="movie">
  			<a href="${pageContext.request.contextPath}/movieDetail.jsp?id=15" class="movie-link">
    			<img src="${pageContext.request.contextPath}/img/한산세로.jpg" alt="한산">
  			</a>
  			<p>
 				 <a href="${pageContext.request.contextPath}/movieDetail.jsp?id=15" class="movie-text-link">
 				 한산 (2022)
 				 </a>
  			</p>
		</div>
		<div class="movie">
  			<a href="${pageContext.request.contextPath}/movieDetail.jsp?id=3" class="movie-link">
    			<img src="${pageContext.request.contextPath}/img/러닝맨.jpg" alt="더 러닝맨">
  			</a>
  			<p>
 				 <a href="${pageContext.request.contextPath}/movieDetail.jsp?id=3" class="movie-text-link">
 				 더 러닝맨 (2025)
 				 </a>
  			</p>
		</div>
		<div class="movie">
  			<a href="${pageContext.request.contextPath}/movieDetail.jsp?id=2" class="movie-link">
    			<img src="${pageContext.request.contextPath}/img/곡성.jpg" alt="곡성">
  			</a>
  			<p>
 				 <a href="${pageContext.request.contextPath}/movieDetail.jsp?id=2" class="movie-text-link">
 				 곡성 (2016)
 				 </a>
  			</p>
		</div>
		<div class="movie">
  			<a href="${pageContext.request.contextPath}/movieDetail.jsp?id=9" class="movie-link">
    			<img src="${pageContext.request.contextPath}/img/올빼미.jpg" alt="올빼미">
  			</a>
  			<p>
 				 <a href="${pageContext.request.contextPath}/movieDetail.jsp?id=9" class="movie-text-link">
 				 올빼미 (2022)
 				 </a>
  			</p>
		</div>
		<div class="movie">
  			<a href="${pageContext.request.contextPath}/movieDetail.jsp?id=4" class="movie-link">
    			<img src="${pageContext.request.contextPath}/img/명량.jpg" alt="명량">
  			</a>
  			<p>
 				 <a href="${pageContext.request.contextPath}/movieDetail.jsp?id=4" class="movie-text-link">
 				 명량 (2014)
 				 </a>
  			</p>
		</div>
		<div class="movie">
  			<a href="${pageContext.request.contextPath}/movieDetail.jsp?id=13" class="movie-link">
    			<img src="${pageContext.request.contextPath}/img/파묘.jpg" alt="파묘">
  			</a>
  			<p>
 				 <a href="${pageContext.request.contextPath}/movieDetail.jsp?id=13" class="movie-text-link">
 				 파묘 (2024)
 				 </a>
  			</p>
		</div>
		<div class="movie">
  			<a href="${pageContext.request.contextPath}/movieDetail.jsp?id=14" class="movie-link">
    			<img src="${pageContext.request.contextPath}/img/피자가게2.jpg" alt="프레디의 피자가게2">
  			</a>
  			<p>
 				 <a href="${pageContext.request.contextPath}/movieDetail.jsp?id=14" class="movie-text-link">
 				 프레디의 피자가게2 (2025)
 				 </a>
  			</p>
		</div>
		<div class="movie">
  			<a href="${pageContext.request.contextPath}/movieDetail.jsp?id=1" class="movie-link">
    			<img src="${pageContext.request.contextPath}/img/인터스텔라세로.jpg" alt="인터스텔라">
  			</a>
  			<p>
 				 <a href="${pageContext.request.contextPath}/movieDetail.jsp?id=1" class="movie-text-link">
 				 인터스텔라 (2014)
 				 </a>
  			</p>
		</div>

    </div>

    <button class="arrow right">〉</button>
  </section>

  <!-- 푸터 -->
  <footer>
    <p>© 2025 MOVIE PICK. All rights reserved.</p>
	<p>영화 데이터 출처: TMDB API</p>
  </footer>
<script src="${pageContext.request.contextPath}/js/main.js"></script>
>>>>>>> branch 'main' of https://github.com/MoaisMoa/MSA15_1-.git
</body>
</html>

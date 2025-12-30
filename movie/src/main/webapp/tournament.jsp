<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="movie.Service.MovieServiceImpl"%>
<%@page import="movie.Service.MovieService"%>
<%@page import="movie.DAO.MovieDAO"%>
<%@page import="movie.DTO.Movie"%>
<%@page import="java.text.SimpleDateFormat" %>

<%@ include file="/layout/jstl.jsp"%>
<%@ include file="/layout/common.jsp"%>

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

<script>
const root = "${pageContext.request.contextPath}";
const movies = [
<c:forEach var="movie" items="${movieList}" varStatus="s">
{
    id: ${movie.movieId},
    title: "${fn:escapeXml(movie.title)}",
    detailImgPath: "${movie.detailImgPath}",
    releaseYear: "<fmt:formatDate value='${movie.releaseDate}' pattern='yyyy'/>"
}<c:if test="${!s.last}">,</c:if>
</c:forEach>
];
</script>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>토너먼트</title>
<link rel="stylesheet" href="${root}/static/css/movie/tournament.css">
<link rel="stylesheet" href="${root}/static/css/main.css">
</head>
<body>
	
	<jsp:include page="/layout/header.jsp" />
	
	<section class="tournament-container">
		<div class="tournament-wrapper">
			<div class="round-select">
				<h2>자신의 최애 영화를 골라보세요!</h2>
				<select id="roundSelect">
					<option value="16">16강</option>
					<option value="8">8강</option>
					<option value="4">4강</option>
				</select>
				<button id="startBtn">시작하기</button>
			</div>
		</div>
	
		<div class="match hidden">
				<div class="progress" id="progressText"></div>
				<div class="vs-box">
					<div class="movie-card" id="leftMovie"></div>
					<div class="vs-text">VS</div>
					<div class="movie-card" id="rightMovie"></div>
				</div>
		</div>
	</section>
	
	<jsp:include page="/layout/footer.jsp" />
	
	<script>
	document.addEventListener('DOMContentLoaded', () => {
	    if (!movies || movies.length === 0) return;
	
	    let currentRound = [];
	    let nextRound = [];
	    let index = 0;
	    let matchNumber = 1;
	
	    const leftEl = document.getElementById('leftMovie');
	    const rightEl = document.getElementById('rightMovie');
	    const progressEl = document.getElementById('progressText');
	    const startBtn = document.getElementById('startBtn');
	    const roundSelect = document.getElementById('roundSelect');
	    const vsText = document.querySelector('.vs-text');
	
	    startBtn.addEventListener('click', () => {
	        const roundCount = Math.min(parseInt(roundSelect.value), movies.length);
	        startTournament(roundCount);
	    });
	
	    function startTournament(roundCount) {
	        currentRound = shuffle(movies).slice(0, roundCount);
	        nextRound = [];
	        index = 0;
	        matchNumber = 1;
	        document.querySelector('.round-select').classList.add('hidden');
	        document.querySelector('.match').classList.remove('hidden');
	        progressEl.style.display = "flex";
	        if (vsText) vsText.style.display = "block";
	        showMatch();
	    }
	
	    function showMatch() {
	        // 우승 확정
	        if (currentRound.length === 1) {
	            showWinner(currentRound[0]);
	            return;
	        }
	
	        if (index >= currentRound.length) {
	            currentRound = nextRound;
	            nextRound = [];
	            index = 0;
	            matchNumber = 1;
	        }
	
	        const m1 = currentRound[index];
	        const m2 = currentRound[index + 1];
	        if (!m2) return;
	
	        const roundSize = currentRound.length;
	        progressEl.innerText =
	            (roundSize === 2 ? "결승!" : roundSize + "강 / " + matchNumber + "번째 매치");
	
	        render(leftEl, m1);
	        render(rightEl, m2);
	
	        leftEl.onclick = () => pickWinner(m1);
	        rightEl.onclick = () => pickWinner(m2);
	    }
	
	    function pickWinner(movie) {
	        // 🔥 결승전이면 바로 우승 처리
	        if (currentRound.length === 2) {
	            showWinner(movie);
	            return;
	        }
	        nextRound.push(movie);
	        index += 2;
	        matchNumber++;
	        showMatch();
	    }
	
	
	    function showWinner(winner) {
	        document.querySelector('.vs-box').classList.add('winner-mode');

	        progressEl.innerText = "1등!";
	        if (vsText) vsText.style.display = "none";

	        // 왼쪽 : 우승 영화
	        render(leftEl, winner);

	        // 오른쪽 초기화
	        rightEl.innerHTML = "";
	        rightEl.onclick = null;

	        // ================= winner-box =================
	        const box = document.createElement("div");
	        box.className = "winner-box";

	        // 🏆 1등 텍스트
	        const rankText = document.createElement("div");
	        rankText.className = "winner-rank";
	        rankText.innerText = "🏆 1등 🏆";

	        // 🎬 영화 제목
	        const titleText = document.createElement("div");
			titleText.className = "winner-title";
			titleText.innerText = winner.title + " (" + winner.releaseYear + ")";


	        // 버튼 영역 (가로 정렬)
	        const btnWrap = document.createElement("div");
	        btnWrap.className = "winner-btn-wrap";

	        // 상세 페이지 버튼
	        const detailBtn = document.createElement("button");
	        detailBtn.innerText = "영화 소개 보러가기";
	        detailBtn.onclick = () => {
	            location.href = root + "/detail?id=" + winner.id;
	        };

	        // 리뷰 페이지 버튼
	        const reviewBtn = document.createElement("button");
	        reviewBtn.innerText = "리뷰 쓰기";
	        reviewBtn.onclick = () => {
	            location.href = root + "/review?id=" + winner.id;
	        };

	        // 버튼 가로 정렬
	        btnWrap.appendChild(detailBtn);
	        btnWrap.appendChild(reviewBtn);

	        // ⭐ winner-box 안에 순서대로 추가
	        box.appendChild(rankText);
	        box.appendChild(titleText);
	        box.appendChild(btnWrap);

	        rightEl.appendChild(box);
	    }

	    function render(el, movie) {
	        el.innerHTML = "";
	        const img = document.createElement("img");
	        img.src = root + movie.detailImgPath;
	        img.alt = movie.title;
	        img.style.width = "450px";
	        img.style.borderRadius = "12px";
	        el.appendChild(img);
	
	        const p = document.createElement("p");
	        p.innerText = movie.title + " (" + movie.releaseYear + ")";
	        el.appendChild(p);
	    }
	
	    function shuffle(array) {
	        const arr = array.slice();
	        for (let i = arr.length - 1; i > 0; i--) {
	            const j = Math.floor(Math.random() * (i + 1));
	            [arr[i], arr[j]] = [arr[j], arr[i]];
	        }
	        return arr;
	    }
	});
	</script>
	
	<!-- 🔍 검색창 등 공통 기능 -->
   <script src="${root}/static/js/main.js"></script>
	
	</body>
	</html>
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

<jsp:include page="/header.jsp" />

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

<jsp:include page="/footer.jsp" />

<script>
document.addEventListener('DOMContentLoaded', () => {
    if (!movies || movies.length === 0) return;

    let currentRound = [];
    let nextRound = [];
    let index = 0;
    let matchNumber = 1;
    let currentRoundName = "";

    const leftEl = document.getElementById('leftMovie');
    const rightEl = document.getElementById('rightMovie');
    const progressEl = document.getElementById('progressText');
    const startBtn = document.getElementById('startBtn');
    const roundSelect = document.getElementById('roundSelect');
    const vsText = document.querySelector('.vs-text');

    startBtn.addEventListener('click', () => {
        const selected = parseInt(roundSelect.value) || 16;
        const roundCount = Math.min(selected, movies.length);
        startTournament(roundCount);
    });

    function startTournament(roundCount) {
        currentRound = shuffle(movies).slice(0, roundCount);
        nextRound = [];
        index = 0;
        matchNumber = 1;
        currentRoundName = (currentRound.length === 2) ? "결승" : currentRound.length + "강";

        document.querySelector('.round-select').classList.add('hidden');
        document.querySelector('.match').classList.remove('hidden');

        progressEl.style.display = "block";
        vsText.style.display = "block";

        showMatch();
    }

    function showMatch() {
        if (currentRound.length === 1) {
            const winner = currentRound[0];
            window.location.href = root + "/detail.jsp?id=" + winner.id;
            return;
        }

        if (index >= currentRound.length) {
            currentRound = nextRound;
            nextRound = [];
            index = 0;
            matchNumber = 1;
            currentRoundName = (currentRound.length === 2) ? "결승" : currentRound.length + "강";
        }

        const m1 = currentRound[index];
        const m2 = currentRound[index + 1];

        if (!m2) {
            pickWinner(m1);
            return;
        }

        progressEl.innerText = `${currentRoundName} / ${matchNumber}번째 매치`;

        render(leftEl, m1);
        render(rightEl, m2);

        leftEl.onclick = () => { pickWinner(m1); };
        rightEl.onclick = () => { pickWinner(m2); };
    }

    function pickWinner(movie) {
        nextRound.push(movie);
        index += 2;
        matchNumber++;
        showMatch();
    }

    function render(el, movie) {
        el.innerHTML = "";
        if(movie.detailImgPath) {
            const img = document.createElement("img");
            img.src = root + movie.detailImgPath;
            img.alt = movie.title;
            img.style.width = "450px";
            img.style.borderRadius = "12px";
            el.appendChild(img);
        }
        const title = document.createElement("p");
        title.innerText = movie.title + " (" + movie.releaseYear + ")";
        el.appendChild(title);
    }

    function shuffle(array) {
        const arr = array.slice();
        for (let i = arr.length-1; i>0; i--) {
            const j = Math.floor(Math.random()*(i+1));
            [arr[i], arr[j]] = [arr[j], arr[i]];
        }
        return arr;
    }
});
</script>

<script src="${root}/static/js/main.js"></script>
</body>
</html>

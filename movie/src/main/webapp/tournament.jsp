<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="movie.Service.MovieServiceImpl"%>
<%@page import="movie.Service.MovieService"%>
<%@page import="movie.DAO.MovieDAO"%>
<%@page import="movie.DTO.Movie"%>

<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>

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

<script>
    const root = "${pageContext.request.contextPath}";
    const movies = [
        <c:forEach var="movie" items="${movieList}" varStatus="s">
            {
                id: ${movie.movieId},
                title: "${fn:escapeXml(movie.title)}",
                detailImgPath: "${movie.detailImgPath}"
            }<c:if test="${!s.last}">,</c:if>
        </c:forEach>
    ];
    console.log('movies 배열 확인:', movies);
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

<!-- ================= 토너먼트 JS ================= -->
<script>
document.addEventListener('DOMContentLoaded', () => {
    if (!movies || movies.length === 0) {
        console.error('영화 리스트가 없습니다.');
        return;
    }

    let currentRound = [];
    let nextRound = [];
    let index = 0;
    let roundSize = 16;

    const leftEl = document.getElementById('leftMovie');
    const rightEl = document.getElementById('rightMovie');
    const progressEl = document.getElementById('progressText');
    const startBtn = document.getElementById('startBtn');
    const roundSelect = document.getElementById('roundSelect');

    startBtn.addEventListener('click', () => {
        let selected = parseInt(roundSelect.value) || 16;
        roundSize = Math.min(selected, movies.length);
        startTournament();
    });

    function startTournament() {
        currentRound = shuffle(movies).slice(0, roundSize);
        nextRound = [];
        index = 0;

        document.querySelector('.round-select').classList.add('hidden');
        document.querySelector('.match').classList.remove('hidden');

        // 시작 시 VS 텍스트와 progress 보이게
        document.getElementById('progressText').style.display = 'block';
        document.querySelector('.vs-text').style.display = 'block';

        showMatch();
    }


    function showMatch() {
        if (index >= currentRound.length) {
            if (currentRound.length === 1) {
                window.location.href = `${root}/detail.jsp?id=${currentRound[0].id}`;
                return;
            }
            currentRound = nextRound;
            nextRound = [];
            index = 0;
        }

        const m1 = currentRound[index];
        const m2 = currentRound[index + 1];
        if (!m1 || !m2) return;

        console.log('매치 확인:', m1, m2);

        // 🔹 현재 라운드/매치 계산
        const totalMatches = Math.floor(currentRound.length / 2);
        const currentMatch = Math.floor(index / 2) + 1;
        progressEl.innerText = `${currentRound.length}강 ${currentMatch}/${totalMatches}`;

        render(leftEl, m1);
        render(rightEl, m2);

        leftEl.onclick = () => pickWinner(m1);
        rightEl.onclick = () => pickWinner(m2);
    }

    function pickWinner(movie) {
        nextRound.push(movie);
        index += 2;
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
        title.innerText = movie.title;
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

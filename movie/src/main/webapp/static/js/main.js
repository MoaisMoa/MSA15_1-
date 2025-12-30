document.addEventListener('DOMContentLoaded', () => {

  /* ===================== 메인 배너 ===================== */

  const bannerTrack = document.querySelector('.banner-track');
  if (bannerTrack) {

    const banners = bannerTrack.querySelectorAll('.banner-link');
    const bannerCount = banners.length;

    const BANNER_SLIDE_TIME = 900;
    const BANNER_DELAY = 3000;

    let bannerIndex = 0;
    let isAnimating = false;
    let isPaused = false;
    let bannerTimer = null;

    // ▶ 클론
    bannerTrack.appendChild(banners[0].cloneNode(true));

    function moveBanner(index, smooth = true) {
      bannerTrack.style.transition = smooth
        ? `transform ${BANNER_SLIDE_TIME}ms ease`
        : 'none';
      bannerTrack.style.transform = `translateX(-${index * 100}%)`;
    }

    function nextBanner() {
      if (isAnimating) return;
      isAnimating = true;

      bannerIndex++;
      moveBanner(bannerIndex, true);

      if (bannerIndex === bannerCount) {
        setTimeout(() => {
          bannerIndex = 0;
          moveBanner(bannerIndex, false);
          isAnimating = false;
        }, BANNER_SLIDE_TIME);
      } else {
        setTimeout(() => isAnimating = false, BANNER_SLIDE_TIME);
      }
    }

    function prevBanner() {
      if (isAnimating) return;
      isAnimating = true;

      if (bannerIndex === 0) {
        bannerTrack.style.transition = 'none';
        bannerIndex = bannerCount;
        moveBanner(bannerIndex, false);

        requestAnimationFrame(() => {
          bannerIndex--;
          moveBanner(bannerIndex, true);
          setTimeout(() => isAnimating = false, BANNER_SLIDE_TIME);
        });
      } else {
        bannerIndex--;
        moveBanner(bannerIndex, true);
        setTimeout(() => isAnimating = false, BANNER_SLIDE_TIME);
      }
    }

    function startBanner() {
      bannerTimer = setInterval(() => {
        if (!isPaused && !isAnimating) nextBanner();
      }, BANNER_DELAY);
    }

    startBanner();

    document.querySelector('.banner-btn.next').onclick = nextBanner;
    document.querySelector('.banner-btn.prev').onclick = prevBanner;

    /* ▶ 배너 클릭 시 상세페이지 이동 */
    banners.forEach(banner => {
      banner.addEventListener('click', (e) => {
        e.preventDefault();
        const movieId = banner.dataset.id;
        location.href = contextPath + `/detail.jsp?id=${movieId}`;
      });
    });

    /* ▶ 상세페이지 버튼 */
    const detailBtn = document.querySelector('.detail-btn');
    if (detailBtn) {
      detailBtn.addEventListener('click', (e) => {
        e.preventDefault();
        const realIndex = bannerIndex % bannerCount;
        const movieId = banners[realIndex].dataset.id;
        location.href = contextPath + `/detail.jsp?id=${movieId}`;
      });
    }
  }

  /* ===================== 영화 목록 슬라이드 ===================== */

  const movieListEl = document.querySelector('.movie-list');
  if (movieListEl) {

    const movies = Array.from(movieListEl.querySelectorAll('.movie'));
    const movieCount = movies.length;

    const step = 2;
    const itemWidth = movies[0].offsetWidth + 20;
    const cloneCount = 4;
    const MOVIE_DELAY = 3000;

    // ▶ 클론
    movies.slice(0, cloneCount).forEach(m => {
      movieListEl.appendChild(m.cloneNode(true));
    });

    let movieIndex = 0;
    let movieTimer = null;

    function moveMovie(index, smooth = true) {
      movieListEl.scrollTo({
        left: index * itemWidth,
        behavior: smooth ? 'smooth' : 'auto'
      });
    }

    function startMovie() {
      movieTimer = setInterval(() => {
        movieIndex += step;
        if (movieIndex >= movieCount) {
          movieIndex = 0;
          moveMovie(movieIndex, false);
        } else {
          moveMovie(movieIndex, true);
        }
      }, MOVIE_DELAY);
    }

    function stopMovie() {
      clearInterval(movieTimer);
      movieTimer = null;
    }

    startMovie();

    movieListEl.addEventListener('mouseenter', stopMovie);
    movieListEl.addEventListener('mouseleave', startMovie);

    document.querySelector('.arrow.right').onclick = () => {
      stopMovie();
      movieIndex = Math.min(movieCount - 1, movieIndex + step);
      moveMovie(movieIndex, true);
      startMovie();
    };

    document.querySelector('.arrow.left').onclick = () => {
      stopMovie();
      movieIndex = Math.max(0, movieIndex - step);
      moveMovie(movieIndex, true);
      startMovie();
    };
  }

  // ===================== 영화 검색 기능 =====================
  const searchInput = document.getElementById('movieSearchInput');
  const searchBtn = document.getElementById('movieSearchBtn');

  if (searchInput && searchBtn && typeof movies !== 'undefined') {
      searchBtn.addEventListener('click', () => {
          const query = searchInput.value.trim().toLowerCase();
          if (!query) return;

          const movie = movies.find(m => m.title.toLowerCase().includes(query));
          if (movie) {
              window.location.href = `${contextPath}/detail.jsp?id=${movie.id}`;
          } else {
              alert('검색된 영화가 없습니다.');
          }
      });

      // Enter 키 입력 시 검색
      searchInput.addEventListener('keypress', (e) => {
          if (e.key === 'Enter') searchBtn.click();
      });
  }



});
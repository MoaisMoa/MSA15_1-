document.addEventListener('DOMContentLoaded', () => {
  const bannerTrack = document.querySelector('.banner-track');
  const banners = document.querySelectorAll('.banner-link');
  const bannerCount = banners.length;

  let bannerIndex = 0;       // 현재 보여지는 배너
  let isAnimating = false;   // 애니메이션 중복 방지
  let isPaused = false;      // 마우스 오버시 슬라이드 정지

  // 배너 이동 함수
  function moveBanner(index, transition = true) {
    bannerTrack.style.transition = transition ? 'transform 0.6s ease' : 'none';
    bannerTrack.style.transform = `translateX(-${index * 100}%)`;
  }

  // 다음 배너
  function nextBanner() {
    if (isAnimating) return;
    isAnimating = true;

    bannerIndex++;

    if (bannerIndex >= bannerCount) {
      bannerIndex = 0;
      moveBanner(bannerIndex, false);

      setTimeout(() => {
        bannerIndex++;
        moveBanner(bannerIndex);
        setTimeout(() => { isAnimating = false; }, 600);
      }, 20);
    } else {
      moveBanner(bannerIndex);
      setTimeout(() => { isAnimating = false; }, 600);
    }
  }

  // 이전 배너
  function prevBanner() {
    if (isAnimating) return;
    isAnimating = true;

    bannerIndex--;
    if (bannerIndex < 0) {
      bannerIndex = bannerCount - 1;
      moveBanner(bannerIndex, false);
    } else {
      moveBanner(bannerIndex);
    }

    setTimeout(() => { isAnimating = false; }, 600);
  }

  // 자동 슬라이드
  const autoSlide = setInterval(() => {
    if (!isPaused) nextBanner();
  }, 3000);
	
  const banner = document.querySelector('.main-banner');							/*--------------*/
  banner.addEventListener('mouseenter', () => isPaused = true);                    /*--------------*/
  banner.addEventListener('mouseleave', () => isPaused = false);					/*--------------*/

  // 화살표 클릭
  document.querySelector('.banner-btn.next').addEventListener('click', nextBanner);
  document.querySelector('.banner-btn.prev').addEventListener('click', prevBanner);

  
  
  
  
  // ===================== 영화 목록 슬라이드 =====================
  const movieList = document.querySelector('.movie-list');
  const movies = Array.from(document.querySelectorAll('.movie'));

  const step = 2;
  const itemWidth = movies[0].offsetWidth + 20;
  const realCount = movies.length;
  const cloneCount = 4;
  const SLIDE_DELAY = 3000;
  const SLIDE_TIME = 600; // ⭐ CSS랑 반드시 맞출 것

  // ================= 클론 생성 =================
  movies.slice(0, cloneCount).forEach(v => {
    movieList.appendChild(v.cloneNode(true));
  });

  // ================= 상태 =================
  let movieIndex = 0;
  let timer = null;

  // ================= 이동 =================
  function moveMovie(index, smooth = true) {
    movieList.scrollTo({
      left: index * itemWidth,
      behavior: smooth ? 'smooth' : 'auto'
    });
  }

  // ================= 핵심 리셋 (수정됨) =================
  function resetIfNeeded() {
    // C1,C2,C3,C4 까지 "슬라이드 완료 후" 리셋
    if (movieIndex >= realCount) {
      setTimeout(() => {
        movieIndex = 0;
        moveMovie(movieIndex, false); // 0초 순간이동
      }, SLIDE_TIME);
    }
  }

  // ================= 자동 슬라이드 =================
  function startMovieSlide() {
    if (timer) return;

    timer = setInterval(() => {
      movieIndex += step;
      moveMovie(movieIndex, true);
      resetIfNeeded();
    }, SLIDE_DELAY);
  }

  function stopMovieSlide() {
    clearInterval(timer);
    timer = null;
  }

  // ================= 실행 =================
  startMovieSlide();

  // ================= hover =================
  movieList.addEventListener('mouseenter', stopMovieSlide);
  movieList.addEventListener('mouseleave', startMovieSlide);

  // ================= 화살표 =================
  document.querySelector('.arrow.right').addEventListener('click', () => {
    stopMovieSlide();

    movieIndex += step;
    moveMovie(movieIndex, true);
    resetIfNeeded();

    startMovieSlide();
  });

  document.querySelector('.arrow.left').addEventListener('click', () => {
    stopMovieSlide();

    movieIndex -= step;
    if (movieIndex < 0) {
      movieIndex = realCount - step;
      moveMovie(movieIndex, false);
    } else {
      moveMovie(movieIndex, true);
    }

    startMovieSlide();
  });


});

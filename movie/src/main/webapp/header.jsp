<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>

<header class="header">
  <h1 class="maintitle">
    <a href="${root}/index.jsp" class="title-link">사이트 제목</a>
  </h1>

  <!-- 🔹 영화 검색창 (여기 하나만 사용) -->
  <div class="search-wrapper">
    <input type="text" class="search" id="movieSearchInput" placeholder="영화 검색..." />
    <button id="movieSearchBtn">검색</button>
  </div>

  <div class="right-menu">
    <a href="${root}/tournament.jsp" class="menu-btn">영화 토너먼트</a>
    <a href="${root}/mypage.jsp" class="menu-btn">마이페이지</a>
  </div>
</header>

<script>
  // 🔹 JSP에서 movies 배열과 contextPath를 index.jsp에서 전달해야 함
  const headerSearchInput = document.getElementById('headerMovieSearch');
  const headerSearchBtn = document.getElementById('headerMovieSearchBtn');

  if (headerSearchInput && headerSearchBtn && typeof movies !== 'undefined') {
    // 검색 버튼 클릭
    headerSearchBtn.addEventListener('click', () => {
      const keyword = headerSearchInput.value.trim().toLowerCase();
      if (!keyword) return;

      const found = movies.find(m => m.title.toLowerCase().includes(keyword));
      if (found) {
        // 영화 상세페이지로 이동
        window.location.href = `${contextPath}/detail.jsp?id=${found.id}`;
      } else {
        alert('검색된 영화가 없습니다.');
      }
    });

    // Enter 키로 검색
    headerSearchInput.addEventListener('keypress', (e) => {
      if (e.key === 'Enter') headerSearchBtn.click();
    });
  }
</script>

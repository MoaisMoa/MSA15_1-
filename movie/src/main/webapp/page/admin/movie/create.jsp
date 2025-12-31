<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>관리자 페이지 - 영화 등록</title>
	<jsp:include page="/layout/meta.jsp" />
	<jsp:include page="/layout/link.jsp" />
</head>
<body>
	<jsp:include page="/layout/adminheader.jsp" />
	<jsp:include page="/layout/adminsidebar.jsp" />
	<%-- [Contents] ######################################################### --%>
	<div class="container">
	
		<div style = "position:fixed;
					  top: 140px;
					  left : 320px;
					  right: 40px;
					  ">
			<h1 style = "font-size:40px;
						 color: #7D81CA;">영화 등록</h1>
		</div>
		<div style = "position:fixed;
					  top: 220px;
					  left:320px;
					  right: 40px;
					  bottom: 40px;
					  padding: 40px;		  
					  background-color:white;
					  border-radius: 30px;
					  overflow-y:auto;
					  z-index:1001;
		">				
<%---------------------------------------------------------------------- --%>
<form action="${root}/admin/movie/create" method="post">
        <div class="mb-3">
            <label>영화 제목</label>
            <input type="text" name="title" class="form-control" required>
        </div>
        
        
        <div class="mb-3">
            <label>소 제목</label>
            <input type="text" name="sub_title" class="form-control" required>
        </div>
        
        
        
        
        
        <div class="mb-3">
    <label style="font-size:20px;">장르</label>
    <div style="display:flex; flex-wrap:wrap; gap:12px; margin-top:5px;">
        <c:set var="genres" value="${movie.genres}" />

        <div style="display:flex; align-items:center; gap:4px;">
            <input type="checkbox" name="genre" value="액션" id="genreAction"
                   <c:if test="${not empty genres and fn:contains(genres, '액션')}">checked</c:if> />
            <label for="genreAction">액션</label>
        </div>

        <div style="display:flex; align-items:center; gap:4px;">
            <input type="checkbox" name="genre" value="드라마" id="genreDrama"
                   <c:if test="${not empty genres and fn:contains(genres, '드라마')}">checked</c:if> />
            <label for="genreDrama">드라마</label>
        </div>

        <div style="display:flex; align-items:center; gap:4px;">
            <input type="checkbox" name="genre" value="SF" id="genreSF"
                   <c:if test="${not empty genres and fn:contains(genres, 'SF')}">checked</c:if> />
            <label for="genreSF">SF</label>
        </div>

        <div style="display:flex; align-items:center; gap:4px;">
            <input type="checkbox" name="genre" value="코미디" id="genreComedy"
                   <c:if test="${not empty genres and fn:contains(genres, '코미디')}">checked</c:if> />
            <label for="genreComedy">코미디</label>
        </div>

        <div style="display:flex; align-items:center; gap:4px;">
            <input type="checkbox" name="genre" value="로맨스" id="genreRomance"
                   <c:if test="${not empty genres and fn:contains(genres, '로맨스')}">checked</c:if> />
            <label for="genreRomance">로맨스</label>
        </div>

        <div style="display:flex; align-items:center; gap:4px;">
            <input type="checkbox" name="genre" value="스릴러" id="genreThriller"
                   <c:if test="${not empty genres and fn:contains(genres, '스릴러')}">checked</c:if> />
            <label for="genreThriller">스릴러</label>
        </div>

        <div style="display:flex; align-items:center; gap:4px;">
            <input type="checkbox" name="genre" value="공포" id="genreHorror"
                   <c:if test="${not empty genres and fn:contains(genres, '공포')}">checked</c:if> />
            <label for="genreHorror">공포</label>
        </div>

        <div style="display:flex; align-items:center; gap:4px;">
            <input type="checkbox" name="genre" value="판타지" id="genreFantasy"
                   <c:if test="${not empty genres and fn:contains(genres, '판타지')}">checked</c:if> />
            <label for="genreFantasy">판타지</label>
        </div>

        <div style="display:flex; align-items:center; gap:4px;">
            <input type="checkbox" name="genre" value="범죄" id="genreCrime"
                   <c:if test="${not empty genres and fn:contains(genres, '범죄')}">checked</c:if> />
            <label for="genreCrime">범죄</label>
        </div>
    </div>
</div>



        <div class="mb-3">
            <label>감독</label>
            <input type="text" name="director" class="form-control">
        </div>
        
        <div class="mb-3">
            <label>배우</label>
            <input type="text" name="actor" class="form-control">
        </div>
        <div class="mb-3">
            <label>국가</label>
            <input type="text" name="country" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>개봉일</label>
            <input type="date" name="release_date" class="form-control">
        </div>
        <div class="mb-3">
            <label>상영시간</label>
            <input type="text" name="play_time" class="form-control" id="playTime" placeholder="숫자만 입력">
        </div>
        <div class="mb-3">
            <label>내용</label>
            <textarea name="description" class="form-control" rows="4"></textarea>
        </div>
        <div class="mb-3">
            <label>포스터</label>
            <input type="text" name="img_path" class="form-control">
        </div>

        
        <button type="submit" class="btn btn-primary">등록</button>
        <a href="javascript:history.back()" class="btn btn-secondary">취소</a>
    </form>
    
    



		
		
		
<%---------------------------------------------------------------------- --%>
		</div>
	</div>
	
	<%-- [Contents] ######################################################### --%>

	<jsp:include page="/layout/script.jsp" />
</body>
</html>
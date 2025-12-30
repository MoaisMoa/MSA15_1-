<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>영화 정보</title>
    <jsp:include page="/layout/meta.jsp" />
    <jsp:include page="/layout/link.jsp" />
</head>
<body>
    <jsp:include page="/layout/adminheader.jsp" />
    <jsp:include page="/layout/adminsidebar.jsp" />

<div class="container">
    <div style="position:fixed; top:140px; left:320px; right:40px;">
        <h1 style="font-size:40px; color: #7D81CA;">영화 정보</h1>
    </div>

    <div style="position:fixed; top:220px; left:320px; right:40px; bottom:40px; 
                padding:40px; background-color:white; border-radius:30px; 
                z-index:1001; display:flex; flex-direction:column;">

        <div class="row justify-content-center" style="flex:1; overflow-y:auto; margin-top:10px;">
            <div class="col-12 col-md-10 col-lg-10">

                <!-- 수정/삭제 폼 -->
                <form id="movieForm" method="post" action="${root}/admin/movie/update">
                    <input type="hidden" name="movie_id" value="${movie.movieId}" />

                    <div class="mb-3">
                        <label style="font-size:20px;">넘버</label>
                        <input type="text" class="form-control" value="${movie.movieId}" readonly>
                    </div>

                    <div class="mb-3">
                        <label style="font-size:20px;">포스터</label>
                        <input type="text" name="img_path" class="form-control" value="${movie.imgPath}">
                        <c:if test="${not empty movie.imgPath}">
                            <br>
                            <img src="${movie.imgPath}" alt="${movie.title} 포스터" 
                                 style="max-width:200px; height:auto; border-radius:10px;">
                        </c:if>
                    </div>

                    <div class="mb-3">
                        <label style="font-size:20px;">제목</label>
                        <input type="text" name="title" class="form-control" value="${movie.title}">
                    </div>

                    <div class="mb-3">
                        <label style="font-size:20px;">서브타이틀</label>
                        <input type="text" name="sub_title" class="form-control" value="${movie.subTitle}">
                    </div>





                    <div class="mb-3">
					    <label style="font-size:20px;">장르</label>
					    <div style="display:flex; flex-wrap:wrap; gap:15px; margin-top:5px;">
					        <c:set var="genres" value="${movie.genres}" />
					
					        <div>
					            <input type="checkbox" name="genre" value="액션" id="genreAction"
					                   <c:if test="${not empty genres and fn:contains(genres, '액션')}">checked</c:if> />
					            <label for="genreAction">액션</label>
					        </div>
					
					        <div>
					            <input type="checkbox" name="genre" value="드라마" id="genreDrama"
					                   <c:if test="${not empty genres and fn:contains(genres, '드라마')}">checked</c:if> />
					            <label for="genreDrama">드라마</label>
					        </div>
					
					        <div>
					            <input type="checkbox" name="genre" value="SF" id="genreSF"
					                   <c:if test="${not empty genres and fn:contains(genres, 'SF')}">checked</c:if> />
					            <label for="genreSF">SF</label>
					        </div>
					
					        <div>
					            <input type="checkbox" name="genre" value="코미디" id="genreComedy"
					                   <c:if test="${not empty genres and fn:contains(genres, '코미디')}">checked</c:if> />
					            <label for="genreComedy">코미디</label>
					        </div>
					
					        <div>
					            <input type="checkbox" name="genre" value="로맨스" id="genreRomance"
					                   <c:if test="${not empty genres and fn:contains(genres, '로맨스')}">checked</c:if> />
					            <label for="genreRomance">로맨스</label>
					        </div>
					
					        <div>
					            <input type="checkbox" name="genre" value="스릴러" id="genreThriller"
					                   <c:if test="${not empty genres and fn:contains(genres, '스릴러')}">checked</c:if> />
					            <label for="genreThriller">스릴러</label>
					        </div>
					
					        <div>
					            <input type="checkbox" name="genre" value="공포" id="genreHorror"
					                   <c:if test="${not empty genres and fn:contains(genres, '공포')}">checked</c:if> />
					            <label for="genreHorror">공포</label>
					        </div>
					
					        <div>
					            <input type="checkbox" name="genre" value="판타지" id="genreFantasy"
					                   <c:if test="${not empty genres and fn:contains(genres, '판타지')}">checked</c:if> />
					            <label for="genreFantasy">판타지</label>
					        </div>
					
					        <div>
					            <input type="checkbox" name="genre" value="범죄" id="genreCrime"
					                   <c:if test="${not empty genres and fn:contains(genres, '범죄')}">checked</c:if> />
					            <label for="genreCrime">범죄</label>
					        </div>
					    </div>
					</div>


                    
                    
                    <div class="mb-3">
                        <label style="font-size:20px;">감독</label>
                        <input type="text" name="director" class="form-control" value="${movie.director}">
                    </div>

                    <div class="mb-3">
                        <label style="font-size:20px;">배우</label>
                        <input type="text" name="actor" class="form-control" value="${movie.actor}">
                    </div>


                    <div class="mb-3">
                        <label style="font-size:20px;">개봉국가</label>
                        <input type="text" name="country" class="form-control" value="${movie.country}">
                    </div>

                    <div class="mb-3">
                        <label style="font-size:20px;">개봉일</label>
                        <input type="date" name="release_date" class="form-control" 
                               value="<fmt:formatDate value='${movie.releaseDate}' pattern='yyyy-MM-dd'/>">
                    </div>

                    <div class="mb-3">
                        <label style="font-size:20px;">러닝타임</label>
                        <input type="text" name="play_time" class="form-control" value="${movie.playTime}">
                    </div>

                    <div class="mb-3">
                        <label style="font-size:20px;">줄거리</label>
                        <textarea name="description" class="form-control" rows="4">${movie.description}</textarea>
                    </div>

                    <!-- 버튼 -->
                    <div class="d-flex justify-content-end gap-2 mt-3">
                        <button type="submit" class="btn btn-lg btn-primary">수정</button>
                        <button type="button" class="btn btn-lg btn-danger" id="btn-delete">삭제</button>
                        <a href="javascript:history.back()" class="btn btn-lg btn-secondary">취소</a>
                    </div>
                </form>

            </div>
        </div>

    </div>
</div>

<jsp:include page="/layout/script.jsp" />

<script>
    const movieForm = document.getElementById("movieForm");
    const btnDelete = document.getElementById("btn-delete");

    btnDelete.addEventListener("click", function() {
        if(!confirm("정말 삭제하시겠습니까?")) return;
        movieForm.action = "${root}/admin/movie/delete";
        movieForm.submit();
    });
</script>

</body>
</html>

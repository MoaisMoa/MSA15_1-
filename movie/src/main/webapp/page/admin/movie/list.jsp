<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>관리자 페이지-영화</title>
	<jsp:include page="/layout/meta.jsp" />
	<jsp:include page="/layout/link.jsp" />
</head>
<body>
<style>
	.card-text {
  max-height: 3em; 
  line-height: 1.5em;
  overflow: hidden;
}
</style>
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
						 color: #7D81CA;">영화 관리</h1>
		</div>
		<div style = "position:fixed;
					  top: 220px;
					  left:320px;
					  right: 40px;
					  bottom: 40px;
					  padding: 40px;		  
					  background-color:white;
					  border-radius: 30px;
					  z-index:1001;
					  display:flex;
					  flex-direction:column;
		">
 <%-------------------------------------------------------------------------- --%>
    <div style="flex:1; overflow-y:auto;">
    <table class="table table-striped">
        <thead>
            <tr>
                <th>제목</th>
                <th>감독</th>
                <th>개봉일</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="movie" items="${movieList}">
                <tr style="cursor:pointer;"
                            onclick="location.href='${root}/admin/movie/info?movie_id=${movie.movieId}'">
                    <td>${movie.title}</td>
                    <td>${movie.director}</td>
                    <td><fmt:formatDate value="${movie.releaseDate}" pattern="yyyy-MM-dd"/>
					</td>  
                </tr>
            </c:forEach>
            <c:if test="${empty movieList}">
                <tr>
                    <td colspan="3" class="text-center">등록된 영화가 없습니다.</td>
                </tr>
            </c:if>
        </tbody>
    </table>

	<div class = "d-flex justify-content-end gap-2"
	 	  style="margin-right:40px; 
	 	  ">
	
		<a href="${root}/admin/movie/create" 
		   class="btn btn-lg btn-secondary">추가</a>
	</div>	
	</div>
			 

 <%-------------------------------------------------------------------------- --%>
			</div>
	</div>
	
	<%-- [Contents] ######################################################### --%>

	<jsp:include page="/layout/script.jsp" />
</body>
</html>
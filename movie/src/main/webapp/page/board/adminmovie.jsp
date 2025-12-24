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
		">
 <%-------------------------------------------------------------------------- --%>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>제목</th>
                <th>감독</th>
                <th>장르</th>
                <th>출시일</th>
                <%-- 
                <th>포스터</th>
                --%>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="movie" items="${moviesList}">
                <tr>
                    <td>${movie.title}</td>
                    <td>${movie.director}</td>
                    <td>${movie.genre}</td>
                    <td><fmt:formatDate value="${movie.release_date}" pattern="yyyy-MM-dd"/></td>
             <%-- 
             		<td><img src="${movie.poster_url}" width="100"/></td>
             --%>       
                </tr>
            </c:forEach>
            <c:if test="${empty moviesList}">
                <tr>
                    <td colspan="5" class="text-center">등록된 영화가 없습니다.</td>
                </tr>
            </c:if>
        </tbody>
    </table>

	<div class = "d-flex justify-content-end gap-2"
	 	  style="margin-right:40px; 
	 	  ">
	
		<a href="${root}/page/board/adminmovieupload.jsp" 
		   class="btn btn-lg btn-secondary">등록</a>
	</div>	
			 

 <%-------------------------------------------------------------------------- --%>
			</div>
	</div>
	
	<%-- [Contents] ######################################################### --%>

	<jsp:include page="/layout/script.jsp" />
</body>
</html>
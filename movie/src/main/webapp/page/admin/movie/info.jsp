<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>유저 정보</title>
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
						 color: #7D81CA;">유저 정보</h1>
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
		
		<%-- 유저 정보 게시판 --%>
		<div class="row justify-content-center"
			 style="flex:1; overflow-y:auto; margin-top:10px;">
			<div class="col-12 col-md-10 col-lg-10">
			
				
				<div class="mb-3">
		          <label style="font-size:20px;">넘버</label>
		          <p class="form-control-plaintext">${movie.movieId}</p>
		      	</div>
		      	
		      	<div class="mb-3">
				    <label style="font-size:20px;">포스터</label>
				    <br>
				    <c:if test="${not empty movie.imgPath}">
				        <img src="${movie.imgPath}" 
				             alt="${movie.title} 포스터" 
				             style="max-width:200px; height:auto; border-radius:10px;">
				    </c:if>
				    <c:if test="${empty movie.imgPath}">
				        <p class="form-control-plaintext">포스터 이미지가 없습니다.</p>
				    </c:if>
				</div>
			    <div class="mb-3">
		          <label style="font-size:20px;">제목</label>
		          <p class="form-control-plaintext">${movie.title}</p>
		      	</div>
			    <div class="mb-3">
		          <label style="font-size:20px;">서브타이틀</label>
		          <p class="form-control-plaintext">${movie.subTitle}</p>
		      	</div>
		      	
			    <div class="mb-3">
		          <label style="font-size:20px;">감독</label>
		          <p class="form-control-plaintext">${movie.actor}</p>
		      	</div>
			    <div class="mb-3">
		          <label style="font-size:20px;">장르</label>
		          <p class="form-control-plaintext">${MovieGenre.genre}</p>
		      	</div>
			    <div class="mb-3">
		          <label style="font-size:20px;">개봉국가</label>
		          <p class="form-control-plaintext">${movie.country}</p>
		      	</div>
			    <div class="mb-3">
		          <label style="font-size:20px;">개봉일</label>
		          <br>
		          <fmt:formatDate value="${movie.releaseDate}" pattern="yyyy-MM-dd"/>
		      	</div>
			    <div class="mb-3">
		          <label style="font-size:20px;">러닝타임</label>
		          <p class="form-control-plaintext">${movie.playTime} 분</p>
		      	</div>
			    <div class="mb-3">
		          <label style="font-size:20px;">줄거리</label>
		          <p class="form-control-plaintext">${movie.description}</p>
		      	</div>
				<div class = "d-flex justify-content-end gap-2">
                    <form action="${pageContext.request.contextPath}/admin/users/delete" 
                    	  method="post" 
                    	  onsubmit="return confirm('정말 삭제하시겠습니까?');">
                        <input type="hidden" name="userId" value="${user.no}" />
                        <button type="submit" class="btn btn-lg btn-danger" >삭제</button>
                         <a href="${root}/admin/movie/update?movie_id=${movie.movieId}" class="btn btn-lg btn-primary">수정</a>
                        <a href="javascript: history.back()" class="btn btn-lg btn-secondary">취소</a>
                        <a></a>
                    </form>
                </div>
				

			</div>
		</div>

		<%-- 게시판 끝 --%>
		</div>
	</div>
	
	
	<%-- [Contents] ######################################################### --%>

	<jsp:include page="/layout/script.jsp" />
	

</body>
</html>
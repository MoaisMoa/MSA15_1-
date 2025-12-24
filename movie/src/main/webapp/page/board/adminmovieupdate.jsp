<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>관리자 페이지 - 영화 수정</title>
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
						 color: #7D81CA;">유저 관리</h1>
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
				<h1 class="display-4 fw-bold">게시판 프로젝트</h1>
				<div class="col-lg-6 mx-auto">
					<p class="lead mb-4">JSP 게시판 프로젝트 입니다.</p>
					<div class="d-grid gap-2 d-sm-flex justify-content-sm-center mb-5">
						<a href="${ root }/board/list" class="btn btn-primary btn-lg px-4 me-sm-3">
							게시글 목록
						</a>	
						<a href="${ root }/login" class="btn btn-outline-secondary btn-lg px-4">
							로그인
						</a>
					</div>
				</div>
				<div class="overflow-hidden">
					
				</div>
			</div>
	</div>
	
	<%-- [Contents] ######################################################### --%>

	<jsp:include page="/layout/script.jsp" />
</body>
</html>
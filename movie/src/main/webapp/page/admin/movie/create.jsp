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
            <label>내용</label>
            <textarea name="description" class="form-control" rows="4"></textarea>
        </div>
        <div class="mb-3">
            <label>포스터</label>
            <input type="text" name="img_path" class="form-control">
        </div>
        <div class="mb-3">
            <label>상영시간</label>
            <input type="text" name="play_time" class="form-control">
        </div>

        
        <button type="submit" class="btn btn-primary">등록</button>
    </form>



		
		
		
<%---------------------------------------------------------------------- --%>
		</div>
	</div>
	
	<%-- [Contents] ######################################################### --%>

	<jsp:include page="/layout/script.jsp" />
</body>
</html>
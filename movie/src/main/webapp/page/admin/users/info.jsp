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
		          <label style="font-size:20px;">아이디</label>
		          <p class="form-control-plaintext">${user.username}</p>
		      	</div>
			    <div class="mb-3">
		          <label style="font-size:20px;">이름</label>
		          <p class="form-control-plaintext">${user.name}</p>
		      	</div>
			    <div class="mb-3">
		          <label style="font-size:20px;">이메일</label>
		          <p class="form-control-plaintext">${user.email}</p>
		      	</div>
			    <div class="mb-3">
		          <label style="font-size:20px;">생년월일</label>
		          <p class="form-control-plaintext">${user.birth}</p>
		      	</div>
			    <div class="mb-3">
		          <label style="font-size:20px;">전화번호</label>
		          <p class="form-control-plaintext">${user.tel}</p>
		      	</div>
				<div class = "d-flex justify-content-end gap-2">
                    <form action="${pageContext.request.contextPath}/admin/users/delete" 
                    	  method="post" 
                    	  onsubmit="return confirm('정말 삭제하시겠습니까?');">
                        <input type="hidden" name="userId" value="${user.no}" />
                        <button type="submit" class="btn btn-lg btn-danger" >삭제</button>
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
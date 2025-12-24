<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>project💻 - ALOHA CLASS🌴</title>
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
		
		<%-- 유저 정보 게시판 --%>
		<div class="row justify-content-center">
			<div class="col-12 col-md-10 col-lg-10">
			
				<form action="${ root }/join" name="joinForm" method="post">
				
					<div class="d-flex mb-4 gride text-center ">
					
						<input type="text" class="form-control me-2 " 
							   name="username" id="username" placeholder="이름" required>
							   
						<select class="form-select" name="gender" id="gender" required>
							<option value="" selected disabled>성별</option>
							<option value="female">여성</option>
							<option value="male">남성</option>								
						</select> 						
					</div>
					
					<div class="input-group mx-0 mb-4">				
						<input type="password" class="form-control" 
							   name="password" id="password" placeholder="비밀번호" required>
					</div>
					
					<div class="input-group mx-0 mb-4 ">
						<input type="password" class="form-control" 
							   name="password_confirm" id="password_confirm" placeholder="비밀번호 확인" required>
					</div>
					
					<div class="input-group mx-0 mb-4 ">
						<input type="text" class="form-control" 
							   name="email" id="email" placeholder="이메일" required>
					</div>
					
					<div class="input-group mx-0 mb-4 ">
						<input type="text" class="form-control " 
							   name="email" id="email" placeholder="생년월일">
					</div>
					
					<div class = "d-flex justify-content-end gap-2">
						<input type="button" class="btn btn-lg btn-primary" value="수정" onclick="checkUser()" />
						<a href="javascript: history.back()" class="btn btn-lg btn-secondary">취소</a>
					</div>	
				</form>
				
			</div>
		</div>

		<%-- 게시판 끝 --%>
			</div>
	</div>
	
	
	<%-- [Contents] ######################################################### --%>

	<jsp:include page="/layout/script.jsp" />
</body>
</html>
<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>마이페이지 프로필</title>
	<jsp:include page="/layout/meta.jsp" />
	<jsp:include page="/layout/link.jsp" />
</head>
<body>

	<jsp:include page="/layout/header.jsp" />
	<%-- [Contents] ######################################################### --%>
	
	
	<div class=container
		 style="box-sizing: border-box;
				margin-top: 100px;
				width: 600px;
				height:800px;
				justify-content: center;
				background: #FFFFFF;
				border: 2px solid #AFAFAF;
				border-radius: 30px;		 
		 ">
		 
		 
		 
		 <h1 style="text-align:center;
					font-size: 32px;
					margin-top: 80px;
					margin-bottom: 40px;
					color: #7B68EE;
		 "> 정보 수정</h1>
		 
		 <div style="display: flex; 
		 			 justify-content: center; 
		  			 ">
		    <div style="
		        width: 100px;
		        height: 100px;
		        background-color: #D4CDFF;
		        border-radius: 50%;
		    "></div>
		</div>
		<div class="px-1 py-1 mt-1 text-center mb-5">
			<p>프로필 사진 변경</p>
		</div>
		
		
		
	
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

	

</div>

	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>
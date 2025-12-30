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
		 			 margin-bottom : 50px; 
		  			 ">
		</div>

<%-- 밑에 정보 --%>		
	
		<div class="row justify-content-center">
			<div class="col-12 col-md-10 col-lg-10">
				<form id="movieForm" method="post" action="${root}/admin/movie/update">
                    <input type="hidden" name="user_id" value="${user.no}" />					
					
					<div class="mb-3">
			          <label style="font-size:20px;">아이디</label>
			          <p class="form-control-plaintext">${user.username}</p>
			      	</div>
			      	
				      <div class="mb-3">
				          <label style="font-size:20px;">이름</label>
				          <input type="text" name="name" class="form-control" value="${user.name}" required />
				      </div>
				      
				      <div class="mb-3">
				          <label style="font-size:20px;">이메일</label>
				          <input type="email" name="email" class="form-control" value="${user.email}" />
				      </div>
				      
				      <div class="mb-3">
				          <label style="font-size:20px;">생년월일</label>
				          <input type="date" name="birth" class="form-control" value="${user.birth}" />
				      </div>
				      <div class="mb-3">
				          <label style="font-size:20px;">전화번호</label>
				          <input type="text" name="tel" class="form-control" value="${user.tel}" />
				      </div>
					
					<div class = "d-flex justify-content-end gap-2 mt-3">
						<button type="submit" class="btn btn-lg btn-primary">저장</button>
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
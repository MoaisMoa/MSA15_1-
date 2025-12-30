<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 아이디 저장 :saveId -->
<%
	//form 값 읽으
	String userName = request.getParameter("username");
	String userPW = request.getParameter("password");
	String save_check = request.getParameter("saveId");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<jsp:include page="/layout/meta.jsp"/>
<jsp:include page="/layout/link.jsp"/>
<link rel="stylesheet" href="${root}/static/css/movie/login.css">

	<script>
		
		//쿠키 조회
// 		function getCookie(name){
// 			const cookie = document.cookie;
// 			if(document.cookie != ""){
// 			var cookieArray = cookie.split("; ");
// 			for (var index in cookieArray) {
// 				var cookieName = cookieArray[index].split("=");
// 				if(cookieName[0] == name){
// 					return cookieName[1];
// 					}
// 				}
// 			} return;
// 		}
		
// 		function setCookie()
	</script>
	
</head>

<body>

<jsp:include page="/layout/header.jsp"></jsp:include>
	
<main>
	<section class="login-section">
	  <div class="container py-5">
			<div class="row d-flex justify-content-center">
				<div class="col-12 col-md-8 col-lg-6 col-xl-5">
					<div class="card login-card">
						<div class="card-body p-5">
							<form action="${root}/login" method="post">
								<h2 class="mb-5 login-title" style="color: #7B68EE;">사이트 제목</h2>
								
									<div class=login-group>
										<input type="text" id="username" name="username" class="form-control login-input" placeholder="아이디 입력" required/>
										<input type="password" id="password" name="password" class="form-control login-input" value=" placeholder="비밀번호 입력" required/>
									</div>
										<!-- 아이디 저장하기 -->
									<div class="form-check login-remember">
									<c:if test="${saveId == null || saveId == ''}">
									<input class="form-check-input" type="checkbox" name="saveId" id="save-Id"/>
									</c:if>
									<c:if test="${saveId != null && saveId == 'on'}">
									<input class="form-check-input" type="checkbox" name="saveId" id="save-Id" checked/>
									</c:if>
										<label class="form-check-label" for = "save-Id">아이디 저장하기</label>
									</div>									
								<button class="btn-login btn btn-lg w-100" id="loginBtn" type="submit">로그인</button>
							</form>
							<div class="mt-4 d-flex flex-column gap-2 join-link-group">						
								<a href="${root}/page/user/join.jsp" class="login-join-link">회원이 아니신가요? Sign up</a>
							</div>
						</div>
					</div> 
				</div>
			</div>
		</div>
	</section>
</main>



	<jsp:include page="/layout/footer.jsp"></jsp:include>
	<jsp:include page="/layout/script.jsp"></jsp:include>
</body>
</html>
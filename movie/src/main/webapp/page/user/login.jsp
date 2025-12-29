<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<jsp:include page="/layout/meta.jsp"/>
<jsp:include page="/layout/link.jsp"/>
<link rel="stylesheet" href="${root}/static/css/movie/login.css">
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
								<button class="btn btn-primary btn-lg w-100 btn-login" type="submit">로그인</button>
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
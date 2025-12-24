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
</head>

<body class="bh-body-tertiary">
	<jsp:include page="/layout/header.jsp"></jsp:include>
	
	<main>
	<section class="" style=" background-color: white;">
	  <div class="container py-5">
		<form action="${root}/login" method="post">
			<div class="row d-flex justify-content-center">
				<div class="col-12 col-md-8 col-lg-6 col-xl-5">
					<div class="card shadow">
						<div class="card-body p-5 text-center">
							<h1 class="mb-5" style="color: #7B68EE;">Title</h1>
								<input type="email" id="email" class="form-control form-control-lg" placeholder="아이디 입력"/>
							
							<div class="form-outline mb-4">
								<input type="password" id="password" class="form-control form-control-lg" placeholder="비밀번호 입력"/>
							</div>
							
							<div class="form-check d-flex justify-content-start mb-4">
								<input class="form-check-input" type="checkbox" value="" id="rememberMe"/>
								<label class="form-check-label ms-2" for="rememberMe"> 아이디 저장하기 </label>
							</div>
							
							<button class="btn btn-primary btn-lg w-100"
								type="submit" style= "background-color: #7B68EE; border: none;">로그인</button>							
								<p>회원이 아니신가요? <a href="${root}/join" class="text-decoration-none text-dark">회원가입</a></p>
						</div>
					</div>
				</div>
			</div>
		</form>
		</div>
		</section>
	</main>
	<jsp:include page="/layout/footer.jsp"></jsp:include>
	<jsp:include page="/layout/script.jsp"></jsp:include>
</body>
</html>
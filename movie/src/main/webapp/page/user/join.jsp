<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join</title>
<jsp:include page="/layout/meta.jsp"/>
<jsp:include page="/layout/link.jsp"/>
</head>
<body>
	<jsp:include page="/layout/header.jsp"/>
	
	<main>
		<section class="" style="background-color: white;">
			<form action="${root}/join" method="post">
				<div class="row d-flex justify-content-center">
					<div class="col-12 col-md-8 col-lg-6 col-xl-5">
						<div class="card shadow">
							<div class="card-body">
				 				<img src="/movie/page/board/User_icon.jpg" class="rounded-circle alt="Circular Image">
				
										<input type="email" id="email" class="form-control form-control-lg" placeholder="아이디 입력"/>
										<button class="btn btn-primary btn-"></button>
										
										<div class="form-outline mb-4">
										<input type="password" id="password" class="form-control form-control-lg" placeholder="비밀번호 입력"/>
										
									<button class="btn btn-primary btn-lg w-100" type="submit" style="background-color: #7B68EE; border: none;">다음</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</section>
	</main>
	
	<jsp:include page="/layout/footer.jsp"/>
	<jsp:include page="/layout/script.jsp"/>
	
	<script>
		async function clickIdCheck(){
			//ID 유효성 검사
			let username = document.getElementById("username").value
			let usernameCheck = /^[a-zA-Z0-9ㄱ-ㅎㅏ-ㅣ가-힣]{5,20}$/
			let msg = '아이디는 한굴, 영문자, 숫자 5~20자로 입력해주세요.'
			
			if(!usernameCheck.test(username)){
				alert(msg)
				return false
			}
			
			let check = await idCheck()
			if(check){
				alert('중복된 아이디 입니다.')
			} else {
				alert('사용 가능한 아이디 입니다.')
			}
		}
	</script>
</body>
</html>
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
	
	//saveId 체크박스 변화 생기면 saveId() 함수 실행
	document.getElementById('flexCheckDefault').addEventListener('change', function() {saveId();});
		
	//처음 화면 로드 될 때 쿠키 가죠옴!!
	document.addEventListener('DOMContentLoaded', function(){
		let saveId = getCookie("saveId");
		if(saveId !== "") {
			document.getElementById("saveId").value = saveId;
		}
		
		document.getElementById('loginBtn').addEventListener('click', function(event){
			event.priventDefault();
			saveId();
			document.getElementById('loginForm').submit();
		})
	});
	
		//쿠키 조회
		//cname : 
		//cvalue:
		//exdays:
	function setCookie(cname, cvalue, exdays) {
			let d = new Date();
			d.setTime(d.getTime() (exdays * 24 * 60 * 60 * 1000));
			let expires = "expires=" + d.toUTCString();
			document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
		}	
	
		
	//여기서 쿠키 가져옴!
	function getCookie(cname) {
		let name = cname + "=";
		let decodedCookie = decodeURIComponent(document.cookie);
		let ca = decodedCookie.split(';');
		for(let i = 0; i < ca.length; i++) {
			let c = ca[i];
			while(c.charAt(0) == ' '){
				c = c.substring(1);
			}
			if(c.indexOf(name)==0){
				return c.substring(name.length, c.length);
			}
		}
		return "";
	}
	
	//
	function saveId() {
		//체크박스 on이면 쿠키에 아이디 저장
		let loginId = document.getElementById("loginId").value;
		
		if(document.getElementById("flexCheckDefault").checked) {
			setCookie("saveId",loginId, 30); //쿠키는 30일 동안 유효함!
		} else {
			//체크박스 on 아니면 쿠키 삭제!@
			document.cookie = "saveId=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
		}
	}
	
	
	</script>
	
</head>

<body>

<jsp:include page="/layout/header.jsp" />
	
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
										<input type="password" id="password" name="password" class="form-control login-input" placeholder="비밀번호 입력" required/>
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
								<button class="btn-purple" id="loginBtn" type="submit">로그인</button>
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
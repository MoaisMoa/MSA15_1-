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
<link rel="stylesheet" href="${root}/static/css/movie/join.css">
</head>
<body>
<jsp:include page="/layout/header.jsp"/>

<main>
	<div class="container">
		<form action="${root}/join" method="post" enctype="multipart/form-data" class="join-card" onsubmit="return validatePassword()">
		
<!-- 			<!-- 프로필 -->
<!-- 			<div class="avatar-wrap"> -->
<!-- 				<div class="join-avatar"> -->
<%-- 					<img src="${root}/static/img/userProfile.png" alt="user-profile" id="profilePreview"> --%>
<!-- 				</div>		 -->
<!-- 					프로필 변경 아이콘 -->
<!-- 					<button type="button" class="add-icon-btn" onclick="openProfilePicker()"> -->
<%-- 						<img src="${root}/static/img/AddUserProfile.png" alt="add-profile"> --%>
<!-- 					</button> -->
<!-- 			</div>	 -->
			<!-- 이미지 가져오기 -->
<!-- 			<input type="file" id="profileImage" name="profileImage" accept="image/*" style="display:none" onchange="previewProfile(this)"> -->

			<!-- 아이디 -->
			<div class="form-row">
				<input type="text" id="username" name="username" class="join-input" placeholder="아이디 입력" required>
				<button type="button" class="btn-outline-purple" onclick="clickIdCheck()">중복확인</button>
			</div>
			<!-- 비밀번호 -->
			<div class="form-group">
				<input type="password" id="password" name="password" class="join-input" placeholder="비밀번호 입력" required>
			</div>
			
			<!-- 비밀번호 확인 -->
			<div class="form-group">
				<input type="password" id="passwordCheck" name="passwordCheck" class="join-input" placeholder="비밀번호 확인" onkeyup="checkPasswordMatch()" required>
				<p id="passwordError" class="password-error" style="display:none;">비밀번호가 일치하지 않습니다</p>
			</div>
			
			 <!-- 이름 -->
          <div class="mb-3">
            <input type="text" name="name" class="form-control form-control-lg" placeholder="이름" required>
          </div>
			
            <!-- 이메일 -->
          <div class="input-group mb-3">
            <input name="mail1" class="form-control" required>
            <span class="input-group-text">@</span>
            <select name="mail2" class="form-select">
              <option value="naver.com">naver.com</option>
              <option value="gmail.com">gmail.com</option>
              <option value="daum.net">daum.net</option>
              <option value="nate.com">nate.com</option>
            </select>
          </div>
          
           <!-- 생년월일 -->
          <div class="row mb-3">
            <div class="col">
              <input name="birthhyy" class="form-control" placeholder="년" required>
            </div>
            <div class="col">
              <input name="birthhmm" class="form-control" placeholder="월" required>
            </div>
            <div class="col">
              <input name="birthhdd" class="form-control" placeholder="일" required>
            </div>
          </div>
        
			<!-- 전화번호 -->
          <div class="form-row">
              <select name="tel1" class="join-input">
                <option value="010">010</option>
                <option value="011">011</option>
                <option value="016">016</option>
                <option value="017">017</option>
                <option value="019">019</option>
              </select>
            <input type="text" name="tel2" class="join-input" required>
  			<input type="text" name="tel3" class="join-input" required>
          </div>
            
			<!-- 완료 버튼 -->
			<button type="submit" class="btn-purple">완료</button>
		</form>
	</div>
</main>
	
<jsp:include page="/layout/footer.jsp"/>
<jsp:include page="/layout/script.jsp"/>

<script>
	const root = "${root}"

	async function clickIdCheck() {
		
		// 아이디 유효성 검사
		let username = document.getElementById("username").value
		let usernameCheck = /^[a-zA-Z0-9ㄱ-ㅎㅏ-ㅣ가-힣]{5,20}$/
		let msg = '아이디는 한글, 영문자, 숫자 5~20 자로 입력해주세요.'
		if(!usernameCheck.test(username)) {
			alert(msg)
			return false
		}
		
		let check = await idCheck(root + '/id-check')		// /movie/id-check
		if( check ) {
			alert('중복된 아이디 입니다.')
		} else {
			alert('사용 가능한 아이디 입니다.')
		}
	}
	
	
	// 비밀번호 일치 여부
	function checkPasswordMatch() {
		  const pw = document.getElementById("password").value;
		  const pwCheck = document.getElementById("passwordCheck").value;
		  const error = document.getElementById("passwordError");
	
		  //입력 안했을 경우에 숨긴다!
		  if (pwCheck.length === 0) {
		    error.style.display = "none";
		    return;
		  }
		  //다르면 에러 표시함!
		  if (pw !== pwCheck) {
		    error.style.display = "block";
		  } else {
		    error.style.display = "none";
		  }
		}
		
	// 다 안쓰면 버튼 안눌림!
	function validatePassword() {
	  const pw = document.getElementById("password").value;
	  const pwCheck = document.getElementById("passwordCheck").value;
	
	  if (pw !== pwCheck) {
	    alert("비밀번호가 일치하지 않습니다.");
	    return false;
	  }
	  return true;
	}
</script>


</body>
</html>

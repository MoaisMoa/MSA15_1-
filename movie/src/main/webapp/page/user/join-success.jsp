<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>회원가입 완료</title>
    <jsp:include page="/layout/link.jsp"/>
    
    <style>
  .join-success-title {
    font-size: 40px;
    font-weight: 800;
    color: #7B68EE;
  }
  .btn-purple {
    background-color: #7B68EE;
    border-color: #7B68EE;
    color: #fff;
  }
  .btn-purple:hover {
    background-color: #6a5acd;
    border-color: #6a5acd;
    color: #fff;
  }

  .btn-purple-outline {
    border-color: #7B68EE;
    color: #7B68EE;
  }
  .btn-purple-outline:hover {
    background-color: #7B68EE;
    color: #fff;
  }
</style>
</head>
<body>

<jsp:include page="/layout/header.jsp"/>

<main>
    <section class="login-section">
        <div class="container py-5">
            <div class="row d-flex justify-content-center">
                <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                    <div class="card login-card">
                        <div class="card-body p-5 text-center">

                            <h2 class="mb-4 login-title join-success-title">회원가입 완료</h2>

                            <p class="fs-5 mb-4"><strong>${username}</strong> 님, 환영합니다</p>

                            <div class="d-flex justify-content-center gap-3" style="color: #7B68EE;">
                                <a href="${root}" class="btn btn-purple btn-login">홈으로</a>
                                <a href="${root}/page/user/login.jsp" class="btn btn-purple-outline">로그인</a>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>

<jsp:include page="/layout/footer.jsp"/>

</body>
</html>


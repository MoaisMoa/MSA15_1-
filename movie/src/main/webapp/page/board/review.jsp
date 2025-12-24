<%@ include file="/layout/jstl.jsp"%>
<%@ include file="/layout/common.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>리뷰 페이지</title>
<jsp:include page="/layout/meta.jsp" />
<jsp:include page="/layout/link.jsp" /><link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="/layout/header.jsp" />
	<%-- [Contents] ######################################################### --%>
<div class="container my-5">

	<!-- 영화 정보 -->
	<div class="row">
		<!-- 포스터 -->
		<div class="col-md-4 text-center">
			<img src="../img/노트북.jfif" class="img-fluid rounded" alt="노트북">
		</div>

		<!-- 상세 정보 -->
		<div class="col-md-8">
			<h2>노트북</h2>
			<div class="text-muted mb-2">The Notebook</div>

			<!-- 메타 정보 -->
			<div class="d-flex gap-4 mb-3">
				<div>
					<img src="../img/star.png" width="18"> 7.8
				</div>
				<div>
					<img src="../img/calender.png" width="18"> 2004
				</div>
				<div>
					<img src="../img/clock.png" width="18"> 123분
				</div>
			</div>

			<!-- 장르 -->
			<div class="mb-3">
				<span class="badge bg-primary">로맨스</span>
				<span class="badge bg-primary">드라마</span>
			</div>

			<!-- 줄거리 -->
			<h5>줄거리</h5>
			<p class="text-secondary">
				시간이 흘러도 변하지 않는 진정한 사랑의 이야기.
				가슴 뭉클한 감동의 로맨스
			</p>

			<!-- 제작 정보 -->
			<div class="row">
				<div class="col-2 fw-bold">감독</div>
				<div class="col-10">닉 카사베츠</div>

				<div class="col-2 fw-bold mt-2">출연</div>
				<div class="col-10 mt-2">
					라이언 고슬링, 레이첼 맥아담스
				</div>
			</div>
		</div>
	</div>

	<!-- 관람평 -->
	<div class="mt-5">
		<div class="d-flex justify-content-between align-items-center mb-3">
			<h5>관람평 (1)</h5>
			<button type="button" class="btn btn-outline-primary">리뷰 작성</button>
		</div>

		<!-- 리뷰 카드 -->
		<div class="card">
			<div class="card-body">
				<div class="d-flex justify-content-between">
					<div>
						<strong>리뷰작성자1</strong>
						<div class="text-muted small">2025-12-22</div>
					</div>
					<div class="fw-bold">
						<img src="../img/rank_star.png" width="18"> 8.0
					</div>
				</div>

				<p class="mt-3">
					눈물 없이 볼 수 없는 아름다운 사랑 이야기.
					라이언 고슬링 최고!
				</p>

				<div class="text-end">
					<img src="../img/pencil.png" width="18">
					<img src="../img/recycle.png" width="18">
				</div>
			</div>
		</div>
	</div>

</div>




	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>
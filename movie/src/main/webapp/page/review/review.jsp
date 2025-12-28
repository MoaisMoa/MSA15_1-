<%@ include file="/layout/jstl.jsp" %>
	<%@ include file="/layout/common.jsp" %>
		<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
			<!DOCTYPE html>
			<html>

			<head>
				<title>리뷰 페이지 - ${movie.title}</title>
				<link rel="stylesheet" href="path-to/node_modules/mdi/css/materialdesignicons.min.css" />
				<jsp:include page="/layout/meta.jsp" />
				<jsp:include page="/layout/link.jsp" />
				<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
					integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
					crossorigin="anonymous">
				<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
					integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
					crossorigin="anonymous"></script>
			</head>

			<body>
				<jsp:include page="/layout/header.jsp" />
				<%-- [Contents] ######################################################### --%>
					<div class="container my-5">

						<!-- 영화 정보 -->
						<div class="row">
							<!-- 포스터 -->
							<div class="col-md-4 text-center">
								<img src="${pageContext.request.contextPath}/static/img/movie/${movie.detailImgPath}"
									class="img-fluid rounded" alt="${movie.title}">
							</div>

							<!-- 상세 정보 -->
							<div class="col-md-8">
								<h2>${movie.title}</h2>
								<div class="text-muted mb-2">${movie.subTitle}</div>

								<!-- 메타 정보 -->
								<div class="d-flex gap-4 mb-3">
									<div>
										<img src="${pageContext.request.contextPath}/static/img/review/star.png"
											width="18">
										${movie.averageRating}
									</div>
									<div>
										<img src="${pageContext.request.contextPath}/static/img/review/calender.png"
											width="18">
										<fmt:formatDate value="${movie.releaseDate}" pattern="yyyy" />
									</div>
									<div>
										<img src="${pageContext.request.contextPath}/static/img/review/clock.png"
											width="18">
										${movie.playTime}분
									</div>
								</div>

								<!-- 장르 -->
								<div class="mb-3">
									<c:choose>
										<c:when test="${empty genreList}">
											<span class="badge bg-secondary">장르 없음</span>
										</c:when>
										<c:otherwise>
											<c:forEach var="genre" items="${genreList}">
												<span class="badge bg-primary">${genre.genre}</span>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</div>


								<!-- 줄거리 -->
								<h5>줄거리</h5>
								<p class="text-secondary">
									${movie.description}
								</p>

								<!-- 제작 정보 -->
								<div class="row">
									<div class="col-2 fw-bold">감독</div>
									<div class="col-10">${movie.director}</div>

									<div class="col-2 fw-bold mt-2">출연</div>
									<div class="col-10 mt-2">
										${movie.actor}
									</div>
								</div>
							</div>
						</div>

						<!-- 관람평 -->
						<div class="mt-5">
							<div class="d-flex justify-content-between align-items-center mb-3">
								<h5>관람평 (${fn:length(reviewList)})</h5>
								<button type="button" class="btn btn-outline-primary" data-bs-toggle="collapse"
									data-bs-target="#reviewForm">리뷰 작성</button>
							</div>

							<!-- 중복 리뷰 에러 모달 -->
							<div class="modal fade" id="errorModal" tabindex="-1" aria-labelledby="errorModalLabel"
								aria-hidden="true">
								<div class="modal-dialog modal-dialog-centered">
									<div class="modal-content">
										<div class="modal-header border-0">
											<h5 class="modal-title fw-bold" id="errorModalLabel">리뷰 등록 실패</h5>
											<button type="button" class="btn-close" data-bs-dismiss="modal"
												aria-label="Close"></button>
										</div>
										<div class="modal-body">
											${param.error}
										</div>
										<div class="modal-footer border-0">
											<button type="button" class="btn btn-outline-secondary"
												data-bs-dismiss="modal">취소</button>
											<button type="button" class="btn btn-primary"
												data-bs-dismiss="modal">확인</button>
										</div>
									</div>
								</div>
							</div>

							<c:if test="${not empty param.error}">
								<script>
									document.addEventListener('DOMContentLoaded', function () {
										var errorModal = new bootstrap.Modal(document.getElementById('errorModal'));
										errorModal.show();
									});
								</script>
							</c:if>

							<!-- 리뷰 작성 폼 -->
							<div class="collapse mb-4" id="reviewForm">
								<div class="card">
									<div class="card-body">
										<form action="${pageContext.request.contextPath}/review/write" method="post">
											<input type="hidden" name="movieId" value="${movie.movieId}" />

											<!-- 이름 -->
											<div class="mb-3">
												<input type="text" class="form-control" name="userName" placeholder="이름"
													readonly
													value="${sessionScope.user != null ? sessionScope.user.username : '로그인 필요'}" />
											</div>

											<!-- 평점 -->
											<div class="mb-3">
												<label class="form-label">평점 : </label>
												<div class="btn-group rating-group" role="group">
													<c:forEach begin="1" end="10" var="i">
														<input type="radio" class="btn-check" name="rating"
															id="rating${i}" value="${i}" autocomplete="off" ${i==7
															? 'checked' : '' }>
														<label class="btn btn-outline-primary rating-btn"
															for="rating${i}">${i}</label>
													</c:forEach>
												</div>
											</div>

											<!-- 내용 -->
											<div class="mb-3">
												<textarea class="form-control" name="content" rows="4"
													placeholder="영화에 대한 감상을 남겨주세요..."></textarea>
											</div>

											<!-- 버튼 -->
											<div class="d-flex gap-2">
												<button type="submit" class="btn btn-primary">등록</button>
												<button type="button" class="btn btn-outline-secondary"
													data-bs-toggle="collapse" data-bs-target="#reviewForm">취소</button>
											</div>
										</form>
									</div>
								</div>
							</div>

							<c:choose>
								<c:when test="${empty reviewList}">
									<div class="alert alert-info">등록된 리뷰가 없습니다.</div>
								</c:when>
								<c:otherwise>
									<c:forEach var="review" items="${reviewList}">
										<!-- 리뷰 카드 -->
										<div class="card mb-3">
											<div class="card-body">
												<div class="d-flex justify-content-between">
													<div>
														<strong>${review.username}</strong>
														<div class="text-muted small">
															<fmt:formatDate value="${review.createdAt}"
																pattern="yyyy-MM-dd" />
														</div>
													</div>
													<div class="fw-bold">
														<img src="${pageContext.request.contextPath}/static/img/review/rank_star.png"
															width="18"> ${review.rating}
													</div>
												</div>

												<p class="mt-3">
													${review.content}
												</p>

												<!-- 수정/삭제 버튼 (본인이 작성한 리뷰만 표시) -->
												<c:if test="${review.userId == 1}">
													<div class="text-end">
														<img src="${pageContext.request.contextPath}/static/img/review/pencil.png"
															width="18" class="cursor-pointer"
															onclick="editReview(${review.reviewId}, ${review.rating}, '${review.content}')"
															title="수정">
														<img src="${pageContext.request.contextPath}/static/img/review/recycle.png"
															width="18" class="cursor-pointer ms-2"
															onclick="confirmDelete(${review.reviewId}, ${movie.movieId})"
															title="삭제">
													</div>
												</c:if>
											</div>
										</div>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</div>
					</div>

					<!-- 삭제 확인 모달 -->
					<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel"
						aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">
								<div class="modal-header border-0">
									<h5 class="modal-title fw-bold" id="deleteModalLabel">리뷰 삭제</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									정말 이 리뷰를 삭제하시겠습니까? 이 작업은 되돌릴 수 없습니다.
								</div>
								<div class="modal-footer border-0">
									<button type="button" class="btn btn-outline-secondary"
										data-bs-dismiss="modal">취소</button>
									<button type="button" class="btn btn-primary" id="confirmDeleteBtn">삭제</button>
								</div>
							</div>
						</div>
					</div>

					<style>
						.cursor-pointer {
							cursor: pointer;
						}

						.cursor-pointer:hover {
							opacity: 0.7;
						}
					</style>

					<script>
						let deleteReviewId = null;
						let deleteMovieId = null;

						// 삭제 확인 모달 표시
						function confirmDelete(reviewId, movieId) {
							deleteReviewId = reviewId;
							deleteMovieId = movieId;
							var deleteModal = new bootstrap.Modal(document.getElementById('deleteModal'));
							deleteModal.show();
						}

						// 삭제 확인 버튼 클릭
						document.getElementById('confirmDeleteBtn').addEventListener('click', function () {
							if (deleteReviewId && deleteMovieId) {
								window.location.href = '${pageContext.request.contextPath}/review/delete?reviewId=' + deleteReviewId + '&movieId=' + deleteMovieId;
							}
						});

						// 리뷰 수정
						function editReview(reviewId, rating, content) {
							// 리뷰 작성 폼 표시
							var reviewForm = document.getElementById('reviewForm');
							var bsCollapse = new bootstrap.Collapse(reviewForm, {
								toggle: true
							});

							// 폼 데이터 설정
							document.querySelector('textarea[name="content"]').value = content;
							document.querySelector('input[name="rating"][value="' + rating + '"]').checked = true;

							// 폼 action 변경 및 reviewId 추가
							var form = document.querySelector('#reviewForm form');
							form.action = '${pageContext.request.contextPath}/review/update';

							// reviewId hidden input 추가 또는 업데이트
							var reviewIdInput = form.querySelector('input[name="reviewId"]');
							if (!reviewIdInput) {
								reviewIdInput = document.createElement('input');
								reviewIdInput.type = 'hidden';
								reviewIdInput.name = 'reviewId';
								form.appendChild(reviewIdInput);
							}
							reviewIdInput.value = reviewId;

							// 버튼 텍스트 변경
							var submitBtn = form.querySelector('button[type="submit"]');
							submitBtn.textContent = '수정';

							// 취소 버튼에 리셋 기능 추가
							var cancelBtn = form.querySelector('button[data-bs-toggle="collapse"]');
							cancelBtn.addEventListener('click', function () {
								resetForm();
							}, { once: true });
						}

						// 폼 리셋
						function resetForm() {
							var form = document.querySelector('#reviewForm form');
							form.action = '${pageContext.request.contextPath}/review/write';
							form.reset();

							var reviewIdInput = form.querySelector('input[name="reviewId"]');
							if (reviewIdInput) {
								reviewIdInput.remove();
							}

							var submitBtn = form.querySelector('button[type="submit"]');
							submitBtn.textContent = '등록';
						}
					</script>

					<%-- [Contents] ######################################################### --%>
						<jsp:include page="/layout/footer.jsp" />
						<jsp:include page="/layout/script.jsp" />
			</body>

			</html>
			```
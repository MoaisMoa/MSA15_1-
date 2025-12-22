<%@ include file="/layout/jstl.jsp"%>
<%@ include file="/layout/common.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>리뷰 페이지</title>
<jsp:include page="/layout/meta.jsp" />
<jsp:include page="/layout/link.jsp" />
</head>
<body>
	<jsp:include page="/layout/header.jsp" />
	<%-- [Contents] ######################################################### --%>
	<div class="container">

		<div class="contents">
			<img alt="" src="../img/노트북.jfif" width="500">
		</div>
		<div class="contents">
			<div>
				<img alt="" src="../img/노트북.jfif" width="250">
			</div>
			<div>
				<h2>노트북</h2>
				<div>The Notebook</div>
				<div>
					<div>
						<img alt="" src="../img/star.png" width="20px"> 7.8
					</div>
					<div>
						<img alt="" src="../img/calender.png" width="20px"> 2004
					</div>
					<div>
						<img alt="" src="../img/clock.png" width="20px"> 123분
					</div>
				</div>
				<div>
					<ul>
						<li>로맨스</li>
						<li>드라마</li>
					</ul>
				</div>
			</div>
			<div>줄거리</div>
			<div>시간이 흘러도 변하지 않는 진정한 사랑의 이야기. 가슴 뭉클한 감동의 로맨스</div>
			<div>감독</div>
			<div>닉 카사베츠</div>
			<div>출연</div>
			<div>라이언 고슬링, 레이첼 맥아담스</div>
		</div>

		<div class="contents">
			<div>
				<div>관람평</div>
				<div>(1)</div>
				<div>
					<button>리뷰 작성</button>
				</div>
			</div>
			
			<div>
				<div>
					<div>리뷰작성자1</div>
					<div>2025-12-22</div>
					<div>눈물 없이 볼 수 없는 아름다운 사랑 이야기. 라이언 고슬링 최고!</div>
	
				</div>
				<div>
					<div>
						<img alt="" src="../img/rank_star.png" width="20px">8.0
					</div>
					<div>
						<img alt="" src="../img/pencil.png" width="20px"> <img alt=""
							src="../img/recycle.png" width="20px">
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
<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>마이페이지 리뷰</title>
	<jsp:include page="/layout/meta.jsp" />
	<jsp:include page="/layout/link.jsp" />
</head>
<body>
	<jsp:include page="/layout/header.jsp" />
	<%-- [Contents] ######################################################### --%>
	
	<div class="container d-flex justify-content-center mt-5">
 		<div class="bg-white border rounded-4" 
      	 	 style="width:800px; min-height:600px; border-color:#AFAFAF;">
       
    		<div class="d-flex justify-content-start align-items-center mb-4">
    			<h2 style="color:black;
    				font-size:34px;
    				margin-top:60px;
    				margin-left:40px;
    				">${title} </h2>
    		</div>
    		<hr style="border: 0;
    			border-top: 2px solid black;
    			margin: 0 40px 30px 40px;					
    		">
    		<div style="margin-top 20px;">
    			${content}
    		</div>
    		
    		<div class = "d-flex justify-content-end gap-2"
			 	  style="margin-right:40px;
			 	  
			 	  ">
				
				<form action="${root}/page/board/mypage_r.jsp" method="post"
		      		  onsubmit="return confirm('수정하시겠습니까?');">
		    		<input type="hidden" name="reviews_no" value="${reviews_no}">
		    		<button type="submit" class="btn btn-lg btn-primary">수정</button>
				</form>	 
				
				<form action="${root}/page/board/mypage_r.jsp" method="post"
		      		  onsubmit="return confirm('정말 삭제하시겠습니까?');">
		    		<input type="hidden" name="reviews_no" value="${reviews_no}">
		    		<button type="submit" class="btn btn-lg btn-danger">삭제</button>
				</form>
				
				<a href="javascript: history.back()" class="btn btn-lg btn-secondary">취소</a>
			</div>	

    		

		
		</div>
		
	</div>

	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>
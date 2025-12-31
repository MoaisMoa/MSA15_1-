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
      	 	 style="width:800px; height:1000px; border-color:#AFAFAF;">
       
    		<div class="d-flex justify-content-start align-items-center mb-4">
    			<h2 style="color:#7B68EE; 
    				font-size:34px;
    				margin-top:60px;
    				margin-left:40px;
    				">내 리뷰 게시판</h2>
    		</div>
    		
    		
			<div style="flex:1; overflow-y:auto;">
		<table class="table table-striped">
        <thead>
            <tr>
                <th>번호</th>
                <th>평점</th>
                <th>작성일</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="review" items="${reviewList}">
                <tr style="cursor:pointer;"
                            onclick="location.href='${root}/mypage/reviewinfo?users_id=${user.no}'">        
                    <td>${review.reviewId}</td>
                    <td>${review.rating}</td>
                    <td><fmt:formatDate value="${review.createdAt}" pattern="yyyy-MM-dd"/></td>        
                </tr>
            </c:forEach>
            <c:if test="${empty usersList}">
                <tr>
                    <td colspan="3" class="text-center">작성한 리뷰가 없습니다.</td>
                </tr>
            </c:if>
        </tbody>
    </table>
	</div>
			 
			 
			 <div class = "d-flex justify-content-end gap-2"
			 	  style="margin-right:40px;
			 	  
			 	  ">
	
				<a href="javascript: history.back()" class="btn btn-lg btn-secondary">취소</a>
			</div>	
			 
			 
		</div>
	</div>

	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>
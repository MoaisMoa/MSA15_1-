<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>관리자 페이지 - 리뷰 관리</title>
    <jsp:include page="/layout/meta.jsp" />
    <jsp:include page="/layout/link.jsp" />
</head>
<body>
    <jsp:include page="/layout/adminheader.jsp" />
    <jsp:include page="/layout/adminsidebar.jsp" />

    <div class="container">
        <div style="position:fixed; top:140px; left:320px; right:40px;">
            <h1 style="font-size:40px; color:#7D81CA;">리뷰 관리</h1>
        </div>
        <div style="position:fixed; top:220px; left:320px; right:40px; bottom:40px; padding:40px; background-color:white; border-radius:30px; overflow-y:auto; z-index:1001;">
            
            <table class="table table-striped">
        <thead>
            <tr>
                <th>번호</th>
                <th>내용</th>
                <th>평점</th>
                <th>작성일</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="review" items="${reviewList}">
			    <tr style="cursor:pointer;"      
			        onclick="location.href='${pageContext.request.contextPath}/review?id=${review.movieId}'">        
			        <td>${review.reviewId}</td>
			        <td>
			            <c:choose>
			                <c:when test="${fn:length(review.content) > 30}">
			                    ${fn:substring(review.content, 0, 30)}...
			                </c:when>
			                <c:otherwise>
			                    ${review.content}
			                </c:otherwise>
			            </c:choose>
			        </td>
			        <td>${review.rating}</td>
			        <td><fmt:formatDate value="${review.createdAt}" pattern="yyyy-MM-dd"/></td>        
			    </tr>
			</c:forEach>
			
			<c:if test="${empty reviewList}">
			    <tr>
			        <td colspan="4" class="text-center">작성한 리뷰가 없습니다.</td>
			    </tr>
			</c:if>
        </tbody>
    </table>
        </div>
    </div>

    <jsp:include page="/layout/script.jsp" />
</body>
</html>

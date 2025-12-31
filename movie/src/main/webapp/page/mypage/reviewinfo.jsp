<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>마이페이지 리뷰 상세</title>
    <jsp:include page="/layout/meta.jsp" />
    <jsp:include page="/layout/link.jsp" />
</head>
<body>
<jsp:include page="/layout/header.jsp" />

<div class="container d-flex justify-content-center mt-5">
    <div class="bg-white border rounded-4" 
         style="width:800px; min-height:600px; border-color:#AFAFAF; padding:40px;">
        
        <div class="d-flex justify-content-start align-items-center mb-4">
            <h2 style="color:black; font-size:34px;">${review.title}</h2>
        </div>
        <hr style="border:0; border-top:2px solid black; margin:0 0 30px 0;">

        <div class="row justify-content-center">
            <div class="col-12 col-md-10 col-lg-10">

                <!-- Hidden: User ID / Review ID -->
                <input type="hidden" name="user_id" value="${user.no}" />
                <input type="hidden" name="review_id" value="${review.reviewId}" />

                <!-- 평점 -->
                <div class="mb-3">
                    <label style="font-size:20px;">평점</label>
                    <input type="text" class="form-control" value="${review.rating}" readonly />
                </div>

                <!-- 작성일 -->
                <div class="mb-3">
                    <label style="font-size:20px;">작성일</label>
                    <input type="text" class="form-control" 
                           value="<fmt:formatDate value='${review.createdAt}' pattern='yyyy-MM-dd'/>" 
                           readonly />
                </div>

                <!-- 리뷰 내용 -->
                <div class="mb-3">
                    <label style="font-size:20px;">리뷰 내용</label>
                    <textarea class="form-control" rows="6" readonly>${review.content}</textarea>
                </div>

                <div class="d-flex justify-content-end gap-2 mt-3">
                    <a href="javascript:history.back()" class="btn btn-lg btn-secondary">뒤로</a>
                </div>

            </div>
        </div>

    </div>
</div>

<jsp:include page="/layout/footer.jsp" />
<jsp:include page="/layout/script.jsp" />
</body>
</html>

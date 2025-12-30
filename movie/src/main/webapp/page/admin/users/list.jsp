<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>관리자 페이지 - 유저 목록</title>
	<jsp:include page="/layout/meta.jsp" />
	<jsp:include page="/layout/link.jsp" />
</head>
<body>
	<jsp:include page="/layout/adminheader.jsp" />
	<jsp:include page="/layout/adminsidebar.jsp" />
	<%-- [Contents] ######################################################### --%>
	<div class="container">
		<div style = "position:fixed;
					  top: 140px;
					  left : 320px;
					  right: 40px;
					  ">
			<h1 style = "font-size:40px;
						 color: #7D81CA;">유저 목록</h1>
		</div>
		<div style = "position:fixed;
					  top: 220px;
					  left:320px;
					  right: 40px;
					  bottom: 40px;
					  padding: 40px;		  
					  background-color:white;
					  border-radius: 30px;
					  z-index:1001;
		">
		
		<%-- 유저 정보 게시판 --%>
		<table class="table table-striped">
        <thead>
            <tr>
                <th>아이디</th>
                <th>이름</th>
                <th>생성일</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="user" items="${usersList}">
                <tr style="cursor:pointer;"
                            onclick="location.href='${root}/admin/users/detail?users_id=${user.no}'">        
                    <td>${user.id}</td>
                    <td>${user.name}</td>
                    <td><fmt:formatDate value="${user.createdAt}" pattern="yyyy-MM-dd"/></td>        
                </tr>
            </c:forEach>
            <c:if test="${empty usersList}">
                <tr>
                    <td colspan="3" class="text-center">가입한 유저가 없습니다.</td>
                </tr>
            </c:if>
        </tbody>
    </table>


		<%-- 게시판 끝 --%>
			</div>
	</div>
	
	<%-- [Contents] ######################################################### --%>

	<jsp:include page="/layout/script.jsp" />
</body>
</html>
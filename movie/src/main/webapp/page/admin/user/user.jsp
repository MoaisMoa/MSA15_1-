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
						 color: #7D81CA;">유저 관리</h1>
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
		
		<table class="table table-stripe table hover">
				<thead>
					<tr class="text-center">
						<th scope="col">#</th>
						<th class="text-left w-50" scope="col">유저 아이디</th>
						<th scope="col">이름</th>
						<th scope="col">생성날짜</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${ usersList.isEmpty() }">
	            		<tr>
	            			<td align="center" colspan="5">조회된 데이터가 없습니다.</td>
	            		</tr>
	            	</c:if>
					<c:forEach var="users" items="${usersList}">
	                    <tr class="text-center">
	                        <td>${users.no}</td>
	                        <td class="text-start">
	                        	<a href="${ root }/board/read.jsp?id=${ users.user_id }">
		                        	${users.user_id}
	                        	</a>
	                        </td>
	                        <td>${users.username}</td>
	                        <td>
	                            <fmt:formatDate value="${users.createdAt}" pattern="yyyy-MM-dd HH:mm:ss"/>
	                        </td>

	                    </tr>
	                </c:forEach>
				</tbody>
			</table>
			
		<%-- 게시판 끝 --%>
			</div>
	</div>
	
	<%-- [Contents] ######################################################### --%>

	<jsp:include page="/layout/script.jsp" />
</body>
</html>
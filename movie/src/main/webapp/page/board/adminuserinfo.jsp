<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>관리자 페이지 - 유저 목록 </title>
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
				<table class="table table-hover">
				<thead class="table-dark">
					<tr class="text-center">
						<th scope="col">#</th>
						<th class="text-left w-50" scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${ boardList.isEmpty() }">
	            		<tr>
	            			<td align="center" colspan="5">조회된 데이터가 없습니다.</td>
	            		</tr>
	            	</c:if>
					<c:forEach var="board" items="${boardList}">
	                    <tr class="text-center">
	                        <td>${board.no}</td>
	                        <td class="text-start">
	                        	<a href="${ root }/board/read.jsp?id=${ board.id }">
		                        	${b.title}
	                        	</a>
	                        </td>
	                        <td>${board.user.name}</td>
	                        <td>
	                            <fmt:formatDate value="${board.createdAt}" pattern="yyyy-MM-dd HH:mm:ss"/>
	                        </td>
	                    </tr>
	                </c:forEach>
				</tbody>
			</table>
			<div class="overflow-hidden">
					
			</div>
			</div>
	</div>
	
	<%-- [Contents] ######################################################### --%>

	<jsp:include page="/layout/script.jsp" />
</body>
</html>
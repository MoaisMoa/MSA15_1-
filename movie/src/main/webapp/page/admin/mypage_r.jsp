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
    		
    		
			<div class="container-fluid mt-5"
				 style="max-width: 600px;">
    		<table class="table table-striped table-hover mb-4  ">
    		<thead>
	    		<tr>
		    		<th scope="col">#</th>
		    		<th scope="col">영화</th>
		    		<th scope="col">제목</th>
		    		<th scope="col">작성일</th>
		    		<th scope="col">관리</th>
	    		</tr>
    		</thead>
	    		<tbody>
				    <tr>
				      <th scope="row">1</th>
				      <td>Mark</td>
				      <td>Otto</td>
				      <td>@mdo</td>
				      <td>
				      	<a href="${root}/page/board/mypage_r_m.jsp?id=${users.user_id}" class="btn btn-sm btn-primary">관리</a>
				      </td>
				    </tr>
				    <tr>
				      <th scope="row">1</th>
				      <td>Mark</td>
				      <td>Otto</td>
				      <td>@mdo</td>
				    </tr>
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
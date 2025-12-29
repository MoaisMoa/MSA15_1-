<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>마이 페이지</title>
	<jsp:include page="/layout/meta.jsp" />
	<jsp:include page="/layout/link.jsp" />
</head>
<body>
<style>
	.r_btn {width:250px;
   			height: 60px;
   			display: inline-block;
   			box-sizing:border-box;
			margin-left: 45px;
   			background:#7B68EE;
   			border: 1px solid #AFAFAF;
   			border-radius: 15px;
   			text-align-items:center;
   			color:white;
   			font-size: 24px;
   			cursor: pointer;
	}
	.p_btn {width:250px;
		   height: 60px;
		   background:#7B68EE;
		   border: 1px solid #AFAFAF;
		   margin-right:40px;
		   display: inline-block;
		   box-sizing:border-box;
		   border-radius: 15px;
		   text-align-items:center;
		   color:white;
		   font-size: 24px;
		   cursor: pointer;
	}
	
    .r_btn:hover,
    .p_btn:hover {
    	border : 1px solid #7B68EE;
        background-color: white;
        color: #7B68EE;
    }


</style>

	<jsp:include page="/layout/header.jsp" />
	<%-- [Contents] ######################################################### --%>
	<div class=container
		 style="box-sizing: border-box;
				position: flex;
				justify-content:center;
				margin-top: 100px;
				width: 600px;
				height: 422px;
				left: calc(50% - 600px/2);
				top: 301px;
				
				background: #FFFFFF;
				border: 2px solid #AFAFAF;
				border-radius: 30px;		 
		 ">
		 
		 
		 <div style="
					width: 500px;
					height: 90px;
					margin-top:60px;
					

					background-color:white;
		 ">
		 

		  <h1 style="margin-top:20px; 
		  			 margin-left:45px; 
		  			 font-size: 32px;">
            		 ${user.username}
        </h1>
        <p style="margin-top:0px; 
        		  margin-left:45px; 
        		  font-size:16px;">
            	  ${user.email}
        </p>

		 
		 </div>
		<div style="display: flex;
					justify-content: center;
					gap:20px;
					
					">
		    <button class="r_btn" 
		    onclick="location.href='mypage_r.jsp'">내 리뷰 보기</button>
		    
		    <button class="p_btn" 
		    onclick="location.href='mypage/info'">내 정보 보기</button>      
		</div>
	</div>
	
	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>
<%-- 전역변수 --%>
<%
	// Context Path (루트 경로)
	String root = request.getContextPath();
	pageContext.setAttribute("root", root);
	// 로그인 아이디 (세션)
	String username = (String) session.getAttribute("username");	
	pageContext.setAttribute("username", username);
	// ...
%>
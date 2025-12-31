//package movie.filter;
//
//import jakarta.servlet.Filter;
//import jakarta.servlet.FilterChain;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.ServletRequest;
//import jakarta.servlet.ServletResponse;
//import jakarta.servlet.annotation.WebFilter;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//
//import java.io.IOException;
//
////로그인 검사하는 필터임!@
//
//@WebFilter("/page/*")
//public class AuthFilter implements Filter {
//
//	@Override
//	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
//			throws IOException, ServletException {
//		//servletRequest를 HttpServletRequest로 다운 캐스팅함!
//		HttpServletRequest req = (HttpServletRequest) request;
//		//servletReponse를 HttpServletResponse로 다운 캐스팅함!
//		HttpServletResponse resp = (HttpServletResponse) response;
//		
//		//세션이 없으면 로그인 안된거임! 없으면 null 반환할거고 로그인 안했는데 세션 생기는거 방지할거야.
//		HttpSession session = req.getSession(false);
//		
//		//로그 확인용..
//		System.out.println("AUTH FILTER CHECK");
//		System.out.println("SESSION = "+(session != null ? session.getId() : "NULL"));
//		if (session != null) {
//			System.out.println("Login user = "+ session.getAttribute("loginUser"));
//		}
//		//여기 까지 로그 확인한거임..
//		
//		//만약 세션이 없거나 세션은 있는데 loginUser 정보가 없다면..
//		if (session == null || session.getAttribute("loginUser") == null) {
//			//로그인 하지 않은 사용자를 로그인 페이지로 강제 이동시킬거야.
//			resp.sendRedirect(req.getContextPath()+"/login");
//			
//			//바로 종료 => 서블릿이나 jsp로 넘어가지 않음
//			return;
//		}
//		//로그인 상태면 통과!
//		chain.doFilter(request, response);
//		//그리고 다음 필터나 최종 서블릿으로 요청 넘김!
//		
//	}
//}

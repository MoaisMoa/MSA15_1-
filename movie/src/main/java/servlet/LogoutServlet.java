package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response
			) throws ServletException, IOException {
		String root = request.getContextPath();
		HttpSession session = request.getSession();
		
		//모든 쿠키 제거
		Cookie usernameCookie = new Cookie("username","");
		Cookie tokenCookie = new Cookie("token","");
		Cookie[] deleteCookies = {usernameCookie,tokenCookie};
		for(int i=0; i<deleteCookies.length; i++) {
			Cookie cookie = deleteCookies[i];
			cookie.setPath("/");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		session.invalidate();
		response.sendRedirect(root+"/"); //로그아웃 후 메인화면으로 이동
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response
			) throws ServletException, IOException {
		
	}
}
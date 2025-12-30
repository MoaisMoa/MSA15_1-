package movie.Servlet.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import movie.Service.PersistenceLoginsService;
import movie.Service.PersistenceLoginsServiceImpl;

import java.io.IOException;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// url : /users/idCheck
		String root = request.getContextPath();
		HttpSession session = request.getSession(false);
		
		Cookie tokenCookie = new Cookie("token","");
		tokenCookie.setPath("/");
		tokenCookie.setMaxAge(0);
		
		response.addCookie(tokenCookie);
		
		if(session != null) {
			String username = (String) session.getAttribute("username");
			if(username != null) {
				PersistenceLoginsService persistenceLoginsService = new PersistenceLoginsServiceImpl();
				persistenceLoginsService.delete(username);
			}
			session.invalidate();
		}
		response.sendRedirect(root + "/");
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
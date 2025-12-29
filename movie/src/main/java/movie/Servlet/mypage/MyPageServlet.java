package movie.Servlet.mypage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import movie.DAO.UserDAO;
import movie.DTO.Users;
import movie.Service.UserService;
import movie.Service.UserServiceImpl;

import java.io.IOException;

@WebServlet("/mypage/info")
public class MyPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	private UserDAO userDAO = new UserDAO();
	private UserService userService = new UserServiceImpl(userDAO);
	
	
	protected void doGet(
			HttpServletRequest request, 
			HttpServletResponse response
			)throws ServletException, IOException {
		String path = request.getPathInfo();
		String page = "";
		System.out.println(path);
		System.out.println("/mypage/info");
		
		HttpSession session = request.getSession(false);

		if (session == null || session.getAttribute("loginUser") == null) {
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}

		String username = (String) session.getAttribute("loginUser");

		Users user = userService.selectByUsername(username);

		request.setAttribute("user", user);

		request.getRequestDispatcher("/mypage/info.jsp")
			   .forward(request, response);
		


	}

}

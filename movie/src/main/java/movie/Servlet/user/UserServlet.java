package movie.Servlet.user;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import movie.DAO.UserDAO;
import movie.Service.UserService;
import movie.Service.UserServiceImpl;



@WebServlet("/users/*")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO = new UserDAO();
	private UserService userService = new UserServiceImpl(userDAO);

	protected void doGet(HttpServletRequest request, HttpServletResponse response
			) throws ServletException, IOException {
		String root = request.getContextPath();
		String path = request.getPathInfo(); //ID Check
		
		//IDCheck 아이디 중복 확인
		if(path.equals("/idCheck")) {
			System.out.println("아이디 중복 확인");
			String username = request.getParameter("username");
			boolean check = userService.idCheck(username);
			response.getWriter().print(check);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response
			) throws ServletException, IOException {
		String root = request.getContextPath(); //Board
		String path = request.getPathInfo();	//Join
	}

}

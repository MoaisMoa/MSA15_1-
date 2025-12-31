package movie.Servlet.admin;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import movie.DAO.UserDAO;
import movie.DTO.Users;
import movie.Service.UserService;
import movie.Service.UserServiceImpl;

@WebServlet("/admin/review/*")
public class UsersLiviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UserDAO userDAO = new UserDAO();
	private UserService userService = new UserServiceImpl(userDAO);
	
	/**
	 * [get]
	 */
	protected void doGet(
			HttpServletRequest request, 
			HttpServletResponse response
			) throws ServletException, IOException {
		String path = request.getPathInfo();
		String page = "";
		System.out.println(path);
		System.out.println("/admin/users");
		// 유저 목록
		if( path.equals("/list")) {
			List<Users> usersList = userService.list();
			request.setAttribute("usersList", usersList);
			page = "/page/admin/users/list.jsp";
			
		 
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(page);
		dispatcher.forward(request,  response);
	}
	
	
	/**
	 * 
	 * [post]
	 * 
	 */
	protected void doPost(
			HttpServletRequest request, 
			HttpServletResponse response) 
			throws ServletException, IOException {
		
	
	}

}
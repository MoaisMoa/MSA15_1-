package board.servlet.admin;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import board.DTO.Movie;
import board.DTO.Users;
import board.Service.MovieService;
import board.Service.MoviesServiceImpl;
import board.Service.UsersService;
import board.Service.UsersServiceImpl;

@WebServlet("/admin/users/*")
public class UsersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UsersService usersService = new UsersServiceImpl();
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
			List<Users> moviesList = usersService.list();
			request.setAttribute("userssList", moviesList);
			page = "/page/admin/users/list.jsp";
		}
		// 영화 등록
		if( path.equals("/create")  ) {
			
			page = "/page/admin/movie/create.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(page);
		dispatcher.forward(request,  response);
	}

	protected void doPost(
			HttpServletRequest request, 
			HttpServletResponse response) 
			throws ServletException, IOException {
		
		String root = request.getContextPath();			
		String path = request.getPathInfo();
		

	}

}

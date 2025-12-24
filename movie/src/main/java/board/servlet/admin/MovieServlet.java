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
import board.Service.MovieService;
import board.Service.MoviesServiceImpl;

@WebServlet("/admin/movie/*")
public class MovieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MovieService moviesService = new MoviesServiceImpl();
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
		System.out.println("/admin/movie");
		// 영화 목록
		if( path.equals("/list")) {
			List<Movie> moviesList = moviesService.list();
			request.setAttribute("moviesList", moviesList);
			page = "/page/admin/movie/list.jsp";
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

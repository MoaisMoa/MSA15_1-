package movie.Servlet.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import movie.DAO.MovieDAO;
import movie.DAO.UserDAO;
import movie.DTO.Movie;
import movie.DTO.Users;
import movie.Service.MovieService;
import movie.Service.MovieServiceImpl;

import java.io.IOException;

@WebServlet("/admin/movie/info")
public class MovieServletInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(
			HttpServletRequest request, 
			HttpServletResponse response
			) throws ServletException, IOException {

		
        String movieIdStr = request.getParameter("movie_id");
        if(movieIdStr == null) {
            response.sendRedirect(request.getContextPath() + "/admin/movie/list");
            return;
        }

        int movieId = Integer.parseInt(movieIdStr);

        MovieService movieService = new MovieServiceImpl(new MovieDAO());
        Movie movie= movieService.select((long)movieId);

        request.setAttribute("movie", movie);
        request.getRequestDispatcher("/page/admin/movie/info.jsp").forward(request, response);
    }
    
}
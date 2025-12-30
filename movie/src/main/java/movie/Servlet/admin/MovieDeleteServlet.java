package movie.Servlet.admin;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import movie.DAO.MovieDAO;
import movie.Service.MovieService;
import movie.Service.MovieServiceImpl;

@WebServlet("/admin/movie/delete")
public class MovieDeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private MovieService movieService = new MovieServiceImpl(new MovieDAO());

    @Override
    protected void doPost(
    		HttpServletRequest request, 
    		HttpServletResponse response)
            throws ServletException, IOException {

        String movieIdStr = request.getParameter("movie_id");
        if (movieIdStr == null || movieIdStr.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/admin/movie/list");
            return;
        }

        try {
            long movieId = Long.parseLong(movieIdStr);
            boolean deleted = movieService.delete(movieId);

            if (deleted) {
                response.sendRedirect(request.getContextPath() + "/admin/movie/list?msg=deleted");
            } else {
                response.sendRedirect(request.getContextPath() + "/admin/movie/list?msg=fail");
            }

        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/movie/list?msg=error");
        }
    }
}

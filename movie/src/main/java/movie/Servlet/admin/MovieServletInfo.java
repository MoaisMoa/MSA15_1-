package movie.Servlet.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import movie.DAO.MovieDAO;
import movie.DAO.MovieGenreDAO;
import movie.DTO.Movie;
import movie.DTO.MovieGenre;
import movie.Service.MovieService;
import movie.Service.MovieServiceImpl;
import movie.Service.MovieGenreService;
import movie.Service.MovieGenreServiceImpl;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@WebServlet("/admin/movie/info")
public class MovieServletInfo extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private MovieService movieService = new MovieServiceImpl(new MovieDAO());
    private MovieGenreService movieGenreService = new MovieGenreServiceImpl(new MovieGenreDAO());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String movieIdStr = request.getParameter("movie_id");
        if (movieIdStr == null) {
            response.sendRedirect(request.getContextPath() + "/admin/movie/list");
            return;
        }

        int movieId = Integer.parseInt(movieIdStr);

        // 영화 기본 정보
        Movie movie = movieService.select((long) movieId);

        // 장르 조회
        Map<String, Object> map = new HashMap<>();
        map.put("movie_id", movieId);

        List<MovieGenre> movieGenreList = movieGenreService.listBy(map);

        // MovieGenre → List<String>
        List<String> genres = movieGenreList.stream()
                .map(MovieGenre::getGenre)
                .collect(Collectors.toList());

        // Movie에 장르 주입
        movie.setGenres(genres);

        // JSP로 전달
        request.setAttribute("movie", movie);
        request.getRequestDispatcher("/page/admin/movie/info.jsp")
               .forward(request, response);
    }
}

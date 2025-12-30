package movie.Servlet.admin;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

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

@WebServlet("/admin/movie/update")
public class MovieUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private MovieDAO movieDAO = new MovieDAO();
    private MovieGenreDAO movieGenreDAO = new MovieGenreDAO();
    private MovieService movieService = new MovieServiceImpl(movieDAO);

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // 폼 데이터 가져오기
        int movieId = Integer.parseInt(request.getParameter("movie_id"));
        String title = request.getParameter("title");
        String subTitle = request.getParameter("sub_title");
        String director = request.getParameter("director");
        String actor = request.getParameter("actor");
        String country = request.getParameter("country");
        String description = request.getParameter("description");
        String imgPath = request.getParameter("img_path");
        String releaseDateStr = request.getParameter("release_date");
        String playTimeStr = request.getParameter("play_time");
        String[] genres = request.getParameterValues("genre");

        int playTime = 0;
        if (playTimeStr != null && !playTimeStr.isEmpty()) {
            playTime = Integer.parseInt(playTimeStr);
        }

        java.sql.Date releaseDate = null;
        if (releaseDateStr != null && !releaseDateStr.isEmpty()) {
            releaseDate = java.sql.Date.valueOf(releaseDateStr);
        }

        // Movie 객체 생성
        Movie movie = Movie.builder()
                .movieId(movieId)
                .title(title)
                .subTitle(subTitle)
                .director(director)
                .actor(actor)
                .country(country)
                .description(description)
                .imgPath(imgPath)
                .playTime(playTime)
                .releaseDate(releaseDate)
                .build();

        try {
            // 영화 정보 전체 업데이트
            movieService.update(movie);

            // 기존 장르 삭제
            Map<String, Object> map = new HashMap<>();
            map.put("movie_id", movieId);
            movieGenreDAO.deleteBy(map);

            // 새로운 장르 저장
            if (genres != null) {
                for (String g : genres) {
                    MovieGenre mg = MovieGenre.builder()
                            .movieId(movieId)
                            .genre(g)
                            .build();
                    movieGenreDAO.insert(mg);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        // 수정 후 목록으로 이동
        response.sendRedirect(request.getContextPath() + "/admin/movie/list");
    }
}

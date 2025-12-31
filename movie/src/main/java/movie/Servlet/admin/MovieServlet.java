package movie.Servlet.admin;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import movie.DAO.MovieDAO;
import movie.DAO.MovieGenreDAO;
import movie.DTO.Movie;
import movie.DTO.MovieGenre;
import movie.Service.MovieService;
import movie.Service.MovieServiceImpl;

@WebServlet("/admin/movie/*")
@MultipartConfig(
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 10
)
public class MovieServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private MovieDAO movieDAO = new MovieDAO();
    private MovieGenreDAO movieGenreDAO = new MovieGenreDAO();
    private MovieService movieService = new MovieServiceImpl(movieDAO);

    /**
     * [GET]
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getPathInfo();
        String page = "null";

        if (path != null && (path.equals("/list") || path.equals("/list/"))) {
            List<Movie> movieList = movieService.list();
            request.setAttribute("movieList", movieList);
            page = "/page/admin/movie/list.jsp";
        }

        if (path != null && path.equals("/create")) {
            page = "/page/admin/movie/create.jsp";
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher(page);
        dispatcher.forward(request, response);
    }

    /**
     * [POST]
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String path = request.getPathInfo();

        if ("/create".equals(path)) {
            request.setCharacterEncoding("UTF-8");

            String title = request.getParameter("title");
            String subTitle = request.getParameter("sub_title");
            String director = request.getParameter("director");
            String actor = request.getParameter("actor");
            String country = request.getParameter("country");
            String description = request.getParameter("description");
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

            // 이미지 업로드 처리
            Part posterPart = request.getPart("poster");
            String detailImgPath = null;

            if (posterPart != null && posterPart.getSize() > 0) {
                String fileName = Paths.get(posterPart.getSubmittedFileName())
                        .getFileName()
                        .toString();
                String ext = fileName.substring(fileName.lastIndexOf("."));
                String saveFileName = UUID.randomUUID() + ext;

                String uploadDir = getServletContext().getRealPath("/static/img/movie");
                File dir = new File(uploadDir);
                if (!dir.exists()) dir.mkdirs();

                posterPart.write(uploadDir + File.separator + saveFileName);
                detailImgPath = "/static/img/movie/" + saveFileName;

                System.out.println("업로드 경로 = " + uploadDir);
            }

            // Movie 객체 생성
            Movie movie = Movie.builder()
                    .title(title)
                    .subTitle(subTitle)
                    .director(director)
                    .actor(actor)
                    .country(country)
                    .description(description)
                    .detailImgPath(detailImgPath) // ✅ detailImgPath 사용
                    .playTime(playTime)
                    .releaseDate(releaseDate)
                    .build();

            try {
                movie = movieService.insertKey(movie);
                int movieId = movie.getMovieId(); // AUTO_INCREMENT 된 movie_id 가져오기
                System.out.println("movieId=" + movieId);

                // 장르 저장
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

            response.sendRedirect(request.getContextPath() + "/admin/movie/list");
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }
}

package movie.Servlet.admin;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

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

@WebServlet("/admin/movie/update")
@MultipartConfig(
    maxFileSize = 1024 * 1024 * 10,      // 10MB
    maxRequestSize = 1024 * 1024 * 10
)
public class MovieUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private MovieDAO movieDAO = new MovieDAO();
    private MovieGenreDAO movieGenreDAO = new MovieGenreDAO();
    private MovieService movieService = new MovieServiceImpl(movieDAO);

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        int movieId = Integer.parseInt(request.getParameter("movie_id"));
        String title = request.getParameter("title");
        String subTitle = request.getParameter("sub_title");
        String director = request.getParameter("director");
        String actor = request.getParameter("actor");
        String country = request.getParameter("country");
        String description = request.getParameter("description");
        String oldImgPath = request.getParameter("old_img_path");
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

        /* =========================
           이미지 업로드 처리
        ========================= */
        Part posterPart = request.getPart("poster");

        // 기본은 기존 이미지
        String imgPath = oldImgPath;

        if (posterPart != null && posterPart.getSize() > 0) {

            String fileName = Paths.get(posterPart.getSubmittedFileName())
                                   .getFileName()
                                   .toString();

            String ext = fileName.substring(fileName.lastIndexOf("."));
            String saveFileName = UUID.randomUUID() + ext;

            String uploadDir = getServletContext()
                    .getRealPath("/static/img/movie");

            File dir = new File(uploadDir);
            if (!dir.exists()) dir.mkdirs();

            posterPart.write(uploadDir + File.separator + saveFileName);

            imgPath = "/static/img/movie/" + saveFileName;

            // 기존 이미지 파일 삭제 (선택)
            if (oldImgPath != null && !oldImgPath.isEmpty()) {
                File oldFile = new File(
                        getServletContext().getRealPath(oldImgPath)
                );
                if (oldFile.exists()) oldFile.delete();
            }
        }

        /* =========================
           Movie 업데이트
        ========================= */
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
            movieService.update(movie);

            // 장르 초기화
            Map<String, Object> map = new HashMap<>();
            map.put("movie_id", movieId);
            movieGenreDAO.deleteBy(map);

            // 장르 재등록
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
    }
}

package movie.Servlet.movie;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import movie.DAO.MovieDAO;
import movie.DAO.MovieGenreDAO;
import movie.DAO.ReviewDAO;
import movie.DAO.UserDAO;
import movie.DTO.Movie;
import movie.DTO.MovieGenre;
import movie.DTO.Review;
import movie.DTO.Users;
import movie.Service.MovieGenreService;
import movie.Service.MovieGenreServiceImpl;
import movie.Service.MovieService;
import movie.Service.MovieServiceImpl;
import movie.Service.UserService;
import movie.Service.UserServiceImpl;
import movie.Service.ReviewService;
import movie.Service.ReviewServiceImpl;

/**
 * 리뷰 페이지를 연결하는 서블릿
 */
@WebServlet({ "/review" })
public class ReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MovieDAO movieDAO = new MovieDAO();
	private MovieService movieService = new MovieServiceImpl(movieDAO);

	private ReviewDAO reviewDAO = new ReviewDAO();
	private ReviewService reviewService = new ReviewServiceImpl(reviewDAO);

	private MovieGenreDAO movieGenreDAO = new MovieGenreDAO();
	private MovieGenreService movieGenreService = new MovieGenreServiceImpl(movieGenreDAO);

	private UserDAO userDAO = new UserDAO();
	private UserService userService = new UserServiceImpl(userDAO);

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// 파라미터
			Integer movieId = Integer.parseInt(request.getParameter("id"));
			System.out.println("movieId : " + movieId);

			// 영화 정보 조회
			Map<String, Object> movieMap = new HashMap<>();
			movieMap.put("movie_id", movieId);
			Movie movie = movieService.selectBy(movieMap);
			System.out.println("##### 영화정보 #####");
			System.out.println(movie);

			// 해당 영화의 리뷰 목록 조회
			Map<String, Object> reviewMap = new HashMap<>();
			reviewMap.put("movie_id", movieId);
			List<Review> reviewList = reviewService.listBy(reviewMap);

			// 각 리뷰에 사용자 이름 추가 및 평균 평점 계산
			double sum = 0;
			for (Review review : reviewList) {
				// 사용자 이름 설정
				Map<String, Object> userMap = new HashMap<>();
				userMap.put("no", review.getUserId());
				Users user = userService.selectBy(userMap);
				if (user != null) {
					review.setUsername(user.getUsername());
				}

				// 평점 합계 계산
				sum += review.getRating();
			}

			// 평균 평점 설정
			if (!reviewList.isEmpty()) {
				double averageRating = sum / reviewList.size();
				movie.setAverageRating(averageRating);
			} else {
				movie.setAverageRating(0.0);
			}

			System.out.println("##### 리뷰목록 #####");
			System.out.println(reviewList);

			// 해당 영화의 장르 목록 조회
			Map<String, Object> genreMap = new HashMap<>();
			genreMap.put("movie_id", movieId);
			List<MovieGenre> genreList = movieGenreService.listBy(genreMap);
			System.out.println("##### 장르목록 #####");
			System.out.println(genreList);

			// 요청 객체에 등록
			request.setAttribute("movie", movie);
			request.setAttribute("reviewList", reviewList);
			request.setAttribute("genreList", genreList);

			// review.jsp 페이지로 포워딩
			String page = "/page/review/review.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(page);
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			// 에러 시 메인 페이지로 리다이렉트
			response.sendRedirect(request.getContextPath() + "/");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}

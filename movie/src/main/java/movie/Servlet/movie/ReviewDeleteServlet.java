package movie.Servlet.movie;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import movie.DAO.ReviewDAO;
import movie.DTO.Review;
import movie.Service.ReviewService;
import movie.Service.ReviewServiceImpl;

/**
 * 리뷰 삭제 서블릿
 */
@WebServlet({ "/review/delete" })
public class ReviewDeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ReviewDAO reviewDAO = new ReviewDAO();
    private ReviewService reviewService = new ReviewServiceImpl(reviewDAO);

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // 임시로 사용자 ID를 1로 고정 (로그인 구현 전)
            int userId = 1;

            // 파라미터
            Long reviewId = Long.parseLong(request.getParameter("reviewId"));
            Long movieId = Long.parseLong(request.getParameter("movieId"));

            System.out.println("##### 리뷰 삭제 #####");
            System.out.println("reviewId : " + reviewId);
            System.out.println("movieId : " + movieId);
            System.out.println("userId : " + userId);

            // 기존 리뷰 조회
            Map<String, Object> reviewMap = new HashMap<>();
            reviewMap.put("review_id", reviewId);
            Review review = reviewService.selectBy(reviewMap);

            if (review == null) {
                System.out.println("리뷰를 찾을 수 없습니다.");
                response.sendRedirect(request.getContextPath() + "/review?id=" + movieId);
                return;
            }

            // 작성자 확인
            if (review.getUserId() != userId) {
                System.out.println("본인이 작성한 리뷰만 삭제할 수 있습니다.");
                response.sendRedirect(request.getContextPath() + "/review?id=" + movieId);
                return;
            }

            // 리뷰 삭제
            boolean result = reviewService.delete(reviewId);
            System.out.println("리뷰 삭제 결과 : " + result);

            // 해당 영화 리뷰 페이지로 리다이렉트
            response.sendRedirect(request.getContextPath() + "/review?id=" + movieId);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}

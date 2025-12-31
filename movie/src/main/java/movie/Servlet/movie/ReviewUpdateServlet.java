package movie.Servlet.movie;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.apache.catalina.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import movie.DAO.ReviewDAO;
import movie.DTO.Review;
import movie.DTO.Users;
import movie.Service.ReviewService;
import movie.Service.ReviewServiceImpl;

/**
 * 리뷰 수정 서블릿
 */
@WebServlet({ "/review/update" })
public class ReviewUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ReviewDAO reviewDAO = new ReviewDAO();
    private ReviewService reviewService = new ReviewServiceImpl(reviewDAO);

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
        	Users loginUser = (Users) request.getSession().getAttribute("loginUser");
            

            // 파라미터
            Integer reviewId = Integer.parseInt(request.getParameter("reviewId"));
            Integer movieId = Integer.parseInt(request.getParameter("movieId"));
            String content = request.getParameter("content");
            String ratingStr = request.getParameter("rating");
            int rating = Integer.parseInt(ratingStr);

            System.out.println("##### 리뷰 수정 #####");
            System.out.println("reviewId : " + reviewId);
            System.out.println("movieId : " + movieId);
            System.out.println("content : " + content);
            System.out.println("rating : " + rating);
            System.out.println("userId : " + loginUser.getNo());

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
            if (review.getUserId() != loginUser.getNo()) {
                System.out.println("본인이 작성한 리뷰만 수정할 수 있습니다.");
                response.sendRedirect(request.getContextPath() + "/review?id=" + movieId);
                return;
            }

            // 리뷰 정보 업데이트
            review.setContent(content);
            review.setRating(rating);

            // 리뷰 수정
            boolean result = reviewService.update(review);
            System.out.println("리뷰 수정 결과 : " + result);

            // 해당 영화 리뷰 페이지로 리다이렉트
            response.sendRedirect(request.getContextPath() + "/review?id=" + movieId);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}

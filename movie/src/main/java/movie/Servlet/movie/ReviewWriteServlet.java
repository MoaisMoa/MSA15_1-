package movie.Servlet.movie;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

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
 * 리뷰 작성 서블릿
 */
@WebServlet({ "/review/write" })
public class ReviewWriteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ReviewDAO reviewDAO = new ReviewDAO();
    private ReviewService reviewService = new ReviewServiceImpl(reviewDAO);

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer movieId = null;
        try {
            // 임시로 사용자 ID를 1로 고정 (로그인 구현 전)
        	Users loginUser = (Users) request.getSession().getAttribute("loginUser");
        	
            // 파라미터
            movieId = Integer.parseInt(request.getParameter("movieId"));
            String content = request.getParameter("content");
            String ratingStr = request.getParameter("rating");
            int rating = Integer.parseInt(ratingStr);

            System.out.println("##### 리뷰 등록 #####");
            System.out.println("movieId : " + movieId);
            System.out.println("userId : " + loginUser.getNo());
            System.out.println("rating : " + rating);
            System.out.println("content : " + content);

            // 기존 리뷰 존재 여부 확인
            Map<String, Object> checkMap = new HashMap<>();
            checkMap.put("movie_id", movieId);
            checkMap.put("user_id", loginUser.getNo());
            Review existingReview = reviewService.selectBy(checkMap);

            if (existingReview != null) {
                // 이미 리뷰가 존재하는 경우
                System.out.println("이미 리뷰가 존재합니다: " + existingReview);
                String errorMsg = "이미 이 영화에 리뷰를 등록하셨습니다.";
                try {
                    errorMsg = URLEncoder.encode(errorMsg, "UTF-8");
                } catch (UnsupportedEncodingException ex) {
                    ex.printStackTrace();
                }
                response.sendRedirect(request.getContextPath() + "/review?id=" + movieId + "&error=" + errorMsg);
                return;
            }

            // 리뷰 객체 생성
            Review review = Review.builder()
                    .movieId(movieId)
                    .userId(loginUser.getNo())
                    .rating(rating)
                    .content(content)
                    .build();

            // 리뷰 저장
            boolean result = reviewService.insert(review);
            System.out.println("리뷰 등록 결과 : " + result);

            // 해당 영화 리뷰 페이지로 리다이렉트
            response.sendRedirect(request.getContextPath() + "/review?id=" + movieId);

        } catch (Exception e) {
            e.printStackTrace();
            // 에러 시 메인 페이지로 리다이렉트
            response.sendRedirect(request.getContextPath() + "/");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}

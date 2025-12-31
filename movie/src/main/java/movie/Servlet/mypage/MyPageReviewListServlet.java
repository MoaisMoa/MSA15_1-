package movie.Servlet.mypage;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import movie.DTO.Review;
import movie.DTO.Users;
import movie.Service.ReviewService;
import movie.Service.ReviewServiceImpl;
import movie.DAO.ReviewDAO;

@WebServlet("/mypage/reviewlist")
public class MyPageReviewListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ReviewDAO reviewDAO = new ReviewDAO();
    private ReviewService reviewService = new ReviewServiceImpl(reviewDAO);

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loginUser") == null) {
            response.sendRedirect(request.getContextPath() + "/page/user/login.jsp");
            return;
        }

        Users user = (Users) session.getAttribute("loginUser");
        int userId = user.getNo(); 

        System.out.println("로그인한 사용자 ID: " + userId);

        // 로그인한 사용자 기준으로 리뷰만 조회
        List<Review> reviewList = reviewService.selectByUserId(userId);
        request.setAttribute("reviewList", reviewList);

        String page = "/page/mypage/reviewlist.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(page);
        dispatcher.forward(request, response);
    }
}

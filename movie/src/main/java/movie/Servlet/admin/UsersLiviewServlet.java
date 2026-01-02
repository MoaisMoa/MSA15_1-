package movie.Servlet.admin;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import movie.DAO.ReviewDAO;
import movie.DTO.Review;
import movie.Service.ReviewService;
import movie.Service.ReviewServiceImpl;

@WebServlet("/admin/review/*")
public class UsersLiviewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ReviewService reviewService = new ReviewServiceImpl(new ReviewDAO());

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      

        String path = request.getPathInfo();
        String page = "";

        // 모든 리뷰 목록
        if (path == null || path.equals("/list")) {
            List<Review> reviewList = reviewService.list();
            request.setAttribute("reviewList", reviewList);
            page = "/page/admin/review/list.jsp";
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher(page);
        dispatcher.forward(request, response);
    }
}

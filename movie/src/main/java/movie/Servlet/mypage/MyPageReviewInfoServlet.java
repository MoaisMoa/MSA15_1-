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
import movie.DAO.MovieDAO;
import movie.DAO.ReviewDAO;
import movie.DAO.UserDAO;
import movie.DTO.Movie;
import movie.DTO.Review;
import movie.DTO.Users;
import movie.Service.MovieService;
import movie.Service.MovieServiceImpl;
import movie.Service.ReviewService;
import movie.Service.ReviewServiceImpl;
import movie.Service.UserService;
import movie.Service.UserServiceImpl;

@WebServlet("/mypage/reviewinfo")
public class MyPageReviewInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UserDAO userDAO = new UserDAO();
	private UserService userService = new UserServiceImpl(userDAO);
	
	private ReviewDAO reivewDAO = new ReviewDAO();
	private ReviewService reviewService = new ReviewServiceImpl(reivewDAO);
	

	
    protected void doGet(
			HttpServletRequest request, 
			HttpServletResponse response
			) throws ServletException, IOException {
    	
    	HttpSession session = request.getSession(false);
    	if(session == null || session.getAttribute("username") == null) {
    		response.sendRedirect(request.getContextPath() + "/page/user/login.jsp");
    			return;
    	}
    	
		String path = request.getPathInfo();
		String page = "";
		System.out.println("/mypage/reviewinfo");

		if(path==null || path.equals("")) {

			 Users user = (Users) session.getAttribute("loginUser");
			 String userId = user.getId();
			 System.out.println(userId);
			 
			 List<Users> usersList = userService.list();
				request.setAttribute("usersList", usersList);	
				
				List<Review> reviewList = reviewService.list();
				request.setAttribute("reviewList", reviewList);
				

			 
			page = "/page/mypage/reviewinfo.jsp";
			
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(page);
		dispatcher.forward(request,  response);
	}
    
}

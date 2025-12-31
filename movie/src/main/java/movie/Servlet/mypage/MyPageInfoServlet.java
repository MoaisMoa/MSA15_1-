package movie.Servlet.mypage;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import movie.DTO.Users;
import movie.DAO.UserDAO;
import movie.Service.UserService;
import movie.Service.UserServiceImpl;

@WebServlet("/mypage/userinfo")
public class MyPageInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UserDAO userDAO = new UserDAO();
	private UserService userService = new UserServiceImpl(userDAO);
	
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
		System.out.println("/mypage/userinfo");

		if(path==null || path.equals("")) {

			 Users user = (Users) session.getAttribute("loginUser");
			 String userId = user.getId();
			 System.out.println(userId);
			 
			 
            
			 
			
			page = "/page/mypage/userinfo.jsp";
			
		 
			request.setAttribute("user", user);
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(page);
		dispatcher.forward(request,  response);
	}
    
}
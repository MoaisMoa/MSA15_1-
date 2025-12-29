package movie.Servlet.user;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import movie.DAO.UserDAO;
import movie.DTO.Users;
import movie.Service.UserService;
import movie.Service.UserServiceImpl;

import java.io.IOException;
import java.util.UUID;

@WebServlet({"/join","/join.jsp"})
public class SignUpServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private UserDAO userDAO = new UserDAO();
    private UserService userService = new UserServiceImpl(userDAO);
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	String url = "/page/user/join.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    		String root     = request.getContextPath();
    		String username = request.getParameter("username");
        	String password = request.getParameter("password");
        	String name     = request.getParameter("name");
        	
        //이메일 조립
        	String email = request.getParameter("mail1") + "@" +
        				   request.getParameter("mail2");
        	
        //전화번호 조립	
			String tel =   request.getParameter("tel1") + "-" +
				   		   request.getParameter("tel2") + "-" +
				   		   request.getParameter("tel3");
			
		//생년월일 조립
			String birth = request.getParameter("birthyy") + "-" +
						   request.getParameter("birthmm") + "-" +
						   request.getParameter("birthdd");
			
			
		//user 객체 생성
	    	Users user = Users.builder()
	    			  		  .id(UUID.randomUUID().toString())
					  		  .username(username) //로그인 아이디
					  		  .password(password) //비밀번호
					  		  .name(name) 		  //실명
					  		  .email(email)		  //이메일
					  		  .birth(birth) 	  //생년월일
					  		  .tel(tel)			  //전화번호
					  		  .build();
			
			int result = userService.signup(user);
	

//			userService.signup(user);
			if(result>0) {
				//성공 => 로그인 페이지로 이동
				response.sendRedirect(root + "/page/user/join-success.jsp");
			} else {
				//실패 => 다시 회원가입 페이지로 이동
				response.sendRedirect(root + "/page/user/join-failed.jsp");
			}
    }
}
    	
    	
    	
//    	String root = request.getContextPath();
//    	String username = request.getParameter("username");
//    	String password = request.getParameter("password");
//    	String name = request.getParameter("name");
//    	String tel = request.getParameter("tel");
//    	String email = request.getParameter("email");
    	
//    	Users user = Users.builder()
//    			  .id(UUID.randomUUID().toString())
//				  .username(username) //로그인 아이디
//				  .password(password) //비밀번호
//				  .name(name) 		  //실명
//				  .tel(tel)			  //전화번호
//				  .email(email)								  //이메일
//				  .build();
    	
//    	int result = userService.signup(user);
//    	
//		if(result>0) {
//			//성공 => 로그인 페이지로 이동
//			response.sendRedirect(root + "/join-success.jsp");
//		} else {
//			//실패 => 다시 회원가입 페이지로 이동
//			response.sendRedirect(root + "/join-failed.jsp");
//		}
//	}
//    	if(result>0) {
//			//성공 => 로그인 페이지로 이동
//			response.sendRedirect(root + "/join-success.jsp");
//		} else {
//			//실패 => 다시 회원가입 페이지로 이동
//			response.sendRedirect(root + "/join-failed.jsp");
//		}
//    	
    	

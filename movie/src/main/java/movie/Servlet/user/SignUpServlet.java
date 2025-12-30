package movie.Servlet.user;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.UUID;

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

@WebServlet({"/join"})
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

    	try {
    		String root     = request.getContextPath();
    		String username = request.getParameter("username");
        	String password = request.getParameter("password");
        	String name     = request.getParameter("name");
        	
        	System.out.println("#### username : "+ username);
        	
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
	    	System.out.println("DEBUG username = " + user.getUsername());
//	    	response.sendRedirect(root + "/page/user/join-success.jsp");
	    	if(result > 0) {
	    		name = URLEncoder.encode(name, "UTF-8");
	    		response.sendRedirect(request.getContextPath() + "/page/user/join-success.jsp?name=" + name);
	    	} else {
	    		response.sendRedirect(root + "/join.jsp?error=true");
	    	}
	    	
		} catch (Exception e) {
			//이 친구는 모든 오류 다 받아
			//실패 => 다시 회원가입 페이지로 이동
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() +  "/page/user/join-failed.jsp");
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
//				  .email(email)		  //이메일
//				  .build();
    	
//    	int result = userService.signup(user);
//    	
//    	if(result>0) {
//			//성공 => 로그인 페이지로 이동
//			response.sendRedirect(root + "/join-success.jsp");
//		} else {
//			//실패 => 다시 회원가입 페이지로 이동
//			response.sendRedirect(root + "/join-failed.jsp");
//		}
//    	
    	

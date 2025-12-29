package movie.Servlet.user;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import movie.DAO.UserDAO;
import movie.DTO.Users;
import movie.Service.UserService;
import movie.Service.UserServiceImpl;



@WebServlet({"/login", "/login.jsp"})
public class LoginServlet extends HttpServlet {
	
	private UserDAO userDAO = new UserDAO();
	private UserService userService = new UserServiceImpl(userDAO);
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response
			) throws ServletException, IOException {
		String page = "";
		//ID저장 쿠키 확인
		String rememberId = "";
		String username = "";
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie cookie : cookies) {
				String cookieName = cookie.getName();
				String cookieValue = URLDecoder.decode(cookie.getValue(),"UTF-8");
				switch(cookieName) {
				case "username" : username = cookieValue; break;
				case "rememberId" : rememberId = cookieValue; break;
				}
			}
		}
		request.setAttribute("username", username);
		request.setAttribute("rememberId", rememberId);
		
//		 임시 로그인 테스트
//		 HttpSession session = request.getSession();
//		 session.setAttribute("username", "Moa");
		
		page="/page/user/login.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(page);
		dispatcher.forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response
			) throws ServletException, IOException {
		String root = request.getContextPath();
		String path = request.getPathInfo();
		
		//로그인
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		//ID 저장
		String rememberId = request.getParameter("rememberId");
		Cookie cookieRememberId = new Cookie("rememberId","");
		Cookie cookieUsername = new Cookie("username","");
		cookieRememberId.setPath("/");
		cookieUsername.setPath("/");
		System.out.println("rememberId : "+rememberId);
		
		//아이디 저장 체크 시 on
		if(rememberId != null && rememberId.equals("on")) {
			//쿠키 생성
			cookieRememberId.setValue(URLEncoder.encode(rememberId,"UTF-8"));
			cookieUsername.setValue(URLEncoder.encode(username,"UTF-8"));
			
			//쿠키 만료시간 설정 - 7일
			cookieRememberId.setMaxAge(60*60*24*7);
			cookieUsername.setMaxAge(60*60*24*7);
		}
		//아이디 저장 체크 해제 시
		else {
			//쿠키 삭제
			cookieRememberId.setMaxAge(0);
			cookieUsername.setMaxAge(0);
		}
		//응답에 쿠키 등록
		response.addCookie(cookieRememberId);
		response.addCookie(cookieUsername);
	
	Users user = Users.builder()
					  .username(username)
					  .password(password)
					  .build();
	boolean result = userService.login(user);
	
	//로그인 실패
	if(!result) {
		response.sendRedirect(root+"/login_failed.jsp?error=true");
		return;
	}
	
	//로그인 성공
	//회원 조회
	Users loginUser = userService.selectByUsername(username);
	loginUser.setPassword(null);
	
	//session에 사용자 정보 등록
	HttpSession session = request.getSession();
	session.setAttribute("loginId",user.getUsername());
	session.setAttribute("loginUser",loginUser);
	response.sendRedirect(root+"/");
	}
}
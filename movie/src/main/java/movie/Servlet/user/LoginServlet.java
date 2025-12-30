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
		String saveId = "";
		String username = "";
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie cookie : cookies) {
				String name = cookie.getName();
				String value = URLDecoder.decode(cookie.getValue(),"UTF-8");
				if("username".equals(name)) {
					username = value;
				}
				if("saveId".equals(name)) {
					saveId = value;
				}
			}
		}
		request.setAttribute("username", username);
		request.setAttribute("saveId", saveId);
	
		RequestDispatcher dispatcher = request.getRequestDispatcher("/page/user/login.jsp");
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
		String saveId = request.getParameter("saveId");
		Cookie cookieSaveId = new Cookie("saveId","");
		Cookie cookieUsername = new Cookie("username","");
		cookieSaveId.setPath("/");
		cookieUsername.setPath("/");
		System.out.println("saveId : " + saveId);
		
		//아이디 저장 체크 시 on
		if(saveId != null && saveId.equals("on")) {
			//쿠키 생성
			cookieSaveId.setValue(URLEncoder.encode(saveId,"UTF-8"));
			cookieUsername.setValue(URLEncoder.encode(username,"UTF-8"));
			
			//쿠키 만료시간 설정 - 7일
			cookieSaveId.setMaxAge(60*60*24*7);
			cookieUsername.setMaxAge(60*60*24*7);
		}
		//아이디 저장 체크 해제 시
		else {
			//쿠키 삭제
			cookieSaveId.setMaxAge(0);
			cookieUsername.setMaxAge(0);
		}
		//응답에 쿠키 등록
		response.addCookie(cookieSaveId);
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
	Users loginUser = userService.loginAndGetUser(username,password);
	
	
	//로그인 실패2
	if(loginUser == null) {
		request.getRequestDispatcher("/page/user/login_failed.jsp").forward(request, response);
	}
	//비밀번호 노출 방지 때문에 null 한거임!
	loginUser.setPassword(null);
	
	//session에 사용자 정보 등록
	HttpSession session = request.getSession(); //session 요청
	//loginId는 세션에 저장한 로그인 사용자 식별자 이름(Key) DB랑 상관X
	session.setAttribute("loginId",loginUser.getUsername());
	session.setAttribute("loginUser",loginUser);
	
	//로그 확인..
	System.out.println("LOGIN SUCCESS");
	System.out.println("SESSION ID = " + session.getId());
	System.out.println("LOGIN USER = " + loginUser.getUsername());
	response.sendRedirect(root+"/");
	}
	
	
}
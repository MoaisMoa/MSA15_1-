package board.servlet.admin;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import board.DTO.Movie;
import board.DTO.Users;
import board.Service.MovieService;
import board.Service.MoviesServiceImpl;
import board.Service.UsersService;
import board.Service.UsersServiceImpl;

@WebServlet("/admin/users/*")
public class UsersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UsersService usersService = new UsersServiceImpl();
	/**
	 * [get]
	 */
	protected void doGet(
			HttpServletRequest request, 
			HttpServletResponse response
			) throws ServletException, IOException {
		String path = request.getPathInfo();
		String page = "";
		System.out.println(path);
		System.out.println("/admin/users");
		// 유저 목록
		if( path.equals("/list")) {
			List<Users> usersList = usersService.list();
			request.setAttribute("usersList", usersList);
			page = "/page/admin/users/list.jsp";
		}
	RequestDispatcher dispatcher = request.getRequestDispatcher(page);
	dispatcher.forward(request,  response);
	}
	
	
	/**
	 * 
	 * [post]
	 * 
	 */
	
	protected void doPost(
			HttpServletRequest request, 
			HttpServletResponse response) 
			throws ServletException, IOException {
		
		   String path = request.getPathInfo();

		    if ("/upload".equals(path)) {
		        request.setCharacterEncoding("UTF-8");

		        // 폼 데이터 가져오기
		        String title = request.getParameter("title");
		        String subTitle = request.getParameter("sub_title");
		        String director = request.getParameter("director");
		        String actor = request.getParameter("actor");
		        String country = request.getParameter("country");
		        String description = request.getParameter("description");
		        String imgPath = request.getParameter("img_path");

		        // DTO 생성
		        Movie movie = Movie.builder()
		                .title(title)
		                .sub_title(subTitle)
		                .director(director)
		                .actor(actor)
		                .country(country)
		                .description(description)
		                .img_path(imgPath)
		                .build();

		        // Service 호출
		        protected void doPost(
		    			HttpServletRequest request, 
		    			HttpServletResponse response) 
		    			throws ServletException, IOException {
		    		
		    		   String path = request.getPathInfo();

		    		    if ("/upload".equals(path)) {
		    		        request.setCharacterEncoding("UTF-8");

		    		        // 폼 데이터 가져오기
		    		        String title = request.getParameter("title");
		    		        String subTitle = request.getParameter("sub_title");
		    		        String director = request.getParameter("director");
		    		        String actor = request.getParameter("actor");
		    		        String country = request.getParameter("country");
		    		        String description = request.getParameter("description");
		    		        String imgPath = request.getParameter("img_path");

		    		        // DTO 생성
		    		        Movie movie = Movie.builder()
		    		                .title(title)
		    		                .sub_title(subTitle)
		    		                .director(director)
		    		                .actor(actor)
		    		                .country(country)
		    		                .description(description)
		    		                .img_path(imgPath)
		    		                .build();

		    		        // Service 호출
		    		        MovieService movieService = new MoviesServiceImpl();
		    		        try {
		    		            movieService.insert(movie);  // insert 메서드 필요
		    		        } catch(Exception e) {
		    		            e.printStackTrace();
		    		        }

		    		        // 목록 페이지로 이동
		    		        response.sendRedirect(request.getContextPath() + "/admin/movie/list");

		    	}

	}

}

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
import board.Service.MovieService;
import board.Service.MoviesServiceImpl;

@WebServlet("/admin/movie/*")
public class MovieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MovieService moviesService = new MoviesServiceImpl();
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
		System.out.println("/admin/movie");
		// 영화 목록
		if( path.equals("/list")) {
			List<Movie> movieList = moviesService.list();
			request.setAttribute("movieList", movieList);
			page = "/page/admin/movie/list.jsp";
		}
		// 영화 등록
		if( path.equals("/create")  ) {
			
			page = "/page/admin/movie/create.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(page);
		dispatcher.forward(request,  response);
	}

	
	/**
	 * 
	 * [do post]
	 */
	protected void doPost(
			HttpServletRequest request, 
			HttpServletResponse response) 
			throws ServletException, IOException {
		
		String path = request.getPathInfo();

	    if("/create".equals(path)) {

	        request.setCharacterEncoding("UTF-8");


	        String title = request.getParameter("title");
	        String subTitle = request.getParameter("sub_title");
	        String director = request.getParameter("director");
	        String actor = request.getParameter("actor");
	        String country = request.getParameter("country");
	        String description = request.getParameter("description");
	        String imgPath = request.getParameter("img_path");
	        String releaseDateStr = request.getParameter("release_date");
	        String playTimeStr = request.getParameter("play_time");
	        
	        int playTime = 0;
	        if(playTimeStr != null && !playTimeStr.isEmpty()) {
	            playTime = Integer.parseInt(playTimeStr);
	        }

	        java.sql.Date releaseDate = null;
	        if(releaseDateStr != null && !releaseDateStr.isEmpty()) {
	            releaseDate = java.sql.Date.valueOf(releaseDateStr);
	        }


	        Movie movie = Movie.builder()
	                .title(title)
	                .sub_title(subTitle)
	                .director(director)
	                .actor(actor)
	                .country(country)
	                .description(description)
	                .img_path(imgPath)
	                .play_time(playTime)
	                .release_date(releaseDate)
	                .build();


	        try {
	            moviesService.insert(movie);
	        } catch(Exception e) {
	            e.printStackTrace();
	        }


	        response.sendRedirect(request.getContextPath() + "/admin/movie/list");
	    } else {

	        response.sendError(HttpServletResponse.SC_NOT_FOUND);
	    }
	}
		

	

}

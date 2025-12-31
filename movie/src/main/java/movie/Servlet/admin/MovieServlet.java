package movie.Servlet.admin;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.util.List;
import java.util.UUID;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import movie.DAO.MovieDAO;
import movie.DAO.MovieGenreDAO;
import movie.DTO.Movie;
import movie.DTO.MovieGenre;
import movie.Service.MovieService;
import movie.Service.MovieServiceImpl;
import java.nio.file.Paths;

@WebServlet("/admin/movie/*")
@MultipartConfig(
	    maxFileSize = 1024 * 1024 * 10,      // 10MB
	    maxRequestSize = 1024 * 1024 * 10
	)
public class MovieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MovieDAO movieDAO = new MovieDAO();
	private MovieGenreDAO movieGenreDAO = new MovieGenreDAO();
	private MovieService movieService = new MovieServiceImpl(movieDAO);
	/**
	 * [get]
	 */
	protected void doGet(
			HttpServletRequest request, 
			HttpServletResponse response
			) throws ServletException, IOException {
		String path = request.getPathInfo();
		String page = "null";
		System.out.println(path);
		System.out.println("/admin/movie");
		
		if( path!= null && (path.equals("/list") || path.equals("/list/"))) {
			List<Movie> movieList = movieService.list();
			request.setAttribute("movieList", movieList);
			page = "/page/admin/movie/list.jsp";
		}
		
		if( path != null && path.equals("/create") ) {
			
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
	        String releaseDateStr = request.getParameter("release_date");
	        String playTimeStr = request.getParameter("play_time");
	        
	        
	        String[] genres = request.getParameterValues("genre");
	        
	        int playTime = 0;
	        if(playTimeStr != null && !playTimeStr.isEmpty()) {
	            playTime = Integer.parseInt(playTimeStr);
	        }

	        java.sql.Date releaseDate = null;
	        if(releaseDateStr != null && !releaseDateStr.isEmpty()) {
	            releaseDate = java.sql.Date.valueOf(releaseDateStr);
	        }
	        

	        Part posterPart = request.getPart("poster");

	        String imgPath = null;

	        if (posterPart != null && posterPart.getSize() > 0) {
	            String fileName = Paths.get(posterPart.getSubmittedFileName())
	                                   .getFileName()
	                                   .toString();

	            String ext = fileName.substring(fileName.lastIndexOf("."));
	            String saveFileName = UUID.randomUUID() + ext;

	            String uploadDir = getServletContext()
	                    .getRealPath("/static/img/movie");

	            File dir = new File(uploadDir);
	            if (!dir.exists()) dir.mkdirs();

	            posterPart.write(uploadDir + File.separator + saveFileName);

	            imgPath = "/static/img/movie/" + saveFileName;
	            
	            System.out.println("업로드 경로 = " + uploadDir);
	        
	        }

	        Movie movie = Movie.builder()
	                .title(title)
	                .subTitle(subTitle)
	                .director(director)
	                .actor(actor)
	                .country(country)
	                .description(description)
	                .imgPath(imgPath)
	                .playTime(playTime)
	                .releaseDate(releaseDate)
	                .build();


	        try {
//	        	movieService.insert(movie);
	            movie = movieService.insertKey(movie);
	            
	            int movieId = movie.getMovieId();		// AUTO_INCREMENT 된 movie_id 가져옴
	            System.out.println("movieId=" + movieId);
	            
	            if(genres != null) {
	            	for (String g : genres) {
	            		MovieGenre moviegenre = MovieGenre.builder()
	            				.movieId(movieId)
	            				.genre(g)
	            				.build();
	            		
	            		movieGenreDAO.insert(moviegenre);
	            	}
	            }
	            
	            
	        } catch(Exception e) {
	            e.printStackTrace();
	        }


	        response.sendRedirect(request.getContextPath() + "/admin/movie/list");
	    } else {

	        response.sendError(HttpServletResponse.SC_NOT_FOUND);
	    }
	}
		

	

}
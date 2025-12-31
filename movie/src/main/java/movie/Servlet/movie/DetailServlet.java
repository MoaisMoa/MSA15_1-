package movie.Servlet.movie;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import movie.DAO.MovieDAO;
import movie.DTO.Movie;
import movie.Service.MovieService;
import movie.Service.MovieServiceImpl;


@WebServlet("/detail")
public class DetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MovieDAO movieDAO = new MovieDAO();
	private MovieService movieService = new MovieServiceImpl(movieDAO);
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Movie movie = null;
			// 검색 키워드
			String keyword = request.getParameter("keyword");
			if( keyword != null && !keyword.isEmpty() ) {
				// 검색 적용
				movie = movieService.searchBy(keyword);
			}
			else {
				// 파라미터
				Integer id = Integer.parseInt( request.getParameter("id") );
				System.out.println("id : " + id);
				// 영화 정보 조회
				Map<String, Object> map = new HashMap<>();
				map.put("movie_id", id);
				// SELECT * FROM movie WHERE movie_id = ?
				movie = movieService.selectBy(map);
			}
			
			System.out.println("##### 영화정보 #####");
			System.out.println(movie);
			// 요청 객체에 등록
			request.setAttribute("movie", movie);
			
			// detail.jsp 페이지로 출력
			String page = "detail.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(page);
			dispatcher.forward(request,  response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
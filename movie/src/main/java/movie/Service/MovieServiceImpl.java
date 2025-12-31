package movie.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.alohaclass.jdbc.dto.Page;
import com.alohaclass.jdbc.dto.PageInfo;

import movie.DAO.MovieDAO;
import movie.DAO.MovieGenreDAO;
import movie.DTO.Movie;
import movie.DTO.MovieGenre;

public class MovieServiceImpl extends BaseServiceImpl<MovieDAO, Movie> implements MovieService {

	public MovieServiceImpl(MovieDAO dao) {
		super(dao);
	}

	@Override
	public Movie insertKey(Movie movie) {
		Movie result = null;
		try {
			result = dao.insertKey(movie);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public Movie selectBy(Map<String, Object> map) {
		Movie result = null;
		try {
			// 영화 정보 조회
			result = dao.selectBy(map);
			
			// 영화 장르 목록 조회
			MovieGenreDAO movieGenreDAO = new MovieGenreDAO();
			List<MovieGenre> movieGenreList = movieGenreDAO.listBy(map);
			List<String> genres = movieGenreList.stream()
						  .map( (genre) -> {
							  return genre.getGenre();
						  }).toList();
			result.setGenres(genres);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public Movie searchBy(String keyword) {
		Movie result = null;
		try {
			// 영화 정보 조회
			// LIKE 검색 키워드
			List<String> columnList = new ArrayList<>();
			columnList.add("title");
			
			PageInfo<Movie> pageInfo = dao.page(new Page(1,1,1,1), keyword, columnList);
			List<Movie> movies = pageInfo.getList();
			
			if( movies == null ||  movies.size() == 0 ) {
				return null;
			}
			result = movies.getFirst();
			System.out.println("########################### 영화 검색");
			System.out.println(result);
			
			// 영화 장르 목록 조회
			MovieGenreDAO movieGenreDAO = new MovieGenreDAO();
			Map<String, Object> map = new HashMap<>();
			map.put("movie_id", result.getMovieId());
			List<MovieGenre> movieGenreList = movieGenreDAO.listBy(map);
			List<String> genres = movieGenreList.stream()
					.map( (genre) -> {
						return genre.getGenre();
					}).toList();
			result.setGenres(genres);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	

}


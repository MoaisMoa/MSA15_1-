
package movie.Service;

import movie.DAO.MovieDAO;
import movie.DTO.Movie;

public class MoviesServiceImpl extends BaseServiceImpl<MovieDAO, Movie> implements MovieService {
	
	public MoviesServiceImpl(MovieDAO dao) {
		super(dao);
	}
	

}

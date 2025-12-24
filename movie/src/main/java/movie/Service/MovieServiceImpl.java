package movie.Service;

import movie.DAO.MovieDAO;
import movie.DTO.Movie;

public class MovieServiceImpl extends BaseServiceImpl<MovieDAO, Movie> implements MovieService {

	public MovieServiceImpl(MovieDAO dao) {
		super(dao);
	}

}

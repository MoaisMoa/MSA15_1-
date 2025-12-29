package movie.Service;

import movie.DAO.MovieGenreDAO;
import movie.DTO.MovieGenre;

public class MovieGenreServiceImpl extends BaseServiceImpl<MovieGenreDAO, MovieGenre> implements MovieGenreService {

    public MovieGenreServiceImpl(MovieGenreDAO dao) {
        super(dao);
    }

}

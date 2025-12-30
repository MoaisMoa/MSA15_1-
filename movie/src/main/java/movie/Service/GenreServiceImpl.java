package movie.Service;

import movie.DAO.GenreDAO;
import movie.DTO.Genre;

public class GenreServiceImpl extends BaseServiceImpl<GenreDAO, Genre> implements GenreService {

	public GenreServiceImpl(GenreDAO dao) {
		super(dao);
	}

}

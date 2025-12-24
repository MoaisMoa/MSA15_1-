
package board.Service;

import java.util.List;

import board.DAO.MovieDAO;
import board.DAO.UsersDAO;
import board.DTO.Movie;
import board.DTO.Users;

public class MoviesServiceImpl implements MovieService {
	
	private MovieDAO moviesDAO = new MovieDAO();

	@Override
	public List<Movie> list() {
		List<Movie> list = null;
		try {
			list = moviesDAO.list();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void insert(Movie movie) {
		try {
			moviesDAO.insert(movie);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	

}

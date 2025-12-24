package board.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mindrot.jbcrypt.BCrypt;

import board.DAO.MovieDAO;
import board.DAO.UsersDAO;
import board.DTO.Movie;
import board.DTO.Users;

public class UsersServiceImpl implements UsersService {
	
	private UsersDAO usersDAO = new UsersDAO();

	@Override
	public List<Users> list() {
		List<Users> list = null;
		try {
			list = usersDAO.list();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;

	}

	public void insert(Movie movie) {
	    try {
	        MovieDAO movieDAO = new MovieDAO();
			movieDAO.insert(movie); // BaseDAOImpl의 insert 사용
	    } catch(Exception e) {
	        e.printStackTrace();
	    }
	}
}


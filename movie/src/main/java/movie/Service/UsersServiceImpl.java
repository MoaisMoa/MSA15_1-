package movie.Service;

import movie.DAO.UsersDAO;
import movie.DTO.Users;


public class UsersServiceImpl extends BaseServiceImpl<UsersDAO, Users> implements UsersService {

	public UsersServiceImpl(UsersDAO dao) {
		super(dao);
	}

	@Override
	public int join(Users user) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean idCheck(String username) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean login(Users user) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Users selectByUsername(String username) {
		// TODO Auto-generated method stub
		return null;
	}
	
}


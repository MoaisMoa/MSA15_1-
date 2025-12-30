package movie.Service;

import movie.DTO.Users;

public interface UserService extends BaseService<Users>{

	public int signup(Users user);
	public boolean idCheck(String username);
	public boolean login(Users user);
	public Users selectByUsername(String username);
	public Users loginAndGetUser(String username, String password);
}
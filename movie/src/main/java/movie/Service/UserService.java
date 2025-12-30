package movie.Service;

import movie.DTO.Users;

<<<<<<< HEAD
public interface UserService extends BaseService<Users>{

	public int signup(Users user);
=======
public interface UserService extends BaseService<Users> {
	public int join(Users user);
>>>>>>> refs/heads/main
	public boolean idCheck(String username);
	public boolean login(Users user);
	public Users selectByUsername(String username);
<<<<<<< HEAD
	public Users loginAndGetUser(String username, String password);
=======
	
	
>>>>>>> refs/heads/main
}
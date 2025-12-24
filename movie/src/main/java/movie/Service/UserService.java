package movie.Service;

import movie.DTO.Users;

public interface UserService {
	public int join(Users user);
	public boolean idCheck(String username);
	public boolean login(Users user);
	public Users selectByUsername(String username);
}
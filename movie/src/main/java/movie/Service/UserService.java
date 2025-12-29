package movie.Service;

import movie.DTO.Users;

public interface UserService {
	//회원가입
	public int signup(Users user);
	
	//ID 중복확인
	public boolean idCheck(String username);
	public boolean login(Users user);
	public Users selectByUsername(String username);
}
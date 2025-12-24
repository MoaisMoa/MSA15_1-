package board.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mindrot.jbcrypt.BCrypt;


import board.DAO.UsersDAO;
import board.DTO.Movie;
import board.DTO.Users;

public class UsersServiceImpl implements UsersService {
	
	private UsersDAO usersDAO = new UsersDAO();

	@Override
	public int join(Users user) {
		try {
			// 비밀번호 암호화
			String password = user.getPassword();
			String encodedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
			user.setPassword(encodedPassword);
			// 회원 등록
			int result = usersDAO.insert(user);
			
			return result;		// 등록 성공
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;				// 등록 실패
	}

	@Override
	public boolean idCheck(String username) {
		Map<String, Object> map = new HashMap<>();
		map.put("username", username);
		
		Object user = null;
		try {
			user = usersDAO.selectBy(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 아이디 중복X
		if( user == null ) {
			return false;
		}
		return true;
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

}
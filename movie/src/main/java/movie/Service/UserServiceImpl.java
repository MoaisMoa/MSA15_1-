package movie.Service;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.mindrot.jbcrypt.BCrypt;

import movie.DAO.UserDAO;
import movie.DTO.Users;

public class UserServiceImpl extends BaseServiceImpl<UserDAO, Users> implements UserService {

public UserServiceImpl(UserDAO dao) {
		super(dao);
	}

	@Override
	public int signup(Users user) {
		
		try {
			user.setId(UUID.randomUUID().toString());
			String username = user.getUsername();
			String password = user.getPassword();
			String encodedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
			user.setPassword(encodedPassword);
			user.setUsername(username);
			//회원 등록
			System.out.println("signup 비밀번호 암호화 햇다!");
//			int result = dao.insert(user);
			System.out.println("DEBUG username = " + user.getUsername());
			//등록 성공
			return dao.insert(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public boolean idCheck(String username) {
		Map<String, Object> map = new HashMap<>();
		map.put("username", username);
		Object user = null;
		try {
			user = dao.selectBy(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		//ID 중복 X
		if(user == null) {
			return false;
		}
		return true;
	}

	@Override
	public boolean login(Users user) {
		String username = user.getUsername();
		String password = user.getPassword();
		
		Map<String, Object> map = new HashMap<>();
		map.put("username", username);
		
		Users joinedUser = null;
		try {
			joinedUser = dao.selectBy(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		//아이디가 존재하지 않을 경우에
		if(joinedUser == null) {
			return false;
		}
		//비밀번호 일치 여부 확인
		String joinedPassword = joinedUser.getPassword();
		boolean result = BCrypt.checkpw(password, joinedPassword);
		return result;
	}

	@Override
	public Users selectByUsername(String username) {
		Map<String, Object> map = new HashMap<>();
		map.put("username",username);
		Users user = null;
		try {
			user = dao.selectBy(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}
}
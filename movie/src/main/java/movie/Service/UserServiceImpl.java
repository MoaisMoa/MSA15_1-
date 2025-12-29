package movie.Service;

import java.util.HashMap;
import java.util.Map;

import org.mindrot.jbcrypt.BCrypt;

import movie.DAO.UserDAO;
import movie.DTO.Users;

public class UserServiceImpl extends BaseServiceImpl<UserDAO, Users> implements UserService {

public UserServiceImpl(UserDAO dao) {
		super(dao);
		
	}


private UserDAO userDAO = new UserDAO();

	@Override
	public int signup(Users user) {
		
		//username(로그인ID) 중복체크
//		if(idCheck(user.getUsername())) {
//			throw new IllegalStateException("이미 사용 중인 아이디 입니다");
//		}
//		user.setUsername(UUID.randomUUID().toString());
		
//		if(user.getRole()==null||user.getRole().isEmpty()) {
//			user.setRole("USER");
//		}
//		userDAO.insert(user);
		try {
			String password = user.getPassword();
			String encodedPassword = BCrypt.hashpw(password,BCrypt.gensalt());
			user.setPassword(encodedPassword);
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
		Map<String,Object> map = new HashMap<>();
		map.put("username", username);
		Users user = null;
		try {
			user = dao.selectBy(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}
}
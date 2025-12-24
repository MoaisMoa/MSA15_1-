package Service;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import DAO.PersistenceLoginsDAO;
import DTO.PersistenceLogins;

public class PersistenceLoginsServiceImpl implements PersistenceLoginsService {

	private PersistenceLoginsDAO persistenceLoginsDAO = new PersistenceLoginsDAO();
	
	@Override
	public PersistenceLogins insert(String username) {
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.DAY_OF_YEAR, 7);
		Date expiryDate = calendar.getTime();
		
		PersistenceLogins login = PersistenceLogins.builder()
												   .id(UUID.randomUUID().toString())
												   .username(username)
												   .token(UUID.randomUUID().toString())
												   .expiryDate(expiryDate)
												   .build();
		try {
			login = persistenceLoginsDAO.insertKey(login);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return login;
	}

	@Override
	public PersistenceLogins select(String username) {
		PersistenceLogins login = null;
		Map<String, Object> map = new HashMap<>();
		map.put("username",username);
		try {
			login = persistenceLoginsDAO.selectBy(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return login;
	}

	@Override
	public PersistenceLogins selectByToken(String token) {
		PersistenceLogins login = null;
		Map<String, Object> map = new HashMap<>();
		map.put("token", token);
		try {
			login = persistenceLoginsDAO.selectBy(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return login;
	}

	@Override
	public PersistenceLogins update(String username) {
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.DAY_OF_YEAR, 7);
		Date expiryDate = calendar.getTime();
		PersistenceLogins login = PersistenceLogins.builder()
												   .id(UUID.randomUUID().toString())
												   .username(username)
												   .expiryDate(expiryDate)
												   .updatedAt(new Date())
												   .build();
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("username", username);
		PersistenceLogins origin = null;
		int result = 0;
		try {
			origin = persistenceLoginsDAO.selectBy(map);
			login.setNo(origin.getNo());
			login.setToken(origin.getToken());
			result = persistenceLoginsDAO.update(login);
			System.out.println("토큰 수정 여부 : "+result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return login;
	}
	
	@Override
	public PersistenceLogins refresh(String username) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("username", username);
		PersistenceLogins origin = null;
		PersistenceLogins refresh = null;
		
		try {
			origin = persistenceLoginsDAO.selectBy(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(origin==null) {
			refresh = insert(username);
		} else {
			refresh = update(username);
		}
		return refresh;
	}
	

	@Override
	public boolean isValid(String token) {
		PersistenceLogins login = selectByToken(token);
		if(login == null) return false;
		Date expiryDate = login.getExpiryDate();
		Date now = new Date();
		return expiryDate.after(now);
	}

	@Override
	public boolean delete(String username) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("username", username);
		int result = 0;
		try {
			result = persistenceLoginsDAO.deleteBy(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result > 0;
	}
}
package movie.Service;

import DTO.PersistenceLogins;

public interface PersistenceLoginsService {
	public PersistenceLogins insert(String username);
	public PersistenceLogins select(String username);
	public PersistenceLogins selectByToken(String token);
	public PersistenceLogins update(String username);
	public PersistenceLogins refresh(String username);
	public boolean isValid(String token);
	public boolean delete(String username);
}
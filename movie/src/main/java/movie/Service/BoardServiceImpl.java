package movie.Service;

import movie.DAO.BoardDAO;
import movie.DTO.Board;

public class BoardServiceImpl extends BaseServiceImpl<BoardDAO, Board> implements BoardService {

	public BoardServiceImpl(BoardDAO dao) {
		super(dao);
	}

}
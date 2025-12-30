package movie.Service;

import movie.DAO.ReviewDAO;
import movie.DTO.Review;

public class ReviewServiceImpl extends BaseServiceImpl<ReviewDAO, Review> implements ReviewService {

    public ReviewServiceImpl(ReviewDAO dao) {
        super(dao);
    }

}

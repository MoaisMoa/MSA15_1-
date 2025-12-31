package movie.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import movie.DAO.ReviewDAO;
import movie.DTO.Review;

public class ReviewServiceImpl extends BaseServiceImpl<ReviewDAO, Review> implements ReviewService {

    public ReviewServiceImpl(ReviewDAO dao) {
        super(dao);
    }


    @Override
    public List<Review> selectByUserId(int userId) {
        try {
            List<Review> allReviews = dao.list();  // DAO는 전체 리뷰 조회
            List<Review> userReviews = new java.util.ArrayList<>();
            for (Review r : allReviews) {
                if (r.getUserId() == userId) {
                    userReviews.add(r);
                }
            }
            return userReviews;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }


    
}

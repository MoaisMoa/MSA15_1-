package movie.Service;

import java.util.List;
import movie.DTO.Review;

public interface ReviewService extends BaseService<Review> {
    List<Review> selectByUserId(int userId);
}

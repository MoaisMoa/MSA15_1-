package movie.Service;

import java.util.List;
import java.util.Map;

import movie.DTO.Movie;

public interface MovieService extends BaseService<Movie> {

	Movie insertKey(Movie movie);
	
	Movie selectBy(Map<String, Object> map);
	
	Movie searchBy(String keyword);

}

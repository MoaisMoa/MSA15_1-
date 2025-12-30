package movie.Service;

import java.util.Map;

import movie.DTO.Movie;

public interface MovieService extends BaseService<Movie> {

	Movie insertKey(Movie movie);
	
	Movie selectBy(Map<String, Object> map);

}

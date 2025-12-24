package board.Service;

import java.util.List;

import board.DTO.Movie;


public interface MovieService {
	
	List<Movie> list();
	void insert(Movie movie);

}

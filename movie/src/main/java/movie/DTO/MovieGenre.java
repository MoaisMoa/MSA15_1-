package movie.DTO;

import com.alohaclass.jdbc.annotation.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table("movie_genre")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MovieGenre {

    private int movieId;
    private String genre;
}

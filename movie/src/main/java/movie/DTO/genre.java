package movie.DTO;

import java.util.Date;

import com.alohaclass.jdbc.annotation.Pk;
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
public class genre {

    @Pk
    private int movieId;
    private String genre;
}

